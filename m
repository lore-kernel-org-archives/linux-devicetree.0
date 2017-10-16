From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: sun8i: r40: add USB host port
 nodes for R40
Date: Mon, 16 Oct 2017 11:32:29 +0200
Message-ID: <20171016093229.waizww2n4gwn4qpw@flea.lan>
References: <20171008042906.46779-1-icenowy@aosc.io>
 <20171008042906.46779-3-icenowy@aosc.io>
 <20171009210340.ak6wo3vqnwj4gom4@flea.home>
 <55B35500-67FC-40AA-9A07-98C843DE55B3@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="veiddsuyse3zvzmb"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBOPZSHHQKGQEDTNM2FY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <55B35500-67FC-40AA-9A07-98C843DE55B3-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--veiddsuyse3zvzmb
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Oct 10, 2017 at 07:24:28AM +0800, Icenowy Zheng wrote:
> >> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> >> +			clocks = <&ccu CLK_BUS_OHCI1>,
> >> +				 <&ccu CLK_BUS_EHCI1>,
> >> +				 <&ccu CLK_USB_OHCI1>;
> >> +			resets = <&ccu RST_BUS_OHCI1>,
> >> +				 <&ccu RST_BUS_EHCI1>;
> >
> >Why do you need to take the OHCI resources too?
> 
> AW's strange design -- without OHCI resources taken EHCI
> won't work.

How has this been tested?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--veiddsuyse3zvzmb--
