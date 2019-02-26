From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Tue, 26 Feb 2019 15:34:12 -0600
Message-ID: <CAL_JsqJV9NxpOJi3Jh2Uk-TOmOL4rWwqZp3sodxsRinAHZ3m3w@mail.gmail.com>
References: <1550472539-16590-1-git-send-email-Anson.Huang@nxp.com>
 <1550472539-16590-2-git-send-email-Anson.Huang@nxp.com> <20190222195217.GA22194@bogus>
 <bb19470c-1590-f8dd-72e6-b382444d7902@roeck-us.net> <DB3PR0402MB3916912A64AF0837A9649913F5790@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <96932b3e-87f1-d8f2-95bc-0e9a8d5d45ed@roeck-us.net> <DB3PR0402MB391659B6A466B1D85114E9C9F57A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB391659B6A466B1D85114E9C9F57A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, Andy Gross <andy.gross@linaro.org>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, enri
List-Id: devicetree@vger.kernel.org

On Sun, Feb 24, 2019 at 8:26 PM Anson Huang <anson.huang@nxp.com> wrote:
>
> Hi, Guenter
>
> Best Regards!
> Anson Huang
>
> > -----Original Message-----
> > From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> > Roeck
> > Sent: 2019=E5=B9=B42=E6=9C=8824=E6=97=A5 11:20
> > To: Anson Huang <anson.huang@nxp.com>; Rob Herring <robh@kernel.org>
> > Cc: mark.rutland@arm.com; shawnguo@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > catalin.marinas@arm.com; will.deacon@arm.com; wim@linux-watchdog.org;
> > Aisheng Dong <aisheng.dong@nxp.com>; ulf.hansson@linaro.org; Daniel
> > Baluta <daniel.baluta@nxp.com>; Andy Gross <andy.gross@linaro.org>;
> > horms+renesas@verge.net.au; heiko@sntech.de; arnd@arndb.de;
> > bjorn.andersson@linaro.org; jagan@amarulasolutions.com;
> > enric.balletbo@collabora.com; marc.w.gonzalez@free.fr; olof@lixom.net;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-watchdog@vger.kernel.org; dl-linux-im=
x
> > <linux-imx@nxp.com>
> > Subject: Re: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog
> > binding
> >
> > On 2/23/19 7:04 PM, Anson Huang wrote:
> > > Hi, Guenter/Rob
> > >
> > > Best Regards!
> > > Anson Huang
> > >
> > >> -----Original Message-----
> > >> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
> > >> Roeck
> > >> Sent: 2019=E5=B9=B42=E6=9C=8824=E6=97=A5 1:08
> > >> To: Rob Herring <robh@kernel.org>; Anson Huang
> > <anson.huang@nxp.com>
> > >> Cc: mark.rutland@arm.com; shawnguo@kernel.org;
> > >> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > >> catalin.marinas@arm.com; will.deacon@arm.com; wim@linux-
> > watchdog.org;
> > >> Aisheng Dong <aisheng.dong@nxp.com>; ulf.hansson@linaro.org; Daniel
> > >> Baluta <daniel.baluta@nxp.com>; Andy Gross <andy.gross@linaro.org>;
> > >> horms+renesas@verge.net.au; heiko@sntech.de; arnd@arndb.de;
> > >> bjorn.andersson@linaro.org; jagan@amarulasolutions.com;
> > >> enric.balletbo@collabora.com; marc.w.gonzalez@free.fr;
> > >> olof@lixom.net; devicetree@vger.kernel.org;
> > >> linux-kernel@vger.kernel.org; linux-arm- kernel@lists.infradead.org;
> > >> linux-watchdog@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > >> Subject: Re: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add
> > >> watchdog binding
> > >>
> > >> On 2/22/19 11:52 AM, Rob Herring wrote:
> > >>> On Mon, Feb 18, 2019 at 06:53:48AM +0000, Anson Huang wrote:
> > >>>> Add i.MX8QXP system controller watchdog binding.
> > >>>>
> > >>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > >>>> ---
> > >>>> Changes since V1:
> > >>>>  - update dts node name to "watchdog";
> > >>>> ---
> > >>>>    Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 1=
0
> > >> ++++++++++
> > >>>>    1 file changed, 10 insertions(+)
> > >>>>
> > >>>> diff --git
> > >>>> a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > >>>> b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > >>>> index 4b79751..f388ec6 100644
> > >>>> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > >>>> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> > >>>> @@ -136,6 +136,12 @@ Required properties:
> > >>>>                             resource id for thermal driver to get =
temperature
> > >> via
> > >>>>                             SCU IPC.
> > >>>>
> > >>>> +Watchdog bindings based on SCU Message Protocol
> > >>>> +------------------------------------------------------------
> > >>>> +
> > >>>> +Required properties:
> > >>>> +- compatible: should be "fsl,imx8qxp-sc-wdt";
> > >>>> +
> > >>>>    Example (imx8qxp):
> > >>>>    -------------
> > >>>>    lsio_mu1: mailbox@5d1c0000 {
> > >>>> @@ -188,6 +194,10 @@ firmware {
> > >>>>                          tsens-num =3D <1>;
> > >>>>                          #thermal-sensor-cells =3D <1>;
> > >>>>                  };
> > >>>> +
> > >>>> +                watchdog: watchdog {
> > >>>> +                        compatible =3D "fsl,imx8qxp-sc-wdt";
> > >>>
> > >>> As-is, there's no reason for this to be in DT. The parent node's
> > >>> driver can instantiate the wdog.
> > >>>
> > >>
> > >> As the driver is currently written, you are correct, since it doesn'=
t
> > >> accept watchdog timeout configuration through devicetree.
> > >>
> > >> Question is if that is intended. Is it ?
> > >
> > > I am a little confused, do you mean we no need to have "watchdog" nod=
e
> > in side "scu"
> > > node? Or we need to modify the watchdog node's compatible string to "
> > > fsl,imx-sc-wdt" to make it more generic for other platforms? If yes, =
I can
> > resend the patch series to modify it.
> > >
> >
> > I think Rob suggested that the SCU parent driver should instantiate the
> > watchdog without explicit watchdog node. That would be possible, but it
> > currently uses
> > devm_of_platform_populate() to do the instantiation, and changing that
> > would be a mess. Besides, it does sem to me that your suggested node wo=
uld
> > describe the hardware, so I am not sure I understand the reasoning.

It would just be a call to create a platform device instead. How is that a =
mess?

It's describing firmware. We have DT for describing h/w we've failed
to make discoverable. We should not repeat that and just describe
firmware in DT. Make the firmware discoverable! Though there are cases
like firmware provided clocks where we still need something in DT, but
this is not one of them.

> >
> > For my part I referred to
> >       watchdog_init_timeout(imx_sc_wdd, DEFAULT_TIMEOUT, &pdev-
> > >dev); in the driver, which guarantees that the timeout property will n=
ot be
> > used to set the timeout. A more common implementation would have been
> >
> >       imx_sc_wdd->timeout =3D DEFAULT_TIMEOUT;
> >       ret =3D watchdog_init_timeout(imx_sc_wdd, timeout, &pdev->dev);
> >
> > where 'timeout' is the module parameter. Which is actually not used in =
your
> > driver.
> > Hmm ... I wasn't careful enough with my review. The timeout initializat=
ion as-
> > is doesn't make sense. I'll comment on that in the patch.
>
> I understand now, in our cases, I would still prefer to have watchdog nod=
e under
> the SCU parent node, since there could be other property setting differen=
ce between
> different i.MX platforms with system controller watchdog inside, using th=
e SCU node
> to instantiate makes us a little confused about the watchdog, so if it is=
 NOT that critical,
> I think we should keep watchdog node. But to make the watchdog driver mor=
e generic
> for other i.MX platforms, I changed the compatible string to "fsl,imx-sc-=
wdt" in driver, and
> each SoC should has it as fallback if it can reuse this watchdog driver.

You handle differences between SoCs by having specific compatibles. So
"fsl,imx-sc-wdt" moves in the wrong direction assuming we have a node
in the first place.

Rob
