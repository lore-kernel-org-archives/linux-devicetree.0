From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: h5: Add device
 tree for Bananapi M2 Plus H5
Date: Fri, 31 Aug 2018 12:17:42 +0200
Message-ID: <20180831101742.3ybvf6d3refft454@flea>
References: <20180830080926.15027-1-wens@csie.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ksm7qmedlgyr56ax"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSFLUTOAKGQE53WXPKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180830080926.15027-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ksm7qmedlgyr56ax
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Aug 30, 2018 at 04:09:23PM +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> Allwinner's H5 SoC is pin compatible with the H3 SoC. As such, some
> vendors produce H3 and H5 variants for the same device. Such is the
> case with Libre Computer's ALL-H3-CC, and the Bananapi M2 Plus.
> 
> This series follows that of the ALL-H3-CC, splitting out a common
> board dtsi, and then two SoC-specific dts files that include the
> SoC level and common board dtsi's, as well as putting in the board
> name. The first patch is a minor fix that I think should be done
> before the migration.
> 
> Please have a look.

Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

> Also, on a related matter, Bananapi recently released revision v1.2
> of the M2 Plus. The original commercially available version was v1.1.
> v1.2 adds a GPIO control that can change the CPU cores' supply voltage
> between 1.1V and 1.3V. Do we want two extra dts files for this? Put
> them in the existing dts files regardless? Or let people handle this
> via overlays?

If that the sole change, I'd be inclined to merge it as a separate DT
for that particular version. Is there any way to detect it at runtime?

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ksm7qmedlgyr56ax--
