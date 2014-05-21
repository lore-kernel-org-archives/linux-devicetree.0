From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 00/10] ARM: Versatile irq and clock DT support
Date: Wed, 21 May 2014 10:26:40 +0200
Message-ID: <5859481.dtUsNDpXQt@wuerfel>
References: <1400620176-7239-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400620176-7239-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 20 May 2014 16:09:26 Rob Herring wrote:
> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> This series is some preparation work to fully convert Versatile platform 
> to DT. This converts the IRQ initialization to DT based init and adds 
> clocks to the Versatile DT. This doesn't actually enable using common 
> clock framework, but that is only a matter of removing the old clock 
> code and enabling the appropriate Kconfig options. This will be done 
> when Versatile can be completely converted over to DT boot. I have that 
> working in my tree, but full DT conversion is also dependent on DT PCI 
> support.
> 
> I've tested under QEMU and Linus Walleij has tested an earlier version 
> on Versatile AB h/w.

Looks great to me.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Should we merge it directly into arm-soc or are you planning to
send a pull request?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
