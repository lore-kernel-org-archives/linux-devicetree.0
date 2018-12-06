From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2 1/4] ARM: dts: imx6qdl-sabresd: Move regulators
 outside of "simple-bus"
Date: Thu, 6 Dec 2018 15:48:55 +0800
Message-ID: <20181206074853.GL3987@dragon>
References: <1544060203-22163-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544060203-22163-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 06, 2018 at 01:42:30AM +0000, Anson Huang wrote:
> From: Fabio Estevam <festevam@gmail.com>
> 
> It is not recommended to place regulators inside "simple-bus", so move
> them out to make it cleaner the addition of new regulators.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied all, thanks.
