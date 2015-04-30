From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx5: Add dts files for USB armory.
Date: Wed, 29 Apr 2015 23:22:11 -0300
Message-ID: <CAOMZO5B5bAXhvdv_MUBL9DoMvfv0p25B6eGMLbO1pJuK8HFLVA@mail.gmail.com>
References: <87h9t6i40r.fsf@aikidev.net>
	<20150427115747.GA11975@dragon>
	<20150427133708.GC11598@core.inversepath.com>
	<20150428081959.GA32234@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150428081959.GA32234@shlinux2>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, Vagrant Cascadian <vagrant@debian.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Tue, Apr 28, 2015 at 5:20 AM, Peter Chen <peter.chen@freescale.com> wrote:

> Current chipidea usb driver supports role switch function well, if you
> have a gpio or id pin for it.

On mx6 we are able to perform OTG role-switch funtion as they have the
OTG_ID pins.

We are talking about mx53 here, which does not have such OTG_ID pins,
so not sure how they can perform role-switch in run-time?

Regards,

Fabio Estevam
