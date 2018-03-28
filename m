From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] dts: ARM: Add Aspeed virtual hub to SoC templates
Date: Wed, 28 Mar 2018 12:03:51 +1100
Message-ID: <1522199031.7364.82.camel@kernel.crashing.org>
References: <1515739918.31850.102.camel@kernel.crashing.org>
 <CACPK8XdgoNLr3m_bp_Y+Cu6pNx5f0xJ5BwWL8svZPgM-YNQA8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACPK8XdgoNLr3m_bp_Y+Cu6pNx5f0xJ5BwWL8svZPgM-YNQA8w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: devicetree <devicetree@vger.kernel.org>, Joel Stanley <joel.stanley@au1.ibm.com>, linux-aspeed@lists.ozlabs.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2018-03-28 at 11:00 +1030, Joel Stanley wrote:
> Hi Ben,
> 
> On 12 January 2018 at 17:21, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > We don't yet enable it in any of the boards
> > 
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> This one slipped through the cracks. Is it still the latest version?

I was going to re-submit it after the driver itself is in.

> 
> Cheers,
> 
> Joel
> 
> > ---
> >  arch/arm/boot/dts/aspeed-g4.dtsi |  8 ++++++++
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 13 +++++++++++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> > index e55f2ad5de59..743b79014d3d 100644
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -120,6 +120,14 @@
> >                         status = "disabled";
> >                 };
> > 
> > +               vhub: usb-vhub@1e6a0000 {
> > +                       compatible = "aspeed,ast2400-usb-vhub";
> > +                       reg = <0x1e6a0000 0x300>;
> > +                       interrupts = <5>;
> > +                       clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +                       status = "disabled";
> > +               };
> > +
> >                 apb {
> >                         compatible = "simple-bus";
> >                         #address-cells = <1>;
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> > index 655258edee24..e50d7f3e18a0 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -163,6 +163,14 @@
> >                         status = "disabled";
> >                 };
> > 
> > +               vhub: usb-vhub@1e6a0000 {
> > +                       compatible = "aspeed,ast2500-usb-vhub";
> > +                       reg = <0x1e6a0000 0x300>;
> > +                       interrupts = <5>;
> > +                       clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> > +                       status = "disabled";
> > +               };
> > +
> >                 apb {
> >                         compatible = "simple-bus";
> >                         #address-cells = <1>;
> > @@ -1388,6 +1396,11 @@
> >                 groups = "USB2AH";
> >         };
> > 
> > +       pinctrl_usb2ad_default: usb2ad_default {
> > +               function = "USB2AD";
> > +               groups = "USB2AD";
> > +       };
> > +
> >         pinctrl_usb11bhid_default: usb11bhid_default {
> >                 function = "USB11BHID";
> >                 groups = "USB11BHID";
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
