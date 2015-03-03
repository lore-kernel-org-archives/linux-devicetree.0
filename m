From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH] ARM: sun6i: dt: Add new Mele I7 device
Date: Tue, 3 Mar 2015 09:22:09 +0100
Message-ID: <20150303082209.GE4713@lukather>
References: <1425131285-8640-1-git-send-email-codekipper@gmail.com>
 <20150303071635.GC4713@lukather>
 <54F568F8.1040104@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2W72WTQKGQE2PJUUAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54F568F8.1040104-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Mar 03, 2015 at 08:55:36AM +0100, Hans de Goede wrote:
> >>+/ {
> >>+	model = "Mele I7 Quad top set box";
> >>+	compatible = "mele,i7", "allwinner,sun6i-a31";
> >>+
> >>+	chosen {
> >>+		bootargs = "earlyprintk console=ttyS0,115200";
> >
> >Using earlyprintk by default is a bad idea if the kernel is configured
> >with DEBUG_LL support for another SoC.
> 
> While on this subject, u-boot now sets the chosen/stdout-path property
> up by default, which means that the kernel will do the right thing by
> default. So we we really do not need any bootargs= in our dts files.

I just tested that this weekend, and it turned out that the kernel
couldn't use it so far (ie, no output until init takes over and setup
a TTY on ttyS0).

Was it working for you?

> Currently we've a random mix where we do have bootargs in some, but
> not in most sunxi dts files. I believe we should simply remove it
> everywhere...

We used to set them in SoCs that are not supported by U-boot yet, and
where the bootloader won't come and patch the DT (A31, A23, A80).

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--6Vw0j8UKbyX0bfpA--
