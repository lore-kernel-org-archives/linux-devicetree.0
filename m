From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH resend] arm: dts: ls1021a: add "fsl, ls1021a-esdhc"
 compatible string to esdhc node
Date: Fri, 17 Nov 2017 20:56:42 +0800
Message-ID: <20171117125641.GD25390@dragon>
References: <1510583976-6661-1-git-send-email-rasmus.villemoes@prevas.dk>
 <1510834526-32730-1-git-send-email-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1510834526-32730-1-git-send-email-rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 01:15:26PM +0100, Rasmus Villemoes wrote:
> Commit a22950c888e3 (mmc: sdhci-of-esdhc: add quirk
> SDHCI_QUIRK_BROKEN_TIMEOUT_VAL for ls1021a) added logic to the driver to
> enable the broken timeout val quirk for ls1021a, but did not add the
> corresponding compatible string to the device tree, so it didn't really
> have any effect. Fix that.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
