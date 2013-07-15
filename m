From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2] media: i2c: adv7343: add OF support
Date: Mon, 15 Jul 2013 20:06:36 +0530
Message-ID: <CA+V-a8tQCfXfvrGJN_xKO=aYMeo=dTzJ_U5iXQyybf2nWHWQcA@mail.gmail.com>
References: <1373713959-31066-1-git-send-email-prabhakar.csengg@gmail.com> <51E30B04.8090009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51E30B04.8090009@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: LMML <linux-media@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

Thanks for the review.

On Mon, Jul 15, 2013 at 2:03 AM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi Prabhakar,
>
>
> On 07/13/2013 01:12 PM, Prabhakar Lad wrote:
>>
>> From: "Lad, Prabhakar"<prabhakar.csengg@gmail.com>
>>
>> add OF support for the adv7343 driver.
>>
>> Signed-off-by: Lad, Prabhakar<prabhakar.csengg@gmail.com>
>> ---
>>   Changes for v2:
>>   1: Fixed naming of properties.
>>
>>   .../devicetree/bindings/media/i2c/adv7343.txt      |   54
>> ++++++++++++++++
>>   drivers/media/i2c/adv7343.c                        |   65
>> +++++++++++++++++++-
>>   2 files changed, 118 insertions(+), 1 deletion(-)
>>   create mode 100644
>> Documentation/devicetree/bindings/media/i2c/adv7343.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7343.txt
>> b/Documentation/devicetree/bindings/media/i2c/adv7343.txt
>> new file mode 100644
>> index 0000000..1d2e854
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/adv7343.txt
>> @@ -0,0 +1,54 @@
>> +* Analog Devices adv7343 video encoder
>> +
>> +The ADV7343 are high speed, digital-to-analog video encoders in a 6=
4-lead
>> LQFP
>> +package. Six high speed, 3.3 V, 11-bit video DACs provide support f=
or
>> composite
>> +(CVBS), S-Video (Y-C), and component (YPrPb/RGB) analog outputs in
>> standard
>> +definition (SD), enhanced definition (ED), or high definition (HD) =
video
>> +formats.
>> +
>> +Required Properties :
>> +- compatible: Must be "ad,adv7343"
>
>
> Please have a look at Documentation/devicetree/bindings/vendor-prefix=
es.txt.
> 'ad' is a vendor prefix reserved for "Avionic Design GmbH".
> For "Analog Devices, Inc." 'adi' should be used.
>
> If I would have to draft a new DT binding proposal checklist checking
> vendor-prefixes.txt would certainly be one of the first steps.
>
That makes it easier I wasn=92t aware of this file thanks :)

>
>> +Optional Properties :
>> +- ad,adv7343-power-mode-sleep-mode: on enable the current consumpti=
on is
>> +                                    reduced to micro ampere level. =
All
>> DACs and
>> +                                    the internal PLL circuit are
>> disabled.
>> +- ad,adv7343-power-mode-pll-ctrl: PLL and oversampling control. Thi=
s
>> control
>> +                                  allows internal PLL 1 circuit to =
be
>> powered
>> +                                  down and the oversampling to besw=
itched
>> off.
>> +- ad,adv7343-power-mode-dac-1: power on/off DAC 1, 0 =3D OFF and 1 =
=3D ON.
>> +- ad,adv7343-power-mode-dac-2: power on/off DAC 2, 0 =3D OFF and 1 =
=3D ON.
>> +- ad,adv7343-power-mode-dac-3: power on/off DAC 3, 0 =3D OFF and 1 =
=3D ON.
>> +- ad,adv7343-power-mode-dac-4: power on/off DAC 4, 0 =3D OFF and 1 =
=3D ON.
>> +- ad,adv7343-power-mode-dac-5: power on/off DAC 5, 0 =3D OFF and 1 =
=3D ON.
>> +- ad,adv7343-power-mode-dac-6: power on/off DAC 6, 0 =3D OFF and 1 =
=3D ON.
>> +- ad,adv7343-sd-config-dac-out-1: Configure SD DAC Output 1.
>> +- ad,adv7343-sd-config-dac-out-2: Configure SD DAC Output 2.
>
>
> All these properties look more like hardware configuration, rather th=
an
> hardware description. So at first sight I would say none of these pro=
perties
> is suitable for the device tree.
>
> sleep mode and pll ctrl should likely only have default values in the
> driver.
> sleep-mode disables all DAC, while power-mode-dac-? does power on/off
> (enables / disables?) individual DACs. How those properties interact,=
 what's
> going on here exactly ? :)
>
Agreed the device tree is meant to describe the hardware, basically the=
 the need
had arrived since the adv7343 is present on DM6467 EVM and also on the
OMAP-L138 EVM, the configuration of this two register's differs on thes=
e
two evm's mentioned, because of which this is now being passed as part =
of
the device tree.

> That said, how about only leaving the properties indicating which DAC=
s
> (including SD DACs) should be enabled ? E.g.
>
> adi,dac-enable - an array indicating which DACs are enabled, in order
>                 DAC1...DAC6, 1 to enable DAC, 0 to disable.
>
OK

> adi,sd-dac-enable - an array indicating which SD DACs are enabled, in=
 order
>                 DAC1...DAC2, 1 to enable SD DAC, 0 to disable.
>
OK

> Please note you don't need ",adv7343-" prefix in each single property
> for that device.
>
Agreed.

>
>> +Example:
>> +
>> +i2c0@1c22000 {
>> +       ...
>> +       ...
>> +
>> +       adv7343@2a {
>> +               compatible =3D "ad,adv7343";
>> +               reg =3D<0x2a>;
>> +
>> +               port {
>> +                       adv7343_1: endpoint {
>> +                                       ad,adv7343-power-mode-sleep-=
mode;
>> +                                       ad,adv7343-power-mode-pll-ct=
rl;
>> +                                       ad,adv7343-power-mode-dac-1;
>> +                                       ad,adv7343-power-mode-dac-2;
>> +                                       ad,adv7343-power-mode-dac-3;
>> +                                       ad,adv7343-power-mode-dac-4;
>> +                                       ad,adv7343-power-mode-dac-5;
>> +                                       ad,adv7343-power-mode-dac-6;
>
>
> Then this would have become:
>                                         adi,dac-enable =3D <1 1 1 1 1=
 1>;
>
> But I would put some disabled DACs in the example as well:
>
OK will do that.

>                                         /* Use DAC1..3, DAC6 */
>                                         adi,dac-enable =3D <1 1 1 0 0=
 1>;
>
>> +                                       ad,adv7343-sd-config-dac-out=
-1;
>> +                                       ad,adv7343-sd-config-dac-out=
-2;
>
>
> And this:
>                                         adi,sd-dac-enable =3D <1 1>;
>
Ok.

>
>> +                       };
>> +               };
>> +       };
>> +       ...
>> +};
[snip]
>> +       pdata->mode_config.dac_6 =3D
>> +               of_property_read_bool(np, "ad,adv7343-power-mode-dac=
-6");
>> +
>> +       pdata->sd_config.sd_dac_out1 =3D
>> +               of_property_read_bool(np,
>> "ad,adv7343-sd-config-dac-out-1");
>> +
>> +       pdata->sd_config.sd_dac_out2 =3D
>> +               of_property_read_bool(np,
>> "ad,adv7343-sd-config-dac-out-2");
>
>
> This doesn't look very impressive. IMHO changing
> pdata->mode_config.{dac,sd_dac}
> to an array type could simplify this code a little. But you could as =
well
> use
> of_property_read_u32_array() and assign each element to corresponding
> mode_config.(sd_)dac field.
>
OK.

Regards,
--Prabhakar Lad
