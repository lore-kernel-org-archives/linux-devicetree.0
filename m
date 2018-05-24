From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] arm64: allwinner: a64: Add Amarula
 A64-Relic initial support
Date: Thu, 24 May 2018 10:54:27 +0200
Message-ID: <20180524085427.xs6yzhpa42zop6e5@flea>
References: <20180522132228.6564-1-jagan@amarulasolutions.com>
 <20180522143044.pgwawojiwnk2lzxb@flea>
 <CAMty3ZD3JT-ToGAUHN_uj7uVK-jkyAwfEdTBCmJSj34bACFpYQ@mail.gmail.com>
 <20180523081830.4ly6sj34reabbttn@flea>
 <CAMty3ZC-N-6WzYg+kYd2+V3wbQdQmvU706Nog_Urd_EUaWnQjQ@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e7gzo5xpcsc36slw"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBT73THMAKGQETFF5TVA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZC-N-6WzYg+kYd2+V3wbQdQmvU706Nog_Urd_EUaWnQjQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--e7gzo5xpcsc36slw
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, May 23, 2018 at 03:57:05PM +0530, Jagan Teki wrote:
> On Wed, May 23, 2018 at 1:48 PM, Maxime Ripard
> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> > On Wed, May 23, 2018 at 11:44:56AM +0530, Jagan Teki wrote:
> >> On Tue, May 22, 2018 at 8:00 PM, Maxime Ripard
> >> <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> >> > On Tue, May 22, 2018 at 06:52:28PM +0530, Jagan Teki wrote:
> >> >> Amarula A64-Relic is Allwinner A64 based IoT device, which support
> >> >> - Allwinner A64 Cortex-A53
> >> >> - Mali-400MP2 GPU
> >> >> - AXP803 PMIC
> >> >> - 1GB DDR3 RAM
> >> >> - 8GB eMMC
> >> >> - AP6330 Wifi/BLE
> >> >> - MIPI-DSI
> >> >> - CSI: OV5640 sensor
> >> >> - USB OTG
> >> >
> >> > You claim that this is doing OTG...
> >> >
> >> > [..]
> >> >
> >> >> +&usb_otg {
> >> >> +     dr_mode = "peripheral";
> >> >> +     status = "okay";
> >> >> +};
> >> >
> >> > ... and yet you're setting it as peripheral...
> >>
> >> Though it claims OTG, board doesn't have any USB ports to operate(not
> >> even Mini-AB) the only way to use the board as peripheral to transfer
> >> images from host.
> >
> > I'm not sure what you mean here. If there's no USB connector, why do
> > you even enable it?
> 
> I'm saying there is no host port on board. Board has connector
> header[1] comes with few pins includes USB D+, D-, ID, VBUS, GROUND,
> UART0 TX, RX etc. we have to connect wires to these pins to make
> pluggable USB to host pc. and here USB pins used for transferring data
> from host pc to target board like in peripheral mode.

I'm still unsure how it's relevant. If the wire is plugged on your
board's header, is there anything that prevents using it as a host
assuming you have a proper connector on the other end of your wire?

Maxime

-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--e7gzo5xpcsc36slw--
