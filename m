From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Mon, 11 Mar 2019 16:26:16 -0500
Message-ID: <CAL_JsqJiKx8UvZ8qu-YaaPooLbSMKANSX=YZQO=Nm_anD2v9gw@mail.gmail.com>
References: <1550472539-16590-1-git-send-email-Anson.Huang@nxp.com>
 <1550472539-16590-2-git-send-email-Anson.Huang@nxp.com> <20190222195217.GA22194@bogus>
 <bb19470c-1590-f8dd-72e6-b382444d7902@roeck-us.net> <DB3PR0402MB3916912A64AF0837A9649913F5790@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <96932b3e-87f1-d8f2-95bc-0e9a8d5d45ed@roeck-us.net> <DB3PR0402MB391659B6A466B1D85114E9C9F57A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAL_JsqJV9NxpOJi3Jh2Uk-TOmOL4rWwqZp3sodxsRinAHZ3m3w@mail.gmail.com> <AM0PR04MB4211EAEA6F03465D372B0B4F804C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB4211EAEA6F03465D372B0B4F804C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Anson Huang <anson.huang@nxp.com>, Guenter Roeck <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, Andy Gross <andy.gross@linaro.org>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, s.hauer@pengutronix.
List-Id: devicetree@vger.kernel.org

+Jens W

On Thu, Mar 7, 2019 at 6:22 AM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> Hi Rob,
>
> > > > I think Rob suggested that the SCU parent driver should instantiate
> > > > the watchdog without explicit watchdog node. That would be possible,
> > > > but it currently uses
> > > > devm_of_platform_populate() to do the instantiation, and changing
> > > > that would be a mess. Besides, it does sem to me that your suggested
> > > > node would describe the hardware, so I am not sure I understand the
> > reasoning.
> >
> > It would just be a call to create a platform device instead. How is that a mess?
> >
> > It's describing firmware. We have DT for describing h/w we've failed to make
> > discoverable. We should not repeat that and just describe firmware in DT.
> > Make the firmware discoverable! Though there are cases like firmware
> > provided clocks where we still need something in DT, but this is not one of
> > them.
> >
>
> The watchdog node here in question actually is not using SCU firmware call.
> Due to security requirement by SCU, watchdog can only be accessed in
> security mode, for IMX case, via ARM Trust Firmware. That means the
> watchdog used in Linux actually is using ARM SMC call and does not
> depend SCU driver. So It would be strange for SCU driver to instantiate it.
>
> For this situation, do you think we can move watchdog out of scu node?
> Maybe rename the compatible string like "fsl,imx8qxp-sip-watchdog"
> because it's actually a watchdog serviced by ATF firmware.

Yes, but that creates more questions. What exactly does ATF talk to
for the watchdog? The SCU firmware?

Maybe ATF should define and provide a standard watchdog interface? It
is still a question of making the firmware discoverable rather than
trying to describe the firmware in DT.

Rob
