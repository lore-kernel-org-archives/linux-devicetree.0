From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 9/9] ARM: dts: sun8i: s3: add devicetree
 for Lichee zero plus w/ S3
Date: Mon, 24 Jun 2019 15:48:56 +0200
Message-ID: <20190624134856.4cez7m3uc3tzkpuc@flea>
References: <20190623043801.14040-1-icenowy@aosc.io>
 <20190623043801.14040-10-icenowy@aosc.io>
 <20190624124301.chwhfalk5o53fm5x@flea>
 <1E6AB747-5A4C-4515-A0EB-F0E89F520CF7@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zxvkkmn55l32dkjm"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTNJYPUAKGQEJI2WZXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1E6AB747-5A4C-4515-A0EB-F0E89F520CF7-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zxvkkmn55l32dkjm
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jun 24, 2019 at 09:43:23PM +0800, Icenowy Zheng wrote:
> >> +&usb_otg {
> >> +	dr_mode = "otg";
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usbphy {
> >> +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> >> +	status = "okay";
> >> +};
> >
> >How can it do OTG if there's no controllable VBUS regulator?
>
> All 5V's are connected together, like Orange Pi Zero.

So it's a "it can't"?

And the orange pi zero says that it can only do peripheral.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--zxvkkmn55l32dkjm--
