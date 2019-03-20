From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use rgmii-id
Date: Wed, 20 Mar 2019 09:16:49 -0300
Message-ID: <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Twiss <stwiss.opensource@diasemi.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Dialog Opensource Support <support.opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Wed, Mar 20, 2019 at 9:06 AM Steve Twiss
<stwiss.opensource@diasemi.com> wrote:
>
> The PHY used on the Freescale i.MX6Q/DL SABRE boards is qualified as
> 'rgmii' instead of 'rgmii-id'. Meaning the RX and TX delays that were

This patch declares it as 'rgmii-id', which contradicts the commit log.

> previously added by the MAC when required, but are now provided
> internally by the PHY (and the MAC should no longer add the RX or TX
> delays in this case).
>
> This patch fixes the network problems seen on the Freescale i.MX6Q/DL

Please provide a Fixes tag. It would be good to know if this fix needs
to be applied to older kernels.
