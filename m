From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: [PATCH v6 03/15] usb: phy-mxs: Add auto clock and power setting
Date: Fri, 13 Dec 2013 13:55:25 +0800
Message-ID: <CAL411-qnME4n64PXMeSucgt-jZXNrKei3uA-eSMv4jE3SDmSVg@mail.gmail.com>
References: <1386897825-6130-1-git-send-email-peter.chen@freescale.com>
 <1386897825-6130-4-git-send-email-peter.chen@freescale.com> <20131213042338.GD867@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131213042338.GD867@saruman.home>
Sender: linux-doc-owner@vger.kernel.org
To: "balbi@ti.com" <balbi@ti.com>
Cc: Peter Chen <peter.chen@freescale.com>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, devicetree@vger.kernel.org, m.grzeschik@pengutronix.de, frank.li@freescale.com, linux-doc@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, rob.herring@calxeda.com, kernel@pengutronix.de, grant.likely@linaro.org, Shawn Guo <shawn.guo@linaro.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 13, 2013 at 12:23 PM, Felipe Balbi <balbi@ti.com> wrote:
> On Fri, Dec 13, 2013 at 09:23:33AM +0800, Peter Chen wrote:
>> With the auto setting, the PHY's clock and power can be
>> recovered correctly from low power mode, it is ganranteed by IC logic.
>
> s/ganranteed/guaranteed
>

Will change.

> Also, I think you need to be slightly more verbose here. Maybe explain a
> bit what is the "auto setting". From what I can see from the code, it's
> a way to let HW manage clock gating.
>

Yes, you are right. This feature is used to open related power and clocks
automatically after receiving wakeup signal. I will add more explanation.

> Another question, does this feature work in all SoCs where this IP is
> available ?
>

Yes, these auto bits are existed from the 1st generation mxs-phy.

-- 
BR,
Peter Chen
