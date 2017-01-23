From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6dl: fix GPIO4 range
Date: Mon, 23 Jan 2017 18:10:06 +0800
Message-ID: <20170123101004.GQ5662@dragon>
References: <1484734191-18556-1-git-send-email-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1484734191-18556-1-git-send-email-sebastien.szymanski-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Julien Boibessot <julien.boibessot-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2017 at 11:09:51AM +0100, Sébastien Szymanski wrote:
> GPIO4_11 is on pin 152(MX6DL_PAD_KEY_ROW2) and not on pin
> 151(MX6DL_PAD_KEY_ROW1).
> 
> I found the error while booting a mainline kernel on APF6S SoM and
> noticed the following message:
> 
> [    2.609337] imx6dl-pinctrl 20e0000.iomuxc: pin MX6DL_PAD_KEY_ROW1
> already requested by 20a8000.gpio:105; cannot claim for 20a8000.gpio:107
> [    2.621884] imx6dl-pinctrl 20e0000.iomuxc: pin-151 (20a8000.gpio:107)
> status -22
> [    2.629303] spi_imx 2008000.ecspi: Can't get CS GPIO 107
> 
> With this patch, the message is gone and spi_imx driver probes correctly.
> 
> Fixes: bb728d662bed ("ARM: dts: add gpio-ranges property to iMX GPIO
> controllers")
> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
