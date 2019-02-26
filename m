From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH RESEND V2 1/4] dt-bindings: fsl: scu: add watchdog binding
Date: Tue, 26 Feb 2019 14:27:50 -0800
Message-ID: <20190226222750.GA30985@roeck-us.net>
References: <1550472539-16590-1-git-send-email-Anson.Huang@nxp.com>
 <1550472539-16590-2-git-send-email-Anson.Huang@nxp.com>
 <20190222195217.GA22194@bogus>
 <bb19470c-1590-f8dd-72e6-b382444d7902@roeck-us.net>
 <DB3PR0402MB3916912A64AF0837A9649913F5790@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <96932b3e-87f1-d8f2-95bc-0e9a8d5d45ed@roeck-us.net>
 <DB3PR0402MB391659B6A466B1D85114E9C9F57A0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAL_JsqJV9NxpOJi3Jh2Uk-TOmOL4rWwqZp3sodxsRinAHZ3m3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJV9NxpOJi3Jh2Uk-TOmOL4rWwqZp3sodxsRinAHZ3m3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Anson Huang <anson.huang@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "heiko@sntech.de" <heiko@sntech.de>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, Andy Gross <andy.gross@linaro.org>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, enric
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 03:34:12PM -0600, Rob Herring wrote:
> > >
> > > I think Rob suggested that the SCU parent driver should instantiate the
> > > watchdog without explicit watchdog node. That would be possible, but it
> > > currently uses
> > > devm_of_platform_populate() to do the instantiation, and changing that
> > > would be a mess. Besides, it does sem to me that your suggested node would
> > > describe the hardware, so I am not sure I understand the reasoning.
> 
> It would just be a call to create a platform device instead. How is that a mess?
> 
> It's describing firmware. We have DT for describing h/w we've failed
> to make discoverable. We should not repeat that and just describe
> firmware in DT. Make the firmware discoverable! Though there are cases
> like firmware provided clocks where we still need something in DT, but
> this is not one of them.
> 

It requires extra code where an added DT node would accomplish the same.
It requires a mix of DT nodes for existing devices plus extra code for
newly added devices. To me that looks like a revert to old platform code,
which was replaced with DT descriptions over the last several years.

But then if that is where things are going, who am I to argue.

Guenter
