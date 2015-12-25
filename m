From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dts/ls2080a: Update DTSI to add support of SP805
 WDT
Date: Fri, 25 Dec 2015 09:56:17 +0800
Message-ID: <20151225015616.GA27329@dragon>
References: <1450189825-29065-1-git-send-email-bhupesh.sharma@freescale.com>
 <1450189825-29065-3-git-send-email-bhupesh.sharma@freescale.com>
 <CAFTCetS7P6wF3MhgMSXSXP_jnLQvBc-NSY0TW3OOnCjtbL0N_w@mail.gmail.com>
 <201512241118.32946.arnd@arndb.de>
 <BN3PR0301MB1298AF2C5A88FCA392D0E9DD82E70@BN3PR0301MB1298.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BN3PR0301MB1298AF2C5A88FCA392D0E9DD82E70-CEkquS/Gb82NgPRq7B8Z6pwN6zqB+hSMnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bhupesh SHARMA <bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Li Leo <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 24, 2015 at 08:41:54PM +0000, Sharma Bhupesh wrote:
> 
> 
> > -----Original Message-----
> > From: Arnd Bergmann [mailto:arnd-r2nGTMty4D4@public.gmane.org]
> > Sent: Thursday, December 24, 2015 3:49 PM
> > To: Bhupesh SHARMA
> > Cc: Sharma Bhupesh-B45370; Mark Rutland; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Olof Johansson; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> > Rob Herring; Will Deacon; Catalin Marinas; Li Yang-Leo-R58472; Wood
> > Scott-B07421; Yoder Stuart-B08248; shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> > Subject: Re: [PATCH v3 2/2] dts/ls2080a: Update DTSI to add support of
> > SP805 WDT
> > 
> > On Wednesday 23 December 2015, Bhupesh SHARMA wrote:
> > >
> > > Hi Arnd, Olof, Kevin
> > >
> > > On Tue, Dec 15, 2015 at 8:00 PM, Bhupesh Sharma
> > > <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > This patch updates the LS2080a DTSI (DTS Include) file to add
> > > > support for eight SP805 Watchdog units which can be used to reset
> > > > the eight Cortex-A57 cores available on LS2080A.
> > > >
> > > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |   56
> > ++++++++++++++++++++++++
> > > >  1 file changed, 56 insertions(+)
> > >
> > > Since Rob has acked the SP805 WDT binding documentation patch (patch
> > > 1/2 of this series),
> > > can this DTSI change, please be considered for absorption in the arm-
> > soc tree.
> > 
> > Sure, please submit it for inclusion. Who is the maintainer for
> > arch/arm64/boot/dts/freescale/ ? Can they pick up all the freescale
> > related dts changes and submit them as a pull request? Should they go
> > through Shawn's tree maybe?
> 
> Thanks Arnd. For now, may-be I can send this patchset with Rob's Acked-by added
> for 1/2 to 'arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org'. So that this can be picked by via the arm-soc tree.
> Shawn, I hope it's ok with you.

Yeah.  I'm maintaining a git tree, collecting all Freescale arm32
platform patches, and sending them to arm-soc for each merge window.
If I can be copied on those arm64 patches, I do not mind handling them
together with arm32 ones.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
