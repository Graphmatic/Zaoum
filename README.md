# Zaoum

Firmware for MIOS based Dual analog Multimode filter with digital modulations.

The analog filters of the prototype are using CEM3378 Analog Filter & VCA ICs, unfortunately this chips are now impossible to source, even for a high price :-(

cem3378/79 : http://www.buchty.net/ensoniq/files/cem3379.pdf

It's seems that the Multimode filter CEM3320 chip have been reissued at a reasonable price (info here:
http://www.synthfool.com/docs/Digisound/Digisound_manuals/80_6.pdf
reissue:
https://www.thonk.co.uk/shop/cem3320/
...so maybe it could be a solution to make this project back from Limbo, but it does not have VCAs and need far more side components...

Can not work as it only using MIDIbox Aout or others MB modules, some modulations (LFOs, EGs...) are mixed (inter-modulated) directly inside the code, but some others are duplicated/mixed/merged with hardware summing or distributors using VCAs after the D/A conversion: in most cases, the DOUT triggering functions act on TTL switches which control the analog signals routing. Make this in analog domain avoid to require to much processing from the PIC microcontroller. But a new version using the last MB core module CORE_STM32F4 would probably allow to do most of modulations processing directly from software.

Using TTL switch, even if it's hard to make them 100% "clickless" (without any artifact click sound when switching), modulations happening in the analog domain are instantaneously re-callable and can be saved as presets in the Bankstick memory module. The UI have been done so you can recall 8*8 presets with one or two press, no menu scrolling.

![zaoum_filter_cad](https://user-images.githubusercontent.com/6513268/224491011-06ada94a-5711-4a95-9e02-94f81bc9c3a8.jpg)

![post-3821-046405500 1304327920](https://user-images.githubusercontent.com/6513268/224491026-478b33bc-3515-44d6-9780-3e2192e58fcc.jpg)

![post-3821-006057000 1304327933](https://user-images.githubusercontent.com/6513268/224491033-7c688864-9aca-435d-81a6-c54d47c01b41.jpg)


some more info on the original MIDIbox forum post:
http://midibox.org/forums/topic/9943-the-mox-philteranalog-toolbox-based/



another one of my MIDIbox projects : MB_SEQ V2:
![florian1](https://user-images.githubusercontent.com/6513268/224491552-1c1923c0-46ea-4b8a-94a7-533a1eb918c3.jpg)
