From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 5/9] ARM: dts: sun8i: sinlinx-sina33: Add
 AXP223 PMIC device and regulator nodes
Date: Sun, 22 Nov 2015 20:46:43 +0100
Message-ID: <20151122194643.GP32142@lukather>
References: <1447691908-25456-1-git-send-email-wens@csie.org>
 <1447691908-25456-6-git-send-email-wens@csie.org>
 <20151120111238.GV32142@lukather>
 <CAGb2v67RxuQT4AffPbdW29yLMn7jjHgiqwXTGmgf8VgqT-fN9g@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="owpTafYe/1tj88Rh"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBJNXZCZAKGQE7CERAFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67RxuQT4AffPbdW29yLMn7jjHgiqwXTGmgf8VgqT-fN9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--owpTafYe/1tj88Rh
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Nov 21, 2015 at 01:24:24AM +0800, Chen-Yu Tsai wrote:
> >> +&reg_rtc_ldo {
> >> +     regulator-always-on;
> >> +     regulator-min-microvolt = <3000000>;
> >> +     regulator-max-microvolt = <3000000>;
> >> +     regulator-name = "vcc-rtc";
> >>  };
> >
> > Isn't this supposed to be in the AXP DTSI?
> 
> Are you referring to &reg_rtc_ldo?

Yep :)

> Yes, it should. I'll do a new version.

Great, thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--owpTafYe/1tj88Rh--
