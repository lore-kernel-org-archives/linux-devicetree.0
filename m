From: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [GIT PULL]: ARM ARTPEC changes for 4.10
Date: Mon, 28 Nov 2016 13:33:31 +0100
Message-ID: <20161128123331.GO19016@axis.com>
References: <20161110150930.GB19804@axis.com>
 <5317474.MXurzNW7Do@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5317474.MXurzNW7Do@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jesper Nilsson <jespern-VrBV9hrLPhE@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel-VrBV9hrLPhE@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 26, 2016 at 12:16:20AM +0100, Arnd Bergmann wrote:
> On Thursday, November 10, 2016 4:09:31 PM CET Jesper Nilsson wrote:
> > Please pull the below signed tag for a trio of minor changes
> > adding PCIe for the ARM ARTPEC SoC.
> > 
> > Thanks!
> > 
> > /Jesper
> > 
> > The following changes since commit bc33b0ca11e3df467777a4fa7639ba488c9d4911:
> > 
> >   Linux 4.9-rc4 (2016-11-05 16:23:36 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/jesper/artpec.git tags/artpec-for-4.10
> > 
> > for you to fetch changes up to fa5541fc806771a108cd2a48245a229f1ba539ea:
> > 
> >   ARM: dts: artpec: add pcie support (2016-11-10 15:51:10 +0100)
> > 
> > ----------------------------------------------------------------
> > ARTPEC changes for 4.10
> > 
> > ----------------------------------------------------------------
> > Niklas Cassel (3):
> >       ARM: ARTPEC-6: add select MFD_SYSCON to MACH_ARTPEC6
> >       ARM: ARTPEC-6: add pcie related options
> >       ARM: dts: artpec: add pcie support
> > 
> > 
> 
> Hi Jesper and Niklas,
> 
> I just found the old pull request while going through my mail backlog.
> 
> A few things for you to remember for next time:
> 
> - please send pull requests "To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" so we know they
>   are destined for arm-soc

Ok, should we add that in the MAINTAINERS file so we can
get it automatically from get_maintainer?

> - please split up changes to the platform code from dts changes,
>   defconfig changes and driver changes. Each of them gets sent
>   to Linus in a separate arm-soc branch, so we have to pull them
>   in separately too
> 
> - For the signed tag, please put in a cleartext description of
>   the branch, just like you describe each commit in its changelog
>   text. The tag comment becomes the merge commit text.

Ok, will do both in the future.

> - I've looked at the three patches individually and cherry-picked
>   the first into next/soc and the third into next/dt. The patch
>   "ARM: ARTPEC-6: add pcie related options" is no longer needed
>   after commit e13688f ("ARM: select PCI_DOMAINS config from
>   ARCH_MULTIPLATFORM"), so I dropped that.

Thanks!

> 	Arnd

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson-VrBV9hrLPhE@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
