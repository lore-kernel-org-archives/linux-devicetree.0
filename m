From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: sun7i: Add NFC node to
 Allwinner A20 SoC
Date: Tue, 14 Jun 2016 15:57:16 +0200
Message-ID: <20160614135716.GK9354@lukather>
References: <1465903058-9211-5-git-send-email-mamlinav@gmail.com>
 <201606142105.1AaT2uM6%fengguang.wu@intel.com>
 <20160614161908.53016f4f22c18e9126a041d2@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nrM5Z5VIJgwP9LWp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSE2QC5QKGQETRF7OBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160614161908.53016f4f22c18e9126a041d2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--nrM5Z5VIJgwP9LWp
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Jun 14, 2016 at 04:19:08PM +0300, Aleksei Mamlin wrote:
> On Tue, 14 Jun 2016 21:11:12 +0800
> kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> 
> > Hi,
> > 
> > [auto build test ERROR on mripard/sunxi/for-next]
> > [also build test ERROR on next-20160614]
> > [cannot apply to robh/for-next v4.7-rc3]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Aleksei-Mamlin/dts-sunxi-Add-sunxi-NAND-Flash-Controller-support/20160614-192539
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git sunxi/for-next
> > config: arm-sunxi_defconfig (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (Debian 5.3.1-8) 5.3.1 20160205
> > reproduce:
> >         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         make.cross ARCH=arm 
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> Error: arch/arm/boot/dts/sun7i-a20.dtsi:806.26-27 syntax error
> >    FATAL ERROR: Unable to parse input tree
> > 
> 
> My bad, dual semicolon at line 806. Maxime, can you fix it locally?

Already did :)

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--nrM5Z5VIJgwP9LWp--
