From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 0/4] ARM: SoC: add a new platform, UniPhier (arch/arm/mach-uniphier)
Date: Wed, 13 May 2015 11:17:07 +0200
Message-ID: <12079182.VTh0Y5GzSg@wuerfel>
References: <1431058034-5508-1-git-send-email-yamada.masahiro@socionext.com> <2230140.n6kW8LSSaP@wuerfel> <20150513083234.GP2558@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150513083234.GP2558@tarshish>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 11:32:34 Baruch Siach wrote:
> Hi Arnd,
> 
> On Wed, May 13, 2015 at 09:48:33AM +0200, Arnd Bergmann wrote:
> > For sending pull requests, it would be good to have a gpg key that
> > is signed by other well-known kernel developers. If you have such
> > a key, you can also request a kernel.org account to host a git tree
> > there, or you can host a git tree somewhere on your company's domain.
> > A public hosting service like github is not as good for us, but we
> > can deal with it when you are still ramping up your infrastructure.
> > Let me know if you need help finding kernel developers to sign your key.
> 
> Is a pull request from a kernel.org repo trusted more than the key itself? In 
> other words, if I sign my pull request with a trusted key, why would the git 
> repo location make any difference?

The main advantage is higher confidence I have in your pull request if I
don't look at the signature, because I can assume that someone else already
did when you got your account.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
