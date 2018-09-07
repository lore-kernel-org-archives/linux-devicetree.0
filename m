From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 08/11] arm64: dts: allwinner: a64: Add
 display pipeline
Date: Fri, 7 Sep 2018 10:21:22 +0200
Message-ID: <20180907082122.bcylf2jpf6eq6dgq@flea>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-9-icenowy@aosc.io>
 <20180905075056.tob7itg3judccooe@flea>
 <CAMty3ZBo+X5o22i1=HR9d1VjkEWQ7=DHHPL9RLtbzbyzCZLyFw@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oztiuxukmzniiijw"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBA7KZDOAKGQEHQHWVTA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZBo+X5o22i1=HR9d1VjkEWQ7=DHHPL9RLtbzbyzCZLyFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--oztiuxukmzniiijw
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Sep 07, 2018 at 09:43:29AM +0530, Jagan Teki wrote:
> On Wed, Sep 5, 2018 at 1:20 PM, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Tue, Sep 04, 2018 at 12:40:50PM +0800, Icenowy Zheng wrote:
> >> +             hdmi_phy: hdmi-phy@1ef0000 {
> >> +                     compatible = "allwinner,sun8i-h3-hdmi-phy";
> >> +                     reg = <0x01ef0000 0x10000>;
> >> +                     clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
> >> +                              <&ccu 7>;
> >> +                     clock-names = "bus", "mod", "pll-0";
> >> +                     resets = <&ccu RST_BUS_HDMI0>;
> >> +                     reset-names = "phy";
> >> +                     #phy-cells = <0>;
> >> +             };
> >
> > This needs to use the bindings we have for that phy.
> 
> You mean allwinner,sun50i-a64-hdmi-phy ?

Yes

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--oztiuxukmzniiijw--
