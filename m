From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v4 5/7] ARM: dts: sun8i: v40: bananapi-m2-berry: Add
 Bluetooth device node
Date: Tue, 23 Apr 2019 18:12:21 +0200
Message-ID: <20190423161221.27rvt3zvlobbmptn@flea>
References: <1555600282-9405-1-git-send-email-pgreco@centosproject.org>
 <1555600282-9405-6-git-send-email-pgreco@centosproject.org>
 <20190418155613.shiv7geoqyzfy4kf@flea>
 <bc5d7e91-74c5-103a-db72-6cb1f3ef53b9@centosproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bc5d7e91-74c5-103a-db72-6cb1f3ef53b9@centosproject.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo =?utf-8?Q?Sebasti=C3=A1n?= Greco <pgreco@centosproject.org>
Cc: linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 18, 2019 at 01:14:35PM -0300, Pablo Sebastián Greco wrote:
>
> El 18/4/19 a las 12:56, Maxime Ripard escribió:
> > On Thu, Apr 18, 2019 at 12:11:20PM -0300, Pablo Greco wrote:
> > > Since the bananapi-m2-ultra and the bananapi-m2-berry have the same
> > > WiFi/Bluetooth, add the required nodes to the bananapi-m2-berry.
> > >
> > > Signed-off-by: Pablo Greco <pgreco@centosproject.org>
> > > ---
> > >   arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 26 +++++++++++++++++++++++
> > >   1 file changed, 26 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> > > index 78f4a1a..3d0bb7e 100644
> > > --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> > > +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> > > @@ -96,6 +96,8 @@
> > >   	wifi_pwrseq: wifi_pwrseq {
> > >   		compatible = "mmc-pwrseq-simple";
> > >   		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
> > > +		clocks = <&ccu CLK_OUTA>;
> > > +		clock-names = "ext_clock";
> > >   	};
> > >   };
> > >
> > > @@ -171,6 +173,11 @@
> > >   	status = "okay";
> > >   };
> > >
> > > +&pio {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&clk_out_a_pin>;
> > > +};
> > > +
> > I'm not sure you answered my question about why that is needed?
> Because it is the same case as https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts?id=1e5f1db4ccd8348a21da55bff82f4263000879ef
> I can repeat that info in this commit log

Yes, please.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
