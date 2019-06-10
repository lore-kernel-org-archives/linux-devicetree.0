From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v15 0/3] Add support for the Purism Librem5 devkit
Date: Mon, 10 Jun 2019 15:52:58 +0200
Message-ID: <20190610135258.GA7976@xo-6d-61-c0.localdomain>
References: <20190528125747.1047-1-angus@akkea.ca>
 <20190605090315.GJ29853@dragon>
 <db174b0173d0bcdb9ab5ff4e2e1cc4bc@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <db174b0173d0bcdb9ab5ff4e2e1cc4bc@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Shawn Guo <shawnguo@kernel.org>, angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Carlo Caione <ccaione@baylibre.com>, Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 2019-06-05 06:48:05, Angus Ainslie wrote:
> On 2019-06-05 03:03, Shawn Guo wrote:
> >On Tue, May 28, 2019 at 05:57:44AM -0700, Angus Ainslie (Purism) wrote:
> >>The Librem5 devkit is based on the imx8mq from NXP. This is a default
> >>devicetree to boot the board to a command prompt.
> >>
> >>Changes since v14:
> >>
> >>Add regulator-always-on for the SNVS regulators.
> >>Added pgc nodes.
> >>Fixed charger pre-current.
> >
> >Since Pavel was reviewing your patches, you should copy him on the new
> >version.  Has this version addressed all his review comments?
> >
> 
> Sorry I had meant to include him in the CC.
> 
> I believe so but don't want to speak for him so we should see if he
> has anymore.

I did not check the code, sorry.

I still believe your shutdown voltage is too low; try that. Battery will go down from 3V
to 2.8V in seconds, so you don't really gain anything by using lower threshold, and you
may not even have enough time to shutdown the system if you set it too low.

Normally something like 3.0V, 3.2V is reasonable shutdown voltage.

Best regards,
										Pavel
