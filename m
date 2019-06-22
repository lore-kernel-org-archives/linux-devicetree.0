From: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: [PATCH v2] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Fri, 21 Jun 2019 19:33:27 -0500
Message-ID: <A3E7D245-ABFA-4D81-87D6-3F6983AA3A93@sifive.com>
References: <1561114429-29612-1-git-send-email-yash.shah@sifive.com>
 <1561114429-29612-2-git-send-email-yash.shah@sifive.com>
 <18c7992607dd1fed062bd295ac0738a759eff078.camel@wdc.com>
 <CAF5mof3QB8C7VjOyEvCsf9NEDkJhV3cBO5sBD+8z-GrWrnrAyg@mail.gmail.com>
 <3f91c8032e113a19dcec10ca71b017af1427ef7e.camel@wdc.com>
 <43da99709709d2a480b78f25356cda9255205372.camel@wdc.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <43da99709709d2a480b78f25356cda9255205372.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <Atish.Patra@wdc.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "yash.shah@sifive.com" <yash.shah@sifive.com>, "palmer@sifive.com" <palmer@sifive.com>
List-Id: devicetree@vger.kernel.org



> On Jun 21, 2019, at 4:59 PM, Atish Patra <Atish.Patra@wdc.com> wrote:
> 
> On Fri, 2019-06-21 at 14:46 -0700, Atish Patra wrote:
>> On Fri, 2019-06-21 at 14:18 -0500, Troy Benjegerdes wrote:
>>> Can you post the fsbl and other images you used to boot/test this?
>>> 
>> 
> 
> Resending it without the attachment. Obviously, the mail did not go
> through with the binary blob attached :( :(. My bad.
> 
> Let me know if you still want me to share the binary with you. I will
> probably share it via some other method.

The bl came through as it was sent direct to me, and I can deal with
the tftp config manually. I have a kernel image, but not the boot.scr.uimg
that it looks like you are using. Is that from Yocto?

> 
>> I have not changed fsbl. It's the default one came with the board.
>> Here are the heads of OpenSBI + U-Boot + Linux repo.
>> 
>> OpenSBI: cd2dfdc870ed (master)
>> U-boot: 77f6e2dd0551 + Anup's patch series (v4)
>> https://github.com/atishp04/u-boot/tree/unleashed_working
>> 
>> Linux: bed3c0d84e7e + Yash's Macb Series + this patch
>> https://github.com/atishp04/linux/tree/5.2-rc6-pre
>> 
>> I have also attached the OpenSBI + U-boot binary as well. But this is
>> pre-configured with my tftpboot server. You need to change that.
>> 
>>> I keep running into various failures when I build from source and I
>>> want to rule out potential hardware issues related to clock and/or
>>> ddr initialization
>>> 
>>> On Fri, Jun 21, 2019, 2:14 PM Atish Patra <Atish.Patra@wdc.com>
>>> wrote:
>>>> On Fri, 2019-06-21 at 16:23 +0530, Yash Shah wrote:
>>>>> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver
>>>> added
>>>>> Signed-off-by: Yash Shah <yash.shah@sifive.com>
>>>>> ---
>>>>> arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 16
>>>>> ++++++++++++++++
>>>>> arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  9
>>>> +++++++++
>>>>> 2 files changed, 25 insertions(+)
>>>>> 
>>>>> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>>>>> b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>>>>> index 4e8fbde..c53b4ea 100644
>>>>> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>>>>> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>>>>> @@ -225,5 +225,21 @@
>>>>>                      #address-cells = <1>;
>>>>>                      #size-cells = <0>;
>>>>>              };
>>>>> +             eth0: ethernet@10090000 {
>>>>> +                     compatible = "sifive,fu540-macb";
>>>>> +                     interrupt-parent = <&plic0>;
>>>>> +                     interrupts = <53>;
>>>>> +                     reg = <0x0 0x10090000 0x0 0x2000
>>>>> +                            0x0 0x100a0000 0x0 0x1000>;
>>>>> +                     reg-names = "control";
>>>>> +                     status = "disabled";
>>>>> +                     local-mac-address = [00 00 00 00 00 00];
>>>>> +                     clock-names = "pclk", "hclk";
>>>>> +                     clocks = <&prci PRCI_CLK_GEMGXLPLL>,
>>>>> +                              <&prci PRCI_CLK_GEMGXLPLL>;
>>>>> +                     #address-cells = <1>;
>>>>> +                     #size-cells = <0>;
>>>>> +             };
>>>>> +
>>>>>      };
>>>>> };
>>>>> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-
>>>>> a00.dts
>>>>> b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
>>>>> index 4da8870..d783bf2 100644
>>>>> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
>>>>> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
>>>>> @@ -63,3 +63,12 @@
>>>>>              disable-wp;
>>>>>      };
>>>>> };
>>>>> +
>>>>> +&eth0 {
>>>>> +     status = "okay";
>>>>> +     phy-mode = "gmii";
>>>>> +     phy-handle = <&phy1>;
>>>>> +     phy1: ethernet-phy@0 {
>>>>> +             reg = <0>;
>>>>> +     };
>>>>> +};
>>>> 
>>>> Thanks. I am able to boot Unleashed with networking enabled with
>>>> this
>>>> patch.
>>>> 
>>>> FWIW, 
>>>> Tested-by: Atish Patra <atish.patra@wdc.com>
>>>> 
>>>> Regards,
>>>> Atish
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
