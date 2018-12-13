From: Dalon Westergreen <dwesterg@gmail.com>
Subject: Re: [PATCH] arch: arm: socfpga: arria10: Add stmmac ptp_ref clock
 to socdk devicetree
Date: Thu, 13 Dec 2018 14:30:58 -0800
Message-ID: <cab060d31b36a6a8d2618ac8a65ddf193d338c5e.camel@gmail.com>
References: <20181213205910.26359-1-dalon.westergreen@linux.intel.com>
         <c703c4d4-4442-19b1-8645-aa906b08f7e6@kernel.org>
Reply-To: dwesterg@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c703c4d4-4442-19b1-8645-aa906b08f7e6@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, thor.thayer@intel.com
List-Id: devicetree@vger.kernel.org

On Thu, 2018-12-13 at 15:56 -0600, Dinh Nguyen wrote:
> 
> On 12/13/18 2:59 PM, dwesterg@gmail.com wrote:
> > From: Dalon Westergreen <dalon.westergreen@linux.intel.com>
> > 
> > Add the stmmac ptp_ref clock as it is configured in the arria10 socdk.
> > The stmmac driver defaults the ptp_ref clock to the main stmmac clock
> > if the ptp_ref clock is not set in the devicetree.  This is inapprotiate
> 
> s/inapprotiate/inappropriate
> 
> > for the arria10 socdk.
> > 
> > Signed-off-by: Dalon Westergreen <dalon.westergreen@linux.intel.com>
> > ---
> >  arch/arm/boot/dts/socfpga_arria10_socdk.dtsi | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
> > b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
> > index 2a7466891d0e..58bfa84dcdb3 100644
> > --- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
> > +++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
> > @@ -74,7 +74,8 @@
> >  &gmac0 {
> >  	phy-mode = "rgmii";
> >  	phy-addr = <0xffffffff>; /* probe for phy addr */
> > -
> > +	clocks = <&l4_mp_clk>, <&peri_emac_ptp_clk>;
> > +	clock-names = "stmmaceth", "ptp_ref";
> >  	
> These should go into the base arria10 dtsi at socfpga_arria10.dtsi?
> Should the other gmacs get the same updates?

Agreed, I will send a new patch set that addresses cv/av, a10, and s10.

> 
> Also the patch header should be "ARM: dts: arria10:"
> 
> Dinh
