From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] add Atmel EBI (External Bus Interface) DT nodes for
 AT91SAM9263
Date: Sun, 21 Dec 2014 12:14:39 +0100
Message-ID: <20141221111439.GA14733@piout.net>
References: <1418979100-13243-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1418979100-13243-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The whole series is
Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

On 19/12/2014 at 09:51:37 +0100, Alexander Stein wrote :
> This is based on and requires Boris' work on an EBI driver for AT91. Please
> refer to https://lkml.org/lkml/2014/12/3/806.
> The reason I added no pinctrl is that those pins from EBI1 in my case are not
> muxable. They are fixed so there is nothing I can test here.
> I used this patchset and the EBI to configure a PSRAM to be used by the
> atmel_lcdfb driver which works so far.
> This also means EBI0 is rather untested, but it should behave like EBI1 if
> the numbers are correct.
> 
> Best regards,
> Alexander
> 
> Alexander Stein (3):
>   ARM: at91/dt: add matrix node in at91sam9263 dtsi
>   ARM: at91/dt: add SMC0/1  nodes in at91sam9263 dtsi
>   ARM: at91/dt: add EBI (External Bus Interface) node in at91sam9263
>     dtsi
> 
>  arch/arm/boot/dts/at91sam9263.dtsi | 44 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> -- 
> 2.2.1
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
