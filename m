From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: v40: Update BPi M2
 Berry DTS to the level of M2 Ultra
Date: Thu, 11 Apr 2019 14:28:33 +0200
Message-ID: <20190411122833.c2q5shetb5yxzxaq@flea>
References: <1554983689-47305-1-git-send-email-pgreco@centosproject.org>
 <1554983689-47305-3-git-send-email-pgreco@centosproject.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eipbfyuowstngaw2"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB5HFXTSQKGQEVGADKXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1554983689-47305-3-git-send-email-pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eipbfyuowstngaw2
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Thu, Apr 11, 2019 at 08:54:49AM -0300, pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org wrote:
> From: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
>
> BPi M2 Berry is a trimmed down version of the BPi M2 Ultra, completely
> software compatible.
>
> Changes include:
> - 2GiB -> 1GiB
> - no eMMC
> - no onboard microphone
> - no IR
> - no blue LED
> - no charging (and power jack to USB)
> - dropped USB2 and connect USB1 to a 4-port HUB.
>
> This patch brings the BPi M2 Berry to the same level as the BPi M2 Ultra
> Includes the changes from:
> commit c36fd5a48bd2 ("ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable GMAC
> ethernet controller")
> commit db49c6825901 ("ARM: dts: sun8i: r40: Enable HDMI output on BananaPi
> M2 Ultra")
> commit ccefd95f648a ("ARM: dts: sun8i: r40: Add missing TCON-TOP - TCON
> connections")
> commit 6a7556f604f9 ("ARM: dts: sun8i: r40: Disable TCONs by default.")
> commit 666907a3f9bd ("ARM: dts: sun8i: sun8i-r40-bananapi-m2-ultra: enable
> AHCI")
> commit e5c6e693be83 ("ARM: dts: sun8i: r40: bananapi-m2-ultra: Fix WiFi
> regulator definitions")
> commit 1e5f1db4ccd8 ("ARM: dts: sun8i: r40: bananapi-m2-ultra: Add
> Bluetooth device node")
>
> Signed-off-by: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>

Please make separate commits for each logical changes you're doing.

And there's no need to reference commits as you were doing, it's for a
separate board.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--eipbfyuowstngaw2--
