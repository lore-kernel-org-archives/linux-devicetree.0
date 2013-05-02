From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] media: i2c: adv7343: add OF support
Date: Thu, 2 May 2013 12:23:45 +0530
Message-ID: <CA+V-a8tTr_rWgdE3d7H=QWBfCYzT_g4h_rDk7s77+QDp_2zSSA@mail.gmail.com>
References: <1366982286-22950-1-git-send-email-prabhakar.csengg@gmail.com> <517EA519.4040202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <517EA519.4040202@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: LMML <linux-media@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@iki.fi>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

Thanks for the review.

On Mon, Apr 29, 2013 at 10:21 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Hi,
>
> On 04/26/2013 03:18 PM, Prabhakar Lad wrote:
>> From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
>>
>> add OF support for the adv7343 driver.
>
>> +++ b/Documentation/devicetree/bindings/media/i2c/adv7343.txt
>> @@ -0,0 +1,69 @@
>> +* Analog Devices adv7343 video encoder
>> +
>> +The ADV7343 are high speed, digital-to-analog video encoders in a 6=
4-lead LQFP
>> +package. Six high speed, 3.3 V, 11-bit video DACs provide support f=
or composite
>> +(CVBS), S-Video (Y-C), and component (YPrPb/RGB) analog outputs in =
standard
>> +definition (SD), enhanced definition (ED), or high definition (HD) =
video
>> +formats.
>> +
>> +The ADV7343 have a 24-bit pixel input port that can be configured i=
n a variety
>> +of ways. SD video formats are supported over an SDR interface, and =
ED/HD video
>> +formats are supported over SDR and DDR interfaces. Pixel data can b=
e supplied
>> +in either the YCrCb or RGB color spaces.
>> +
>> +Required Properties :
>> +- compatible: Must be "ad,adv7343-encoder"
>
> As Laurent pointed out, "-encoder" is probably not necessary, since
> there is nothing else in the ADV7343 chip than the video encoder ?
>
OK agreed upon.

>> +Optional Properties :
>> +- ad-adv7343-power-mode-sleep-mode: on enable the current consumpti=
on is
>> +                                    reduced to micro ampere level. =
All DACs and
>> +                                    the internal PLL circuit are di=
sabled.
>
> Why this needs to be specified in the device tree ? How will the hard=
ware
> be switched over to normal state if this property is set ?
> Couldn't it be a default state by the driver ? And how is it related =
to
> ad-adv7343-power-mode-dac-? properties ?
>
well this is the entire register "power mode", hmm as of  now there isn=
t any way
to get back to normal state, this needs to be implemented as part of
suspend/resume
callbacks. Its not related to dac properties.

> As pointed out earlier, vendor name in the property names should be s=
eparated
> with commas, rather than dashes.
>
OK

>> +- ad-adv7343-power-mode-pll-ctrl: PLL and oversampling control. Thi=
s control
>> +                                  allows internal PLL 1 circuit to =
be powered
>> +                                  down and the oversampling to besw=
itched off.
>
>> +- ad-adv7343-power-mode-dac-1: power on/off DAC 1.
>> +- ad-adv7343-power-mode-dac-2: power on/off DAC 2.
>> +- ad-adv7343-power-mode-dac-3: power on/off DAC 3.
>> +- ad-adv7343-power-mode-dac-4: power on/off DAC 4.
>> +- ad-adv7343-power-mode-dac-5: power on/off DAC 5.
>> +- ad-adv7343-power-mode-dac-6: power on/off DAC 6.
>
> Is this somehow related to actual wiring on a PCB ? It's also not rea=
lly
> explicit what value corresponds to which state.
>
No not related to the wiring on PCB. 0 corresponds to OFF state and 1
corresponds
to ON state.

>> +- ad-adv7343-sd-config-dac-out-1: Configure SD DAC Output 1.
>> +- ad-adv7343-sd-config-dac-out-2: Configure SD DAC Output 2.
>
> What are valid values and their meaning ?
>
>> +Example:
>> +
>> +i2c0@1c22000 {
>
>> +     adv7343@2a {
>> +             compatible =3D "ad,adv7343-encoder";
>> +             reg =3D <0x2a>;
>> +
>> +             port {
>> +                     adv7343_1: endpoint {
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-power-mode-sleep-mo=
de;
>> +                                     /* Active high (Defaults to fa=
lse) */
>
> Isn't it obvious that if property is not listed it will default to fa=
lse ?
>
Yes

>> +                                     ad-adv7343-power-mode-pll-ctrl=
;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-power-mode-dac-1;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-power-mode-dac-2;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-power-mode-dac-3;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-power-mode-dac-4;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-power-mode-dac-5;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-power-mode-dac-6;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-sd-config-dac-out-1=
;
>> +                                     /* Active high (Defaults to fa=
lse) */
>> +                                     ad-adv7343-sd-config-dac-out-2=
 =3D <0>;
>> +                     };
>> +             };
>> +     };
>> +     ...
>> +};
>> diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343=
=2Ec
>> index 469e262..eb12d1a 100644
>
>> +static void adv7343_get_pdata(struct i2c_client *client,
>> +                           struct adv7343_state *decoder)
>> +{
>> +     if (!client->dev.platform_data && client->dev.of_node) {
>> +             struct device_node *np;
>> +             struct adv7343_platform_data *pdata;
>> +
>> +             np =3D v4l2_of_get_next_endpoint(client->dev.of_node, =
NULL);
>> +             if (!np)
>> +                     return;
>> +
>> +             pdata =3D devm_kzalloc(&client->dev,
>> +                                  sizeof(struct adv7343_platform_da=
ta),
>> +                                  GFP_KERNEL);
>> +             if (!pdata) {
>> +                     pr_warn("adv7343 failed allocate memeory\n");
>
> Note that (devm_)k*alloc() functions already log any errors. If this =
function
> would be returning pointer to platform data this error message would =
not be
> needed for sure.
>
OK

>> +                     return;
>> +             }
>> +
>> +             pdata->mode_config.sleep_mode =3D
>> +               of_property_read_bool(np, "ad-adv7343-power-mode-sle=
ep-mode");
>> +
>> +             pdata->mode_config.pll_control =3D
>> +                 of_property_read_bool(np, "ad-adv7343-power-mode-p=
ll-ctrl");
>> +
>> +             pdata->mode_config.dac_1 =3D
>> +                    of_property_read_bool(np, "ad-adv7343-power-mod=
e-dac-1");
>> +
>> +             pdata->mode_config.dac_2 =3D
>> +                    of_property_read_bool(np, "ad-adv7343-power-mod=
e-dac-2");
>> +
>> +             pdata->mode_config.dac_3 =3D
>> +                    of_property_read_bool(np, "ad-adv7343-power-mod=
e-dac-3");
>> +
>> +             pdata->mode_config.dac_4 =3D
>> +                    of_property_read_bool(np, "ad-adv7343-power-mod=
e-dac-4");
>> +
>> +             pdata->mode_config.dac_5 =3D
>> +                    of_property_read_bool(np, "ad-adv7343-power-mod=
e-dac-5");
>> +
>> +             pdata->mode_config.dac_6 =3D
>> +                    of_property_read_bool(np, "ad-adv7343-power-mod=
e-dac-6");
>
> Looks like you transformed the platform data structure directly into =
device
> tree properties, which in most cases is a wrong approach. I wonder ho=
w these
> properties are related to actual hardware architecture and if there a=
re no
> more hardware specific properties from which these DAC power modes co=
uld be
> derived.
>
yes  the platform data is transformed into the device properties.

> If you need to always configure all DACs, wouldn't an array property =
be a
> better option ?
>
yes that=92s a good idea I'll have array instead.

Regards,
--Prabhakar Lad
