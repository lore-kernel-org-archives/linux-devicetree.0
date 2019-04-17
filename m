From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
Date: Wed, 17 Apr 2019 15:43:20 +0100
Message-ID: <20190417144309.GA21117@e107155-lin>
References: <VI1PR0402MB3519F2EBBDB8DAB002EAAA2E87250@VI1PR0402MB3519.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB3519F2EBBDB8DAB002EAAA2E87250@VI1PR0402MB3519.eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacky Bai <ping.bai@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2019 at 02:30:53PM +0000, Jacky Bai wrote:
>
> Hi Lucas,
>
> Either SCMI or SCPI, I think it is initially designed for SOC that has
> dedicated SCP to manage the SOC resource, but for i.MX8M, we don't have such
> support. so just for the power domain support, do you have other suggestion
> for it.
>

I disagree, I thought it was clear from my earlier email. All OSPM like
Linux kernel cares is conformance to the interface. And SCMI/SCPI kind
of interface doesn't mandate how to implement either at the hardware
(you may or may not have dedicated processor) or software level(can do
it in TF-A through SMC, or some remote process through mailbox)

I am clearly against the custom SMC:

1. It will never end and it's put together without much design thoughts
   just to address specific need of the hour.
2. It gets obsolete very soon, mainly because of (1)
3. Very platform and vendor specific and soon we will find ourselves
   in ocean of such custom calls

And I can definitely continue the list, but I have made the point.
I think we already have enough of those custom SMC already now and it's
high time to stop that non-sense for OSPM.

--
Regards,
Sudeep
