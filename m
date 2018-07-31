From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i: Add initial Orangepi Zero
 Plus 2 H3 support
Date: Tue, 31 Jul 2018 16:15:16 +0200
Message-ID: <20180731141516.t67esj3dlatvm7gg@flea>
References: <20180727125739.22871-1-diego.rondini@kynetics.com>
 <20180730084519.iqyhvocxsfuopze7@flea>
 <CAMfw5YpH1nbO1eYGoAOEEreboHs3VEY61x8qRO-BYDcGS+DBqg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6xewxfb3utvscbte"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB5W5QHNQKGQE4HAGL2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMfw5YpH1nbO1eYGoAOEEreboHs3VEY61x8qRO-BYDcGS+DBqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Diego Rondini <diego.rondini-WVsNeAwskfdWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6xewxfb3utvscbte
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, Jul 30, 2018 at 11:17:44AM +0200, Diego Rondini wrote:
> >> +&uart1 {
> >> +     pinctrl-names = "default";
> >> +     pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> >> +     status = "okay";
> >> +};
> >
> > I guess it is the BT chip? Which chip is it?
> 
> Yes, according to schematics Bluetooth is on uart1.
> It's an Ampak 6212A with a Broadcom 43438 chip. To my understanding
> it's the same chip in the Raspberry Pi 3 B / B+ and Raspberry Zero W.
> 
> I've tried to integrate support for Bluetooth with the following:
> 
> &uart1 {
>     pinctrl-names = "default";
>     pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>     status = "okay";
> 
>     bluetooth {
>         compatible = "brcm,bcm43438-bt";
>         max-speed = <2000000>;
>         shutdown-gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
>         device-wakeup-gpios = <&pio 9 2 GPIO_ACTIVE_HIGH>; /* PL2 */
>         host-wakeup-gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>; /* PA20 */
>     };
> };
> 
> but the hci_bcm driver doesn't load automatically and doesn't probe
> the device when loaded manually. I haven't investigated further.

I would expect to have a clock and psosibly a regulator needed to
before being able to power the BT chip properly. You probably want to
double check the polarity of the GPIOs too.

At this point, the driver and the bindings are there, so there's no
real excuse to not enable it in the DT.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--6xewxfb3utvscbte--
