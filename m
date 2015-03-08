From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: dts: sun5i: Add new Auxtek-t004 board
Date: Sun, 8 Mar 2015 18:21:57 +0100
Message-ID: <20150308172157.GE5085@lukather>
References: <1425754884-7875-1-git-send-email-hdegoede@redhat.com>
 <1425754884-7875-4-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB2MR6KTQKGQEPOC7PIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425754884-7875-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Mar 07, 2015 at 08:01:21PM +0100, Hans de Goede wrote:
> The auxtek-t004:
> http://www.fasttech.com/products/1110/10004200/1318603-auxtek-t004-allwinner-a10s-single-core-android-ics
> 
> Is an Allwinner A10s based hdmi tv stick with with 512M RAM, 4G nand flash,
> toc9002 (bcm43362) sdio wifi, 1 USB host ports using an USB-A receptacle and
> a 2 micro-usb receptacles, one for power and one for USB OTG.
> 
> The sdio wifi appears to not have an oob irq hooked up, so we rely on sdio-irq
> support for it.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> foo

I'm not sure what that foo was about :)

I removed it, and applied the patch, thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--5oH/S/bF6lOfqCQb--
