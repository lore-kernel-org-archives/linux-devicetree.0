From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: b650v3: Calibrate USB PHY to pass eye
 diagram test
Date: Sun, 23 Oct 2016 20:11:07 +0800
Message-ID: <20161023121107.GP30578@tiger>
References: <1473887689-10792-1-git-send-email-jaret.cantu@timesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473887689-10792-1-git-send-email-jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 14, 2016 at 05:14:49PM -0400, Jaret Cantu wrote:
> Calibrate the USB PHY TX settings to pass the eye diagram signal
> integrity test.  The settings are taken from the i.MX6 reference
> manual's recommended configuration for USB certification (66.2.6).
> 
> Signed-off-by: Jaret Cantu <jaret.cantu-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
