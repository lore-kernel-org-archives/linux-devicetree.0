From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: sun5i: Add dts file for the
 Empire Electronix D709 tablet
Date: Mon, 21 Dec 2015 17:10:30 +0100
Message-ID: <20151221161030.GZ30359@lukather>
References: <1450611782-9494-1-git-send-email-hdegoede@redhat.com>
 <1450611782-9494-4-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fq7EdiloNwzjWdQG"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBAWJ4CZQKGQEIJ3JGFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450611782-9494-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Fq7EdiloNwzjWdQG
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sun, Dec 20, 2015 at 12:43:01PM +0100, Hans de Goede wrote:
> The Empire Electronix D709 tablet is a fairly standard 7" A13 tablet,
> featuring usb-wifi, a micro-sd slot, micro-usb otg and headphone jack.
> 
> Empire Electronix is written on the back of the tablet, the D709 model
> info can be found in the about tablet menu in android.
> 
> The PCB has no markings to speak of.
> 
> This dts file does not add support for the ft5x touchscreen found at
> i2c bus 1, addr 0x38, irq PG11, because it does not work out of the box.
> It seems it has been flashed with the wrong firmware and needs to have
> alternative firmware uploaded at boot to make the touchscreen work
> properly, when hot-booting from android into an upstream kernel the
> touchscreen does work.
> 
> The Memsic MXC622X accelerometer at i2c bus 1, addr 0x15 also is not
> enabled as there is no driver for it.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Fq7EdiloNwzjWdQG--
