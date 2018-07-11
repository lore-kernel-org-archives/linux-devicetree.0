From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH 1/2] ARM: sun8i: h3: enable HDMI output
 on Banana Pi M2 Zero
Date: Wed, 11 Jul 2018 17:14:19 +0200
Message-ID: <3039364.lZKhBVCAIj@jernej-laptop>
References: <20180711132233.42301-1-icenowy@aosc.io> <20180711132233.42301-2-icenowy@aosc.io> <20180711150532.6gzm7krouriddreh@flea>
Reply-To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDP4JJM5QYGRBT55TDNAKGQEWYS4TQI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180711150532.6gzm7krouriddreh@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dne sreda, 11. julij 2018 ob 17:05:32 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Wed, Jul 11, 2018 at 09:22:32PM +0800, Icenowy Zheng wrote:
> > Banana Pi M2 Zero board has a miniHDMI port connected to the HDMI
> > controller of Allwinner H3 SoC.
> > 
> > Enable the HDMI output in Banana Pi M2 Zero device tree.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> > ---
> > 
> >  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts index
> > 7d01f9322658..eb61dcf32797 100644
> > --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> > @@ -26,6 +26,17 @@
> > 
> >  		stdout-path = "serial0:115200n8";
> >  	
> >  	};
> > 
> > +	hdmi-connector {
> > +		compatible = "hdmi-connector";
> > +		type = "c";
> 
> This is not one of the connector type declared in DRM, how is it
> exposed to the userspace?

DT binding allows it:

HDMI Connector
==============

Required properties:
- compatible: "hdmi-connector"
- type: the HDMI connector type: "a", "b", "c", "d" or "e"

but DW HDMI bridge driver hardcodes it to type A. Actually, kernel has defines 
only for type A and B.

Actually, many HDMI drivers have type A hardcoded...

Best regards,
Jernej
