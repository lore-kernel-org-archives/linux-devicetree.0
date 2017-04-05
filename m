From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: allwinner: a64: add USB0
 OHCI/EHCI related devicetree parts
Date: Wed, 5 Apr 2017 15:05:17 +0200
Message-ID: <20170405130517.vr6tanrswanangas@lukather>
References: <20170405125053.6170-1-icenowy@aosc.io>
 <20170405125053.6170-3-icenowy@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mgukt5w6srn4eaue"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBDWXSPDQKGQEIELGZFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20170405125053.6170-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--mgukt5w6srn4eaue
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Wed, Apr 05, 2017 at 08:50:52PM +0800, Icenowy Zheng wrote:
> As we added USB0 route auto switching support for A64, add related
> device tree parts to the A64 DTSI file (EHCI0/OHCI0 controllers and the
> pmu0 memory area for PHY).
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 1c64ea2d23f9..a8916df99048 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -179,8 +179,10 @@
>  		usbphy: phy@01c19400 {
>  			compatible = "allwinner,sun50i-a64-usb-phy";
>  			reg = <0x01c19400 0x14>,
> +			      <0x01c1a800 0x4>,
>  			      <0x01c1b800 0x4>;
>  			reg-names = "phy_ctrl",
> +				    "pmu0",

Again, this needs to be split apart, and sent for 4.11.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--mgukt5w6srn4eaue--
