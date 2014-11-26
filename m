From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/9] clk: sunxi: Give sunxi_factors_register
 a registers parameter
Date: Wed, 26 Nov 2014 21:40:00 +0100
Message-ID: <20141126204000.GM25249@lukather>
References: <1416749895-25013-1-git-send-email-hdegoede@redhat.com>
 <1416749895-25013-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bPrm2PuLP7ysUh6c"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBI7V3CRQKGQEJM25Y7I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416749895-25013-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--bPrm2PuLP7ysUh6c
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Nov 23, 2014 at 02:38:07PM +0100, Hans de Goede wrote:
> Before this commit sunxi_factors_register uses of_iomap(node, 0) to get
> the clk registers. The sun6i prcm has factor clocks, for which we want to
> use sunxi_factors_register, but of_iomap(node, 0) does not work for the prcm
> factor clocks, because the prcm uses the mfd framework, so the registers
> are not part of the dt-node, instead they are added to the platform_device,
> as platform_device resources.
> 
> This commit makes getting the registers the callers duty, so that
> sunxi_factors_register can be used with mfd instantiated platform device too.
> 
> While at it also add error checking to the of_iomap calls.
> 
> This commit also drops the __init function from sunxi_factors_register since
> platform driver probe functions are not __init.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Queued for 3.20, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--bPrm2PuLP7ysUh6c--
