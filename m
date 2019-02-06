From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFCv1 2/3] ARM: dts: meson8b: odroidc1: fix USB power supplies
 for phy
Date: Wed, 6 Feb 2019 12:28:31 +0100
Message-ID: <CAFBinCCFoBkbf-HvEoMk7mTYTBV27nJ9TF1X-DrLuHR9qDVDSA@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-3-linux.amoon@gmail.com>
 <CAFBinCAdf0rtt-7tON_LRNH_cpvGJXX3LX8g-i4xsC3wahZSVA@mail.gmail.com>
 <CANAwSgQ4=Vn6RM4Kpd20UWkQNW81=mfg-qB0G73dsRem3qwjcA@mail.gmail.com>
 <CAFBinCB=3kmuFb_xXzhW+m8dTasVrCHQp2wti+=5UjrAHk5TTg@mail.gmail.com>
 <CANAwSgQnMkXECkCVjFKwNKB+2JoiPtVPQbateppmtgfPYCutZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANAwSgQnMkXECkCVjFKwNKB+2JoiPtVPQbateppmtgfPYCutZg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Tue, Feb 5, 2019 at 8:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > my interpretationfor the Amlogic SoCs is:
> > - vusb_a and vusb_d are generated internally, not sure if there's an
> > external fixed regulator
> > - there is no phy-supply (the PHY itself is powered by clock-gating
> > using the CLKID_USB clock)
> > - usb0 VBUS is controlled by GPIOAO_5
> >
>
> But as per the device tree binding
>
> [0] https://elixir.bootlin.com/linux/v5.0-rc5/source/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
> [1] https://elixir.bootlin.com/linux/v5.0-rc5/source/Documentation/devicetree/bindings/phy/phy-bindings.txt
>
> its uses phy-supply to enable power to usb phy which seem to be correct option.
phy-bindings.txt states that "phy-supply" is a "Phandle to a regulator
that provides power to the PHY".
I have written the example in meson8b-usb2-phy.txt and I think it's
wrong (back when I wrote it I didn't know about the "vbus-supply"
property on the controller and I didn't know about the VBUS
constraints).

I believe that the phy-supply property is intended for PHYs which need
an external power supply (for example because they are not embedded
into a SoC or if the SoC has separate voltage inputs for the PHY).
I'm not aware of any PHY supply voltage on the Amlogic SoCs (I believe
this is done internally within the SoC). instead they use clock gating
to power down the PHY.

as far as I understand the VBUS signal it depends on the USB mode:
- host provides VBUS
- peripheral devices are powered using this voltage
- with OTG VBUS needs to be turned on or off depending on the current
mode (host or peripheral)
with the "phy-supply" property there's no way to manage the regulator
depending on the USB mode (host or peripheral), it will always be
"on".


Regards
Martin
