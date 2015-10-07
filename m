From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 0/5] ARM: sunxi: Add Reduced Serial Bus support
Date: Wed, 7 Oct 2015 11:00:01 +0100
Message-ID: <20151007100001.GD2278@lukather>
References: <1443700673-24312-1-git-send-email-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIW22OYAKGQEGV3632A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443700673-24312-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Oct 01, 2015 at 07:57:46PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is my fifth attempt at adding support for Allwinner's Reduced
> Serial Bus (RSB), which is used to communicate with PMICs and other
> peripherals on their newer SoCs, such as the A23/A33/A80.
> 
> RSB is a simplified two wire interface using push-pull outputs,
> supporting multiple slaves, address and data parity checks, and
> clock speeds up to 20 MHz. The bus only supports simple register
> read/writes, with possible register sizes of 8/16/32 bits. Access
> sizes not matching the slave device register sizes result in NACKs
> or errors. 32 bit registers in devices have yet to be seen.
> 
> v4 and later adds a platform driver for the RSB controller under
> drivers/soc/sunxi, which adds a custom driver type and bus type
> for slave drivers to use. Custom regmap support is also merged
> into the controller driver. Currently the driver only exports 2
> symbols: sunxi_rsb_driver_register() & __devm_regmap_init_sunxi_rsb().

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--AkbCVLjbJ9qUtAXD--
