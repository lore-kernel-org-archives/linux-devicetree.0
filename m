From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v2] arm64: allwinner: a64: Add initial
 NanoPi A64 support
Date: Sat, 10 Jun 2017 22:28:31 +0200
Message-ID: <20170610202831.usdhtuqc4uqxojmr@flea.home>
References: <1497012052-14027-1-git-send-email-jteki@openedev.com>
 <1497012052-14027-2-git-send-email-jteki@openedev.com>
 <20170609145141.aknbsis25vmy3rj6@flea.home>
 <3049841d-36f0-a761-fbed-57971462697c@openedev.com>
 <3b4dda48-c403-88c4-5c89-63753f508d76@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="brhuhlay5acsabzp"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6VM6HEQKGQEDFRYI4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <3b4dda48-c403-88c4-5c89-63753f508d76-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--brhuhlay5acsabzp
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jun 09, 2017 at 04:36:09PM +0100, Andre Przywara wrote:
> Hi,
> 
> On 09/06/17 16:26, Jagan Teki wrote:
> > On Friday 09 June 2017 08:21 PM, Maxime Ripard wrote:
> >> Hi Jagan,
> >>
> >> On Fri, Jun 09, 2017 at 12:40:52PM +0000, Jagan Teki wrote:
> >>> +&i2c1 {
> >>> +    pinctrl-names = "default";
> >>> +    pinctrl-0 = <&i2c1_pins>;
> >>> +    status = "okay";
> >>> +};
> >>> +
> >>> +&i2c1_pins {
> >>> +    bias-pull-up;
> >>> +};
> >>
> >> What is connected on that bus?
> > 
> > i2c1 connected with gpio/i2s
> 
> Those are the I2C pins connected to the headers. We have them in the
> other A64 DTs as well (Pine64, BananaPi).

We've always had the policy of not enabling anything outside of the
board has been there from the very start, arm64 or not.

> If that is not the right approach, we should discuss this and keep it
> consistent at least across the A64 boards.

If some boards slipped through, then that would be on me I guess,
but it's (unfortunate) exceptions.

If you want to ease that for the users, you can have that node with
the pinctrl nodes pre-set, but leave it disabled. We have that on a
number of boards already.

> >>> +&uart1 {
> >>> +    pinctrl-names = "default";
> >>> +    pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> >>> +    status = "okay";
> >>> +};
> >>
> >> And on that UART?
> > 
> > uart1 for SDIO (Wifi connector, with RTS/CTS), this along with mmc1
> 
> To be precise, UART1 (with h/w handshake) is connected to the Bluetooth
> part of the WiFi/BT chip, which is soldered on that board. Regardless of
> the actual *WiFi* support state BT should work already - at least it did
> when I tried this a few months ago on the Pine64 (although this involved
> some userland heavy lifting).
> Not sure what the approach here is in regard to the power supply and
> wake-up GPIOs, shall they be described in this node as well or is that
> up for userspace to control?

There's probably more to it though. Most BT chips require regulators
and clocks to be enabled. Ideally, this would even be a full DT node
for the bluetooth chip.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--brhuhlay5acsabzp--
