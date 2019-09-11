From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V4 3/4] ARM: imx_v6_v7_defconfig: Enable
 CONFIG_IMX7ULP_WDT by default
Date: Wed, 11 Sep 2019 14:24:55 +0800
Message-ID: <20190911062454.GA17142@dragon>
References: <1566441463-11911-1-git-send-email-Anson.Huang@nxp.com>
 <1566441463-11911-3-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1566441463-11911-3-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk, otavio@ossystems.com.br, leonard.crestez@nxp.com, schnitzeltony@gmail.com, u.kleine-koenig@pengutronix.de, jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 10:37:42PM -0400, Anson Huang wrote:
> Select CONFIG_IMX7ULP_WDT by default to support i.MX7ULP watchdog.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Patch #4 and #5 look good to me, and I will pick them up once the first
3 get applied by Guenter.

Shawn
