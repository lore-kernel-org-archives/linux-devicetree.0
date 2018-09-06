From: Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 30/30] ARM: sun8i: a83t: full range OPP
 tables and CPUfreq
Date: Thu, 6 Sep 2018 14:06:17 +0200
Message-ID: <20180906120617.gp6yswusnbgsm2eg@qschulz>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-31-embed3d@gmail.com>
 <20180906072429.7qjwbbqsjlbskk6v@qschulz>
 <c76e71bc-6bc5-f73c-2c7a-c9315cf2da31@gmail.com>
 <20180906114241.zuesfnxuoovxiig6@flea>
Reply-To: quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2viiwc2ql2s45nb"
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBRVQYTOAKGQE3CVTZ7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180906114241.zuesfnxuoovxiig6@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--a2viiwc2ql2s45nb
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi Maxime, Philipp,

On Thu, Sep 06, 2018 at 01:42:41PM +0200, Maxime Ripard wrote:
> On Thu, Sep 06, 2018 at 01:39:43PM +0200, Philipp Rossak wrote:
> > On 06.09.2018 09:24, Quentin Schulz wrote:
> > > Hi Philipp,
> > > 
> > > On Thu, Aug 30, 2018 at 05:45:18PM +0200, Philipp Rossak wrote:
> > > > Since we have now thermal trotteling enabeled we can now add the full
> > > > range of the OPP table.
> > > > 
> > > That's not the reason why they were not added.
> > > 
> > > Please see commit 2db639d8c1663d7543c9ab5323383d94c8a76c63[1].
> > > 
> > > Basically, you only want the OPPs which can work below or at the default
> > > voltage of the CPU supply, because the CPU supply is specific to each
> > > board.
> > > 
> > > If you set your CPU to work at a given frequency and the voltage isn't
> > > updated (saying opp-microvolt = <x>; in DT isn't enough, you need
> > > cpu-supply to be provided and functional), the CPU might just crash.
> > > 
> > > Without cpu-supply property, underclocking isn't effective in term of
> > > thermal cooling or power saving. Overclocking is very, very, very likely
> > > to make the CPU crash.
> > > 
> > > It's not a very difficult thing to do to test if a given frequency work
> > > well but it needs a specific test environment and it's a lengthy test,
> > > you can have a look at those tools here[3] if you like. It's not because
> > > it works in a given test case that'll work on the long term under heavy
> > > load and constant frequency changes.
> > > 
> > > For A83T, I already did it and the outcome is the patch in [1]. Same for
> > > A33.
> > > 
> > > So, if you want to use these three higher OPPs, you need to define them
> > > in your board DTS and add the cpu-supply property. See what's done for
> > > the A33 and more specifically the Sinlinx SinA33[2] as an example.
> > > 
> > > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2db639d8c1663d7543c9ab5323383d94c8a76c63
> > > [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
> > > [3]http://linux-sunxi.org/Hardware_Reliability_Tests#CPU
> > > 
> > > Quentin
> > > 
> > 
> > Hey Quentin,
> > 
> > thanks for your feedback!
> > 
> > Sounds like we will never be able to run the A83T on its maximum frequency
> > in mainline.
> > 
> > I will do some testing, during the next weeks/months when I have time.
> > With the old Allwinner kernel I was able to run the A83T with its maximum
> > frequency without any problems since my board is very good cooled.
> 
> You definitely can, but I think Quentin's point was to do it on a
> per-board basis, not for all of the A83t boards at once.
> 

Yes, exactly. That's what we did for the Sinlinx SinA33. Just take
inspiration from it.

You can run the CPU at max frequency with the old Allwinner kernel
because it most likely updates the CPU voltage. Let's say overheating is
not an issue, you still need to have a way to overclock AND overvolt to
the values in the OPP you're targetting. Your CPU won't be stable with
just overclocking without overvolting it, trust me, I've been there.

It can even be possible that the Allwinner BSP is only stable in your
use case.

The CPU voltage is specific to every board (cpu-supply property). So we
do not declare the CPU frequencies that require overvolting since we
cannot be sure a board will define the cpu-supply property and thus, be
able to overvolt the CPU.

So, though thermal throttling is an important feature because
overheating the CPU too much will shut it down on the hardware level
(among other consequences), it does not make the higher OPPs magically
work without a valid and working cpu-supply.

The link I gave you is an important piece of software to test the
stability of a system under heavy load and a lot of frequency changes.
It's important to know that because it works for you in your use case
doesn't make it work in any use case. Testing with these pieces of
software helps to cover more hardcore use cases but isn't perfect of
course. That's a start though.

Quentin
--a2viiwc2ql2s45nb--
