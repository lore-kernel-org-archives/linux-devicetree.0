From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Mon, 30 Mar 2015 15:27:27 +0200
Message-ID: <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20150319191834.5346CC40A35@trevor.secretlab.ca>
	<8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com>
	<CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com>
	<1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1B3AF599-4A64-4FB0-BFB0-0C0544917C6C-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Tue, Mar 24, 2015 at 6:56 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> On Mar 24, 2015, at 07:50 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org=
> wrote:
>> On Fri, Mar 20, 2015 at 12:39 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> On Mar 19, 2015, at 21:18 , Grant Likely <grant.likely@secretlab.c=
a> wrote:
>>>> On Tue, 16 Dec 2014 14:11:31 +0200
>>>> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>>> wrote:
>>>>> A nice side-effect of the changes in DTC for supporting overlays
>>>>> is that it is now possible to do dependency tracking of platform
>>>>> devices automatically.
>>>>>
>>>>> This patch implements dependency aware probe order for users
>>>>> of of_platform_populate.
>>>>>
>>>>> There are no changes in the syntax of the DTS bindings, the
>>>>> dependency is generated automatically by the use of phandle
>>>>> references.
>>>>
>>>> Do you have measurements showing improvement? Conceptually, I don'=
t have
>>>> a problem with having a small scale solution like this, but I want=
 proof
>>>> that it actively makes things better, and is worth the extra compl=
exity.
>>>> It's not an easy block of code to understand.
>>>
>>> I will be the first to admit that the code it=E2=80=99s a bit hard =
to follow, but
>>> that=E2=80=99s the nature of trees and recursion.
>>>
>>> FWIW I=E2=80=99ve been booting with this applied for a month with n=
o adverse effects,
>>> besides the fact that there dependency cycles which I would file as=
 a bug.
>>
>> IIUC, this would fix the issue I worked around in "ARM: shmobile: r8=
a73a4:
>> Move pfc node to work around probe ordering bug"?
>> https://git.kernel.org/cgit/linux/kernel/git/horms/renesas.git/commi=
t/?h=3Dr8a73a4-ccf-and-multiplatform-for-v4.1&id=3De4ba0a9bddff3ba52cec=
100414d2f178440efc91
>
> A victim^Wtester! Yeah, it=E2=80=99s supposed to do that, but no guar=
antees, this is an RFC.
>
> I would be happy to know if it solves your problem or not, please kee=
p me in the loop.
>
>> I'll give it a try when I'm back from ELC...

And so I did. I
  1. Moved the pfc node in arch/arm/boot/dts/r8a73a4.dtsi back between =
dmac
     and i2c5.
  2. Applied your patch,
  3. Disabled the check for "/__local_fixups__" in
     __of_platform_populate_scan().
  4. Added support for "interrupts-extended" (gmail-whitespace-damaged =
patch
     at the end of this email),
  5. Enabled DEBUG,
  6. Uncommented all your debug pr_info() calls (except the one for
     "interrupts", as it references non-existing variables!).

But it didn't make any difference. The debug log below shows that it de=
tects
the dependency of pfc@e6050000 on irqc0 (interrupt-controller@e61c0000)
irqc1 (interrupt-controller@e61c0200), but it doesn't reorder the nodes=
,
so pfc is still initialized first:

/
/ptm
/timer
    interrupt has parent /interrupt-controller@f1001000
/cache-controller@0
/cache-controller@1
/memory-controller@e6790000
/memory-controller@e67a0000
/dma-multiplexer
/pfc@e6050000
    interrupts-extended[0] has parent /interrupt-controller@e61c0000
    interrupts-extended[1] has parent /interrupt-controller@e61c0000
    interrupts-extended[2] has parent /interrupt-controller@e61c0000
    interrupts-extended[3] has parent /interrupt-controller@e61c0000
    interrupts-extended[4] has parent /interrupt-controller@e61c0000
    interrupts-extended[5] has parent /interrupt-controller@e61c0000
    interrupts-extended[6] has parent /interrupt-controller@e61c0000
    interrupts-extended[7] has parent /interrupt-controller@e61c0000
    interrupts-extended[8] has parent /interrupt-controller@e61c0000
    interrupts-extended[9] has parent /interrupt-controller@e61c0000
    interrupts-extended[10] has parent /interrupt-controller@e61c0000
    interrupts-extended[11] has parent /interrupt-controller@e61c0000
    interrupts-extended[12] has parent /interrupt-controller@e61c0000
    interrupts-extended[13] has parent /interrupt-controller@e61c0000
    interrupts-extended[14] has parent /interrupt-controller@e61c0000
    interrupts-extended[15] has parent /interrupt-controller@e61c0000
    interrupts-extended[16] has parent /interrupt-controller@e61c0000
    interrupts-extended[17] has parent /interrupt-controller@e61c0000
    interrupts-extended[18] has parent /interrupt-controller@e61c0000
    interrupts-extended[19] has parent /interrupt-controller@e61c0000
    interrupts-extended[20] has parent /interrupt-controller@e61c0000
    interrupts-extended[21] has parent /interrupt-controller@e61c0000
    interrupts-extended[22] has parent /interrupt-controller@e61c0000
    interrupts-extended[23] has parent /interrupt-controller@e61c0000
    interrupts-extended[24] has parent /interrupt-controller@e61c0000
    interrupts-extended[25] has parent /interrupt-controller@e61c0000
    interrupts-extended[26] has parent /interrupt-controller@e61c0000
    interrupts-extended[27] has parent /interrupt-controller@e61c0000
    interrupts-extended[28] has parent /interrupt-controller@e61c0000
    interrupts-extended[29] has parent /interrupt-controller@e61c0000
    interrupts-extended[30] has parent /interrupt-controller@e61c0000
    interrupts-extended[31] has parent /interrupt-controller@e61c0000
    interrupts-extended[32] has parent /interrupt-controller@e61c0200
    interrupts-extended[33] has parent /interrupt-controller@e61c0200
    interrupts-extended[34] has parent /interrupt-controller@e61c0200
    interrupts-extended[35] has parent /interrupt-controller@e61c0200
    interrupts-extended[36] has parent /interrupt-controller@e61c0200
    interrupts-extended[37] has parent /interrupt-controller@e61c0200
    interrupts-extended[38] has parent /interrupt-controller@e61c0200
    interrupts-extended[39] has parent /interrupt-controller@e61c0200
    interrupts-extended[40] has parent /interrupt-controller@e61c0200
    interrupts-extended[41] has parent /interrupt-controller@e61c0200
    interrupts-extended[42] has parent /interrupt-controller@e61c0200
    interrupts-extended[43] has parent /interrupt-controller@e61c0200
    interrupts-extended[44] has parent /interrupt-controller@e61c0200
    interrupts-extended[45] has parent /interrupt-controller@e61c0200
    interrupts-extended[46] has parent /interrupt-controller@e61c0200
    interrupts-extended[47] has parent /interrupt-controller@e61c0200
    interrupts-extended[48] has parent /interrupt-controller@e61c0200
    interrupts-extended[49] has parent /interrupt-controller@e61c0200
    interrupts-extended[50] has parent /interrupt-controller@e61c0200
    interrupts-extended[51] has parent /interrupt-controller@e61c0200
    interrupts-extended[52] has parent /interrupt-controller@e61c0200
    interrupts-extended[53] has parent /interrupt-controller@e61c0200
    interrupts-extended[54] has parent /interrupt-controller@e61c0200
    interrupts-extended[55] has parent /interrupt-controller@e61c0200
    interrupts-extended[56] has parent /interrupt-controller@e61c0200
    interrupts-extended[57] has parent /interrupt-controller@e61c0200
/i2c@e60b0000
    interrupt has parent /interrupt-controller@f1001000
/timer@e6130000
    interrupt has parent /interrupt-controller@f1001000
/interrupt-controller@e61c0000
    interrupt has parent /interrupt-controller@f1001000
/interrupt-controller@e61c0200
    interrupt has parent /interrupt-controller@f1001000
/thermal@e61f0000
    interrupt has parent /interrupt-controller@f1001000
/serial@e6c40000
    interrupt has parent /interrupt-controller@f1001000
/sd@ee100000
    interrupt has parent /interrupt-controller@f1001000
/sd@ee120000
    interrupt has parent /interrupt-controller@f1001000
/mmc@ee200000
    interrupt has parent /interrupt-controller@f1001000
/interrupt-controller@f1001000
    interrupt has parent /interrupt-controller@f1001000
/bus@fec10000
/system-controller@e6180000
/regulator@0
/regulator@1
/regulator@2
/regulator@3
/leds
/keyboard
* /timer depends on /interrupt-controller@f1001000
* /pfc@e6050000 depends on /interrupt-controller@e61c0000
* /pfc@e6050000 depends on /interrupt-controller@e61c0200
* /i2c@e60b0000 depends on /interrupt-controller@f1001000
* /timer@e6130000 depends on /interrupt-controller@f1001000
* /interrupt-controller@e61c0000 depends on /interrupt-controller@f1001=
000
* /interrupt-controller@e61c0200 depends on /interrupt-controller@f1001=
000
* /thermal@e61f0000 depends on /interrupt-controller@f1001000
* /serial@e6c40000 depends on /interrupt-controller@f1001000
* /sd@ee100000 depends on /interrupt-controller@f1001000
* /sd@ee120000 depends on /interrupt-controller@f1001000
* /mmc@ee200000 depends on /interrupt-controller@f1001000
| PLT  @/ (0) - count=3D26
| PLT      @/ptm (0) - count=3D0
| PLT      @/timer (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/cache-controller@0 (0) - count=3D0
| PLT      @/cache-controller@1 (0) - count=3D0
| PLT      @/memory-controller@e6790000 (0) - count=3D0
| PLT      @/memory-controller@e67a0000 (0) - count=3D0
| PLT      @/dma-multiplexer (0) - count=3D0
| PLT      @/pfc@e6050000 (0) - count=3D0
+          @/interrupt-controller@e61c0000
+          @/interrupt-controller@e61c0200
>          @/interrupt-controller@e61c0000
>          @/interrupt-controller@e61c0200
| PLT      @/i2c@e60b0000 (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/timer@e6130000 (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/interrupt-controller@e61c0000 (1) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/interrupt-controller@e61c0200 (1) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/thermal@e61f0000 (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/serial@e6c40000 (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/sd@ee100000 (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/sd@ee120000 (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/mmc@ee200000 (0) - count=3D0
+          @/interrupt-controller@f1001000
>          @/interrupt-controller@f1001000
| PLT      @/interrupt-controller@f1001000 (10) - count=3D0
+          @/interrupt-controller@f1001000
| PLT      @/bus@fec10000 (0) - count=3D0
| PLT      @/system-controller@e6180000 (0) - count=3D0
| PLT      @/regulator@0 (0) - count=3D0
| PLT      @/regulator@1 (0) - count=3D0
| PLT      @/regulator@2 (0) - count=3D0
| PLT      @/regulator@3 (0) - count=3D0
| PLT      @/leds (0) - count=3D0
| PLT      @/keyboard (0) - count=3D0
* PLT  @/ (0) - sort-count=3D26 - id=3D0
* PLT      @/ptm (0) - sort-count=3D0 - id=3D1
* PLT      @/interrupt-controller@f1001000 (10) - sort-count=3D0 - id=3D=
2
* PLT      @/timer (0) - sort-count=3D0 - id=3D3
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/cache-controller@0 (0) - sort-count=3D0 - id=3D4
* PLT      @/cache-controller@1 (0) - sort-count=3D0 - id=3D5
* PLT      @/memory-controller@e6790000 (0) - sort-count=3D0 - id=3D6
* PLT      @/memory-controller@e67a0000 (0) - sort-count=3D0 - id=3D7
* PLT      @/dma-multiplexer (0) - sort-count=3D0 - id=3D8
* PLT      @/interrupt-controller@e61c0000 (1) - sort-count=3D0 - id=3D=
9
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/interrupt-controller@e61c0200 (1) - sort-count=3D0 - id=3D=
10
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/pfc@e6050000 (0) - sort-count=3D0 - id=3D11
%          @/interrupt-controller@e61c0000 - id=3D9
%          @/interrupt-controller@e61c0200 - id=3D10
* PLT      @/i2c@e60b0000 (0) - sort-count=3D0 - id=3D12
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/timer@e6130000 (0) - sort-count=3D0 - id=3D13
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/thermal@e61f0000 (0) - sort-count=3D0 - id=3D14
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/serial@e6c40000 (0) - sort-count=3D0 - id=3D15
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/sd@ee100000 (0) - sort-count=3D0 - id=3D16
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/sd@ee120000 (0) - sort-count=3D0 - id=3D17
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/mmc@ee200000 (0) - sort-count=3D0 - id=3D18
%          @/interrupt-controller@f1001000 - id=3D2
* PLT      @/bus@fec10000 (0) - sort-count=3D0 - id=3D19
* PLT      @/system-controller@e6180000 (0) - sort-count=3D0 - id=3D20
* PLT      @/regulator@0 (0) - sort-count=3D0 - id=3D21
* PLT      @/regulator@1 (0) - sort-count=3D0 - id=3D22
* PLT      @/regulator@2 (0) - sort-count=3D0 - id=3D23
* PLT      @/regulator@3 (0) - sort-count=3D0 - id=3D24
* PLT      @/leds (0) - sort-count=3D0 - id=3D25
* PLT      @/keyboard (0) - sort-count=3D0 - id=3D26
of_platform_device_create_pdata(/ptm, <NULL>, ..)
platform ptm: device is not dma coherent
platform ptm: device is not behind an iommu
of_platform_device_create_pdata(/timer, <NULL>, ..)
platform timer: device is not dma coherent
platform timer: device is not behind an iommu
of_platform_device_create_pdata(/cache-controller@0, <NULL>, ..)
platform cache-controller@0: device is not dma coherent
platform cache-controller@0: device is not behind an iommu
of_platform_device_create_pdata(/cache-controller@1, <NULL>, ..)
platform cache-controller@1: device is not dma coherent
platform cache-controller@1: device is not behind an iommu
of_platform_device_create_pdata(/memory-controller@e6790000, <NULL>, ..=
)
platform e6790000.memory-controller: device is not dma coherent
platform e6790000.memory-controller: device is not behind an iommu
of_platform_device_create_pdata(/memory-controller@e67a0000, <NULL>, ..=
)
platform e67a0000.memory-controller: device is not dma coherent
platform e67a0000.memory-controller: device is not behind an iommu
of_platform_device_create_pdata(/dma-multiplexer, <NULL>, ..)
platform dma-multiplexer: device is not dma coherent
platform dma-multiplexer: device is not behind an iommu
of_platform_device_create_pdata(/pfc@e6050000, <NULL>, ..)
irq: no irq domain found for /interrupt-controller@e61c0000 !
not all legacy IRQ resources mapped for pfc
platform e6050000.pfc: device is not dma coherent
platform e6050000.pfc: device is not behind an iommu
sh-pfc e6050000.pfc: r8a73a4_pfc handling gpio 0 -> 329
sh-pfc e6050000.pfc: r8a73a4_pfc support registered
of_platform_device_create_pdata(/i2c@e60b0000, <NULL>, ..)
platform e60b0000.i2c: device is not dma coherent
platform e60b0000.i2c: device is not behind an iommu
of_platform_device_create_pdata(/timer@e6130000, <NULL>, ..)
platform e6130000.timer: device is not dma coherent
platform e6130000.timer: device is not behind an iommu
of_platform_device_create_pdata(/interrupt-controller@e61c0000, <NULL>,=
 ..)
platform e61c0000.interrupt-controller: device is not dma coherent
platform e61c0000.interrupt-controller: device is not behind an iommu
renesas_irqc e61c0000.interrupt-controller: driving 32 irqs
of_platform_device_create_pdata(/interrupt-controller@e61c0200, <NULL>,=
 ..)
platform e61c0200.interrupt-controller: device is not dma coherent
platform e61c0200.interrupt-controller: device is not behind an iommu
renesas_irqc e61c0200.interrupt-controller: driving 26 irqs
of_platform_device_create_pdata(/thermal@e61f0000, <NULL>, ..)
platform e61f0000.thermal: device is not dma coherent
platform e61f0000.thermal: device is not behind an iommu
of_platform_device_create_pdata(/serial@e6c40000, <NULL>, ..)
platform e6c40000.serial: device is not dma coherent
platform e6c40000.serial: device is not behind an iommu
of_platform_device_create_pdata(/sd@ee100000, <NULL>, ..)
platform ee100000.sd: device is not dma coherent
platform ee100000.sd: device is not behind an iommu
of_platform_device_create_pdata(/sd@ee120000, <NULL>, ..)
platform ee120000.sd: device is not dma coherent
platform ee120000.sd: device is not behind an iommu
of_platform_device_create_pdata(/mmc@ee200000, <NULL>, ..)
platform ee200000.mmc: device is not dma coherent
platform ee200000.mmc: device is not behind an iommu
of_platform_device_create_pdata(/interrupt-controller@f1001000, <NULL>,=
 ..)
platform f1001000.interrupt-controller: device is not dma coherent
platform f1001000.interrupt-controller: device is not behind an iommu
of_platform_device_create_pdata(/bus@fec10000, <NULL>, ..)
platform fec10000.bus: device is not dma coherent
platform fec10000.bus: device is not behind an iommu
of_platform_device_create_pdata(/system-controller@e6180000, <NULL>, ..=
)
platform e6180000.system-controller: device is not dma coherent
platform e6180000.system-controller: device is not behind an iommu
of_platform_device_create_pdata(/regulator@0, <NULL>, ..)
platform regulator@0: device is not dma coherent
platform regulator@0: device is not behind an iommu
of_platform_device_create_pdata(/regulator@1, <NULL>, ..)
platform regulator@1: device is not dma coherent
platform regulator@1: device is not behind an iommu
of_platform_device_create_pdata(/regulator@2, <NULL>, ..)
platform regulator@2: device is not dma coherent
platform regulator@2: device is not behind an iommu
of_platform_device_create_pdata(/regulator@3, <NULL>, ..)
platform regulator@3: device is not dma coherent
platform regulator@3: device is not behind an iommu
of_platform_device_create_pdata(/leds, <NULL>, ..)
platform leds: device is not dma coherent
platform leds: device is not behind an iommu
of_platform_device_create_pdata(/keyboard, <NULL>, ..)
platform keyboard: device is not dma coherent
platform keyboard: device is not behind an iommu
No ATAGs?
hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint regist=
ers.
hw-breakpoint: maximum watchpoint size is 8 bytes.
i2c-sh_mobile e60b0000.i2c: I2C adapter 0, bus speed 100000 Hz
sh_cmt e6130000.timer: ch0: used for clock events
sh_cmt e6130000.timer: ch1: used as clock source
Switched to clocksource arch_sys_counter
NET: Registered protocol family 2
TCP established hash table entries: 8192 (order: 3, 32768 bytes)
TCP bind hash table entries: 8192 (order: 6, 294912 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
UDP hash table entries: 512 (order: 3, 40960 bytes)
UDP-Lite hash table entries: 512 (order: 3, 40960 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
futex hash table entries: 2048 (order: 5, 131072 bytes)
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
nfs4filelayout_init: NFSv4 File Layout Driver Registering...
nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
io scheduler noop registered (default)
/bus@fec10000
/bus@fec10000/ethernet@8000000
    interrupt has parent /interrupt-controller@e61c0200
| PLT  @/bus@fec10000 (0) - count=3D1
| PLT      @/bus@fec10000/ethernet@8000000 (0) - count=3D0
+          @/interrupt-controller@e61c0200
* PLT  @/bus@fec10000 (0) - sort-count=3D1 - id=3D0
* PLT      @/bus@fec10000/ethernet@8000000 (0) - sort-count=3D0 - id=3D=
1
of_platform_device_create_pdata(/bus@fec10000/ethernet@8000000, <NULL>,=
 ..)
platform 8000000.ethernet: device is not dma coherent
platform 8000000.ethernet: device is not behind an iommu
/dma-multiplexer
/dma-multiplexer/dma-controller@e6700020
    interrupt has parent /interrupt-controller@f1001000
| PLT  @/dma-multiplexer (0) - count=3D1
| PLT      @/dma-multiplexer/dma-controller@e6700020 (0) - count=3D0
+          @/interrupt-controller@f1001000
* PLT  @/dma-multiplexer (0) - sort-count=3D1 - id=3D0
* PLT      @/dma-multiplexer/dma-controller@e6700020 (0) - sort-count=3D=
0 - id=3D1
of_platform_device_create_pdata(/dma-multiplexer/dma-controller@e670002=
0,
<NULL>, ..)
platform e6700020.dma-controller: device is not dma coherent
platform e6700020.dma-controller: device is not behind an iommu

Both the pfc and irqc drivers are initialized from postcore_initcall().

If there's anything else I can try, please let me know.
Thanks!

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 9f71741405c2f008..886eef44fd5a3f47 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -610,7 +611,9 @@ static void __local_fixup_ref(struct of_pop_entry
*pe, struct device_node *lfnp)
 static void __of_platform_populate_get_refs_internal(struct of_pop_ent=
ry *pe)
 {
        struct device_node *np;
+       struct of_phandle_args irq;
        struct of_pop_ref_entry *re;
+       int index;
        char *base;
        bool found;

@@ -626,9 +629,39 @@ static void
__of_platform_populate_get_refs_internal(struct of_pop_entry *pe)
                kfree(base);
        }

+pr_info("%s\n", pe->np->full_name);
+       /* then try the new-style interrupts-extended */
+       for (index =3D 0;
+            !of_parse_phandle_with_args(pe->np, "interrupts-extended",
+                                        "#interrupt-cells", index, &ir=
q);
+            index++) {
+               np =3D irq.np;
+pr_info("    interrupts-extended[%d] has parent %s\n", index, np->full=
_name);
+
+               /* check whether the ref is already there */
+               found =3D false;
+               list_for_each_entry(re, &pe->refs, node) {
+                       if (re->np =3D=3D np) {
+                               found =3D true;
+                               break;
+                       }
+               }
+
+               if (!found) {
+                       re =3D kzalloc(sizeof(*re), GFP_KERNEL);
+                       BUG_ON(re =3D=3D NULL);
+                       re->np =3D np;
+                       list_add_tail(&re->node, &pe->refs);
+
+               }
+
+               of_node_put(np);
+       }
+
        /* now try the old style interrupt */
        if (of_get_property(pe->np, "interrupts", NULL) &&
                        (np =3D of_irq_find_parent(pe->np)) !=3D NULL) =
{
+pr_info("    interrupt has parent %s\n", np->full_name);

                /* check whether the ref is already there */
                found =3D false;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
