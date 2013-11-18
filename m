From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something better?
Date: Mon, 18 Nov 2013 10:16:13 -0700
Message-ID: <528A4B5D.8050809@wwwdotorg.org>
References: <52644A9E.3060007@wwwdotorg.org> <20131118122644.GA26046@ulmo.nvidia.com> <20131118134022.26EE7C409EC@trevor.secretlab.ca> <20131118135727.GD14306@sirena.org.uk> <20131118152920.GL26046@ulmo.nvidia.com> <20131118155022.GB28334@sirena.org.uk> <20131118160626.GN26046@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131118160626.GN26046-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/18/2013 09:06 AM, Thierry Reding wrote:
...
> Part of my point was that you could possibly still use the same IP
> with only a modified (standard) register interface. That way no
> licensing of third party IP would be needed. You'd only need to
> rewrite parts of the IP to make it look (and behave) like the
> standard one.
> 
> That's exactly how 16550-compatible UARTs work, isn't it? Or even
> the way that USB (EHCI, ...) work. There's a standardize register
> interface, possibly with a way for vendor-specific extensions, but
> the interface itself doesn't need to be licensed, so there are no
> additional costs to supporting the standard interface. There are
> only the advantages of being able to reuse a well-tested body of
> code.

Your idea would be great if it could be made to work in practice. I'm
not convinced how possible this would be, without ARM mandating it in
their contractual licensing terms, or large customers mandating it in
order to use SoCs for their flagship designs.

The one fly in the ointment is that even in cases where there are
standard register interfaces, there are always quirks in how vendors
implement those interfaces, so HW ends up being 90-99.5% compliant
with the interface, but with subtle differences. Take a look at
Tegra's SDHCI, EHCI and PCIe controllers for examples! Still, I
suppose that even with that caveat, having a 90% identical driver
compared to a 0% identical driver would be better than where we are today.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
