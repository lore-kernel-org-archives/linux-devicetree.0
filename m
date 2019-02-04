From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 1/3] phy: meson8b-usb2: Enable otg phy controller on
 Meson8b SoCs
Date: Tue, 5 Feb 2019 01:32:45 +0530
Message-ID: <CANAwSgSQH2zta+tOcqnM3JPZ45XkqWEJAWOL3Do0Mnrbam8VSw@mail.gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-2-linux.amoon@gmail.com>
 <CAFBinCCOQ_GqHZuYf6n8ba_ZMbOwKmUzc4EJAuXRpn4tTTCUKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAFBinCCOQ_GqHZuYf6n8ba_ZMbOwKmUzc4EJAuXRpn4tTTCUKA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Martin,

Thanks for your review comment.
Please find my comments below.

On Mon, 4 Feb 2019 at 18:51, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Wed, Jan 23, 2019 at 4:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Meson8b support two USB phy controller, one with otg port and
> > other usb host controller. USB OTG controller ie. otg port can
> > be used to power on board or host port for usb device.
> > Changes enable usb otg host controller when dr_mode is set to otg.
> can you please add a sentence explaining *why* this allows enabling USB OTG?
>
> > Currenly otg port can be used to power on the board.
> typo, should be "Currently"

Ok I will fix this next version.

>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > New patch in this series.
> > --TOTO enable OTG port to work as host.
> > --Currently we can power on the board from this OTG port.
> >
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
> >         |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
> >         |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
> >         |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
> >         |__ Port 3: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 480M
> >         |__ Port 3: Dev 3, If 3, Class=Audio, Driver=snd-usb-audio, 480M
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
> > ---
> >  drivers/phy/amlogic/phy-meson8b-usb2.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
> > index 9c01b7e19b06..1333c77e9172 100644
> > --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
> > +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
> > @@ -109,6 +109,7 @@
> >
> >  #define RESET_COMPLETE_TIME                            500
> >  #define ACA_ENABLE_COMPLETE_TIME                       50
> > +#define DCD_ENABLE_COMPLETE_TIME                       10
> >
> >  struct phy_meson8b_usb2_priv {
> >         void __iomem            *regs;
> > @@ -188,6 +189,20 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
> >
> >                 udelay(ACA_ENABLE_COMPLETE_TIME);
> >
> > +               if (phy_meson8b_usb2_read(priv, REG_ADP_BC) &
> > +                       REG_ADP_BC_ACA_PIN_FLOAT) {
> > +                       dev_warn(&phy->dev, "USB ID detect failed!\n");
> > +                       clk_disable_unprepare(priv->clk_usb);
> > +                       clk_disable_unprepare(priv->clk_usb_general);
> > +                       return -EINVAL;
> > +               }
> > +       } else if (priv->dr_mode == USB_DR_MODE_OTG) {
> > +               phy_meson8b_usb2_mask_bits(priv, REG_ADP_BC,
> > +                                          REG_ADP_BC_DCD_ENABLE,
> > +                                          REG_ADP_BC_DCD_ENABLE);
> where did you take this from?

As per the schematic it's otg phy,
I study the code to enable "host" mode for phy1 and on similar line I
tried to enable otg phy.
this changes will come into effect when we set dr_mode="otg" in dts.
but it do not enable this as host port.

*Second thought this enable DCD which seem the be wrong. Thanks for porting out*
We could set this to 0 at initial state for now and it will work as it should.
I will send the correct fix later.

> $ grep -iR DCD arm-src-kernel-2015-01-15-321cfb5a46/drivers/amlogic/usb/dwc_otg/310/
> -> I only find code which clears REG_ADP_BC_DCD_ENABLE (your patch sets it):
>   adp_bc.b.dcd_enable = 0;

This usb port act as a changer port but it also depend on the how this
port is tuned to various states as shown below.

Standard Downstream Port (SDP) is a downstream port that complies
              with the USB 2.0 or USB 3.0 definition of a host or hub.
Charging Downstream Port (CDP) is a downstream port that complies
              with the USB 2.0 or USB 3.0 definition of a host or a hub.
Dedicated Charging Port (DCP)  is a downstream port on a device
              that outputs power through a USB connector.

We cannot observe this now because this behave like a states machine which
is possible handled both in kernel driver and u-boot of Amlogic.
As per schematics this (page 7)  we have a external jumper set to
control the power path of the port.

Odroid Wiki also says so.
[0] https://wiki.odroid.com/odroid-c1/hardware/otg_power_enable

>
> > +               udelay(DCD_ENABLE_COMPLETE_TIME);
> from Amlogic's code: DWC_MDELAY(T_DCD_TIMEOUT);
> while you are also using a delay of "10" the unit is different (your
> patch: us, Amlogic: ms)
>

This timeout is basically used in the state machine in the kernel and
u-boot to tune the phy
Not sure this changes will affect the phy power state.

>
> Regards
> Martin

Best Regards


-Anand
