From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: bananapi-m64:
 Add LED device node
Date: Tue, 5 Dec 2017 11:05:11 +0100
Message-ID: <20171205100511.ohxcqlrozxfgq6id@flea.lan>
References: <20171201162733.23156-1-wens@csie.org>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n3of7gmhmumilpfh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBYW6THIQKGQETJLJMWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20171201162733.23156-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--n3of7gmhmumilpfh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Sat, Dec 02, 2017 at 12:27:33AM +0800, Chen-Yu Tsai wrote:
> The Bananapi-M64 has 3 LEDS in red, green, and blue. These are toggled
> via GPIO lines, which drive transistors that control current across the
> LEDS. The red LED is by default on, via an additional pull-up on the
> control line. We consider this means that it is a power indicator.
> So we set the "default-on" property for it.
> 
> The pingroups the GPIO lines belong to require external regulators be
> enabled to be able to drive the GPIO high. These regulators also have
> other purposes. However the pin controller does not have bindings for
> regulators. Here we just set them to always-on.

I guess we should take the opportunity to do just that.

We have been deferring this for quite some time now, this is a perfect
occasion to do it once and for all :)

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--n3of7gmhmumilpfh--
