From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: add PIO VCC bank
 supplies for Pine H64
Date: Thu, 2 May 2019 09:43:03 +0200
Message-ID: <20190502074303.g3px63n4v4o7xade@flea>
References: <20190424062543.61852-1-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f3jn7gc357berrvh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBCV7VLTAKGQEBQ72EPA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190424062543.61852-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--f3jn7gc357berrvh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Wed, Apr 24, 2019 at 02:25:43PM +0800, Icenowy Zheng wrote:
> The Allwinner H6 SoC features tweakable VCC for PC, PD, PG, PL and PM
> banks.
>
> This patch adds supplies for PC and PD banks on Pine H64 board. PG and
> PM banks are used for Wi-Fi and should be added when Wi-Fi is added

Not really. The regulator is still there, whether we use it or not. If
it's not used, then it will be left disabled so it doesn't really
change anything.

> PL bank is where PMIC is attached, and currently if a PMIC regulator
> is added for it a dependency loop will happen.

I guess we should fix that somehow

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--f3jn7gc357berrvh--
