From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 30/30] ARM: sun8i: a83t: full range OPP
 tables and CPUfreq
Date: Thu, 6 Sep 2018 13:42:41 +0200
Message-ID: <20180906114241.zuesfnxuoovxiig6@flea>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-31-embed3d@gmail.com>
 <20180906072429.7qjwbbqsjlbskk6v@qschulz>
 <c76e71bc-6bc5-f73c-2c7a-c9315cf2da31@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="md6uljqxnk54hfq3"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMVFYTOAKGQEU6RC2LA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <c76e71bc-6bc5-f73c-2c7a-c9315cf2da31-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--md6uljqxnk54hfq3
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Sep 06, 2018 at 01:39:43PM +0200, Philipp Rossak wrote:
> On 06.09.2018 09:24, Quentin Schulz wrote:
> > Hi Philipp,
> > 
> > On Thu, Aug 30, 2018 at 05:45:18PM +0200, Philipp Rossak wrote:
> > > Since we have now thermal trotteling enabeled we can now add the full
> > > range of the OPP table.
> > > 
> > That's not the reason why they were not added.
> > 
> > Please see commit 2db639d8c1663d7543c9ab5323383d94c8a76c63[1].
> > 
> > Basically, you only want the OPPs which can work below or at the default
> > voltage of the CPU supply, because the CPU supply is specific to each
> > board.
> > 
> > If you set your CPU to work at a given frequency and the voltage isn't
> > updated (saying opp-microvolt = <x>; in DT isn't enough, you need
> > cpu-supply to be provided and functional), the CPU might just crash.
> > 
> > Without cpu-supply property, underclocking isn't effective in term of
> > thermal cooling or power saving. Overclocking is very, very, very likely
> > to make the CPU crash.
> > 
> > It's not a very difficult thing to do to test if a given frequency work
> > well but it needs a specific test environment and it's a lengthy test,
> > you can have a look at those tools here[3] if you like. It's not because
> > it works in a given test case that'll work on the long term under heavy
> > load and constant frequency changes.
> > 
> > For A83T, I already did it and the outcome is the patch in [1]. Same for
> > A33.
> > 
> > So, if you want to use these three higher OPPs, you need to define them
> > in your board DTS and add the cpu-supply property. See what's done for
> > the A33 and more specifically the Sinlinx SinA33[2] as an example.
> > 
> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2db639d8c1663d7543c9ab5323383d94c8a76c63
> > [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts
> > [3]http://linux-sunxi.org/Hardware_Reliability_Tests#CPU
> > 
> > Quentin
> > 
> 
> Hey Quentin,
> 
> thanks for your feedback!
> 
> Sounds like we will never be able to run the A83T on its maximum frequency
> in mainline.
> 
> I will do some testing, during the next weeks/months when I have time.
> With the old Allwinner kernel I was able to run the A83T with its maximum
> frequency without any problems since my board is very good cooled.

You definitely can, but I think Quentin's point was to do it on a
per-board basis, not for all of the A83t boards at once.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--md6uljqxnk54hfq3--
