From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dts/ls2080a: Update DTSI to add support of SP805 WDT
Date: Thu, 24 Dec 2015 11:18:32 +0100
Message-ID: <201512241118.32946.arnd@arndb.de>
References: <1450189825-29065-1-git-send-email-bhupesh.sharma@freescale.com> <1450189825-29065-3-git-send-email-bhupesh.sharma@freescale.com> <CAFTCetS7P6wF3MhgMSXSXP_jnLQvBc-NSY0TW3OOnCjtbL0N_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFTCetS7P6wF3MhgMSXSXP_jnLQvBc-NSY0TW3OOnCjtbL0N_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhupesh SHARMA <bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Leo Li <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 23 December 2015, Bhupesh SHARMA wrote:
> 
> Hi Arnd, Olof, Kevin
> 
> On Tue, Dec 15, 2015 at 8:00 PM, Bhupesh Sharma
> <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > This patch updates the LS2080a DTSI (DTS Include) file to add
> > support for eight SP805 Watchdog units which can be used to
> > reset the eight Cortex-A57 cores available on LS2080A.
> >
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |   56 ++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> 
> Since Rob has acked the SP805 WDT binding documentation patch (patch
> 1/2 of this series),
> can this DTSI change, please be considered for absorption in the arm-soc tree.

Sure, please submit it for inclusion. Who is the maintainer for
arch/arm64/boot/dts/freescale/ ? Can they pick up all the freescale related
dts changes and submit them as a pull request? Should they go through
Shawn's tree maybe?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
