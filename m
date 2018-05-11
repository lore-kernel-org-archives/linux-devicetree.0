From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: a64: Add Amarula A64
 Relic initial support
Date: Fri, 11 May 2018 16:57:58 +0200
Message-ID: <20180511145758.z3ufqu3njnm7kb2m@flea>
References: <20180511054307.3410-1-jagan@amarulasolutions.com>
 <CAGb2v67ZDUqLGiWfocZXzGY54dYcSVUMC-xz87xaJQs88-nqyw@mail.gmail.com>
 <CAMty3ZCM7Sxsp4MwDRYq9NSfWJfj6XKK6JN9DKyk91MNrLvPAg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="obqtqp7m74x2wcoj"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6G623LQKGQEASDB5DY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZCM7Sxsp4MwDRYq9NSfWJfj6XKK6JN9DKyk91MNrLvPAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--obqtqp7m74x2wcoj
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, May 11, 2018 at 11:37:04AM +0530, Jagan Teki wrote:
> On Fri, May 11, 2018 at 11:20 AM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> > On Thu, May 10, 2018 at 10:43 PM, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> >> Amarula A64 Relic is Allwinner A64 based IoT device, which support
> >> - Allwinner A64 Cortex-A53
> >> - Mali-400MP2 GPU
> >> - AXP803 PMIC
> >> - 1GB DDR3 RAM
> >> - 8GB eMMC
> >> - AP6330 Wifi/BLE
> >> - MIPI-DSI
> >> - CSI: OV5640 sensor
> >> - USB OTG
> >> - 12V DC power supply
> >>
> >> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> >> ---
> >> Changes for v2:
> >> - Rename dts name to sun50i-a64-relic.dts which is simple to use
> >
> > This is subjective. For other users this hardly qualifies to
> > identify the board. Please keep the vendor / brand name in
> > the file name.
> 
> Which I thought initially, but adding vendor makes long string which
> become lengthy for next boards to add it in future. So we make
> notation with <SOC_name>_<board_name> like sun50i-a64-teres-i.dts
> does.

In the case of Teres-I, this is an easily identifiable board, for
which a simple google search can give you very easily what board it is
and where you can get it. Yours fail for both, so I agree with Chen-Yu
here.

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--obqtqp7m74x2wcoj--
