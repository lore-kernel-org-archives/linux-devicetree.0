From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mq: Add on-chip OTP controller node
Date: Mon, 11 Feb 2019 14:01:10 +0100
Message-ID: <1549890070.2546.7.camel@pengutronix.de>
References: <20190202150638.13672-1-ccaione@baylibre.com>
 <20190202150638.13672-2-ccaione@baylibre.com>
 <1549886597.2546.5.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549886597.2546.5.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 11.02.2019, 13:03 +0100 schrieb Lucas Stach:
> Am Samstag, den 02.02.2019, 15:06 +0000 schrieb Carlo Caione:
> > Add the node for the OTP controller. The IP is the same as on the
> > imx7d.
> 
> This is not true. According to the reference manual, the OCOTP
> controller on i.MX8MQ uses the non-banked write mode, same as i.MX6.
> Thus it is incompatible to the i.MX7 OCOTP.

Actually I need to correct myself here. While the programming sequence
description is the same as on i.MX6, the register layout looks like the
i.MX7 one, so likely someone copy and pasted the wrong documentation
snippet. This means the controller is in fact compatible to the i.MX7
write sequence.

> Also the number of fuses is different, so we really need some driver
> support for the imx8mq compatible and can't declare the controller
> compatible to some older instance.

But then I think this is still true. The changed number of fuses means
we need some driver support and should not claim backward compatibility
with the i.MX7 controller.

regards,
Lucas
