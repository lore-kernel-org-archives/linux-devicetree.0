From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: phy: add binding for
 Allwinner USB3 PHY
Date: Mon, 8 Apr 2019 09:14:04 +0200
Message-ID: <20190408071404.v3qjtivfqc2uz5le@flea>
References: <20190405205736.55177-1-icenowy@aosc.io>
 <20190405205736.55177-3-icenowy@aosc.io>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="prlrlu4r6usqt5ir"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBP7JVPSQKGQEPQCLYGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190405205736.55177-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--prlrlu4r6usqt5ir
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Sat, Apr 06, 2019 at 04:57:33AM +0800, Icenowy Zheng wrote:
> The new Allwinner H6 SoC contains a USB3 PHY that is wired to the
> external USB3 pins of the SoC.
>
> Add a device tree binding for the PHY.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

I know that this isn't the first iteration, and sorry if this comes
out a bit late, but could you make a YAML schemas for this instead?

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--prlrlu4r6usqt5ir--
