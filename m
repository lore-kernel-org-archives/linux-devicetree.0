From: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v2 3/5] MIPS: jz4780: DTS: Probe the jz4740-watchdog
 driver from devicetree
Date: Tue, 26 Sep 2017 15:26:26 +0200
Message-ID: <CA+7wUsyrP8a96-55Zk_GPQmNzPS9MB__dhjwUds7RkQhfe=+EA@mail.gmail.com>
References: <20170908183558.1537-3-malat@debian.org> <20170915191837.27564-1-malat@debian.org>
 <CANc+2y6gZ4UQ7fKbJeV7HhDLLW9pbUEr0K0Tq5eBfg1ba2s_LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANc+2y6gZ4UQ7fKbJeV7HhDLLW9pbUEr0K0Tq5eBfg1ba2s_LQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi PrasannaKumar !

On Tue, Sep 26, 2017 at 3:17 PM, PrasannaKumar Muralidharan
<prasannatsmkumar@gmail.com> wrote:
> Hi Mathieu,
>
> On 16 September 2017 at 00:48, Mathieu Malaterre <malat@debian.org> wrote:
>> The jz4740-watchdog driver supports both jz4740 & jz4780.
>>
>> Signed-off-by: Mathieu Malaterre <malat@debian.org>
>> ---
>> Changes in v2:
>> * make the node name generic (Paul Cercueil)
>>
>>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> index 20e37d2d6008..76055bbc823a 100644
>> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
>> @@ -263,6 +263,11 @@
>>                 status = "disabled";
>>         };
>>
>> +       watchdog: watchdog@10002000 {
>> +               compatible = "ingenic,jz4780-watchdog";
>
> In drivers/watchdog/jz4740_wdt.c the compatible is declared as
> "ingenic,jz4740-watchdog" while your change says
> "ingenic,jz4780-watchdog". Can you modify that?

Well in the full changeset, you'll find: [PATCH v2 4/5] watchdog:
jz4740: Add support for the watchdog in jz4780 SoC

https://lkml.org/lkml/2017/9/15/451

There has been some misunderstanding. I still believe I need a new
compatible string, even if currently the code is 100% identical.

>> +               reg = <0x10002000 0x100>;
>> +       };
>> +
>
> The structures jz4740_wdt_device and jz4740_wdt_resources can be
> removed form arch/mips/jz4740/platform.c as watchdog is declared in
> device tree. For JZ4740 platform watchdog is not used so the variables
> can be removed.
>
> Do you mind adding watchdog entry to JZ4740 device tree? Currently
> watchdog is not enabled for JZ4740 platform.


Will do once this series has been accepted. Thanks for the review !

>>         nemc: nemc@13410000 {
>>                 compatible = "ingenic,jz4780-nemc";
>>                 reg = <0x13410000 0x10000>;
>> --
>> 2.11.0
>>
>
> Regards,
> PrasannaKumar
