From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 3/5] dt-binding: pcf85063: add xtal load capacitance
Date: Tue, 15 Jan 2019 23:22:23 +0100
Message-ID: <20190115222223.GA558@ravnborg.org>
References: <20190108185414.26922-1-sam@ravnborg.org>
 <20190108185414.26922-4-sam@ravnborg.org>
 <20190115210827.GA25046@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190115210827.GA25046@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Urs =?iso-8859-1?Q?F=E4ssler?= <urs.fassler@bbv.ch>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>
List-Id: devicetree@vger.kernel.org

Hi Rob.

> > +
> > +Optional property:
> > +- quartz-load-femtofarads: The capacitive load of the quartz(x-tal),
> 
> Probably should put this in rtc.txt so it can be shared.

Good point - will do and respin the patchset.

> 
> > +  expressed in femto Farad (fF). Valid values are 7000 and 12500.
> > +  Default value (if no value is specified) is 7000fF.
> > +
> > +Example:
> > +
> > +pcf85063: pcf85063@51 {
> 
> rtc@51

OK, will change.

	Sam
