From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: imx6ul: add clock-frequency to CPU node
Date: Mon, 20 May 2019 10:59:28 +0800
Message-ID: <20190520025927.GM15856@dragon>
References: <1557651135-12109-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557651135-12109-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 12, 2019 at 08:57:16AM +0000, Anson Huang wrote:
> Add clock-frequency property to CPU node. Avoids warnings like
> "/cpus/cpu@0 missing clock-frequency property" for "arm,cortex-a7".
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
