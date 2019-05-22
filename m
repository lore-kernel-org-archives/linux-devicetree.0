Return-Path: <SRS0=RGXl=TW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:57985 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729491AbfEVOru (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 May 2019 10:47:50 -0400
Message-ID: <c5363d7f1de4a24b31662f034d5241eba4fa0dc6.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] ARM64: dts: stratix10: Add stmmac ptp_ref clock
From: Dalon L Westergreen <dalon.westergreen@linux.intel.com>
Reply-To: dalon.westergreen@linux.intel.com
Date: Wed, 22 May 2019 07:47:49 -0700
In-Reply-To: <06397243-94ea-47db-16c1-a4c11e08c3b1@kernel.org>
References: <20190515162058.32368-1-dalon.westergreen@linux.intel.com>
         <20190515162058.32368-3-dalon.westergreen@linux.intel.com>
         <cff8dd7f-c617-af6c-cf22-2baa077a9bbb@linux.intel.com>
         <c444aff8281593bedaa90193dbabefcfd31a187d.camel@linux.intel.com>
         <06397243-94ea-47db-16c1-a4c11e08c3b1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, thor.thayer@linux.intel.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 2019-05-21 at 15:27 -0500, Dinh Nguyen wrote:
> 
> On 5/21/19 8:09 AM, Dalon L Westergreen wrote:
> > On Mon, 2019-05-20 at 11:39 -0500, Thor Thayer wrote:
> > > On 5/15/19 11:20 AM, Dalon Westergreen wrote:
> > > > Add the default stmmac ptp_ref clock for stratix10.  The stmmac
> > > > driver defaults the ptp_ref clock to the main stmmac clock
> > > > if the ptp_ref clock is not set in the devicetree.  This is
> > > > inappropriate for the stratix10.  The default ptp_ref clock is
> > > > STRATIX10_PERI_EMAC_PTP_CLK in the clock manager.
> > > > 
> > > > Signed-off-by: Dalon Westergreen <
> > > > dalon.westergreen@linux.intel.com
> > > > 
> > > > 
> > > > ---
> > > >   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 12 ++++++------
> > > >   1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> > > > b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> > > > index adedd563125a..f464e7ba3402 100644
> > > > --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> > > > +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
> > > > @@ -160,8 +160,8 @@
> > > >   			mac-address = [00 00 00 00 00 00];
> > > >   			resets = <&rst EMAC0_RESET>, <&rst
> > > > EMAC0_OCP_RESET>;
> > > >   			reset-names = "stmmaceth", "stmmaceth-ocp";
> > > > -			clocks = <&clkmgr STRATIX10_EMAC0_CLK>;
> > > > -			clock-names = "stmmaceth";
> > > > +			clocks = <&clkmgr STRATIX10_EMAC0_CLK>, <&clkmgr
> > > > STRATIX10_PERI_EMAC_PTP_CLK>;
> > > > +			clock-names = "stmmaceth", "ptp_ref";
> > > >   			tx-fifo-depth = <16384>;
> > > >   			rx-fifo-depth = <16384>;
> > > >   			snps,multicast-filter-bins = <256>;
> > > > @@ -176,8 +176,8 @@
> > > >   			mac-address = [00 00 00 00 00 00];
> > > >   			resets = <&rst EMAC1_RESET>, <&rst
> > > > EMAC1_OCP_RESET>;
> > > >   			reset-names = "stmmaceth", "stmmaceth-ocp";
> > > > -			clocks = <&clkmgr STRATIX10_EMAC1_CLK>;
> > > > -			clock-names = "stmmaceth";
> > > > +			clocks = <&clkmgr STRATIX10_EMAC1_CLK>, <&clkmgr
> > > > STRATIX10_PERI_EMAC_PTP_CLK>;
> > > > +			clock-names = "stmmaceth", "ptp_ref";
> > > >   			tx-fifo-depth = <16384>;
> > > >   			rx-fifo-depth = <16384>;
> > > >   			snps,multicast-filter-bins = <256>;
> > > > @@ -192,8 +192,8 @@
> > > >   			mac-address = [00 00 00 00 00 00];
> > > >   			resets = <&rst EMAC2_RESET>, <&rst
> > > > EMAC2_OCP_RESET>;
> > > >   			reset-names = "stmmaceth", "stmmaceth-ocp";
> > > > -			clocks = <&clkmgr STRATIX10_EMAC2_CLK>;
> > > > -			clock-names = "stmmaceth";
> > > > +			clocks = <&clkmgr STRATIX10_EMAC2_CLK>, <&clkmgr
> > > > STRATIX10_PERI_EMAC_PTP_CLK>;
> > > > +			clock-names = "stmmaceth", "ptp_ref";
> > > >   			tx-fifo-depth = <16384>;
> > > >   			rx-fifo-depth = <16384>;
> > > >   			snps,multicast-filter-bins = <256>;
> > > > 
> > > 
> > > Should STRATIX10_EMAC_PTP_CLK be used instead of 
> > > STRATIX10_PERI_EMAC_PTP_CLK since this is the gate of the clkgmr?
> > > 
> > 
> > Either can be used, but the default in the hps configuration is the
> > peripheral pll output and not the main pll output.
> > 
> 
> I think it should be the emac_ptp_clk. If you look at the clock tree,
> the emac_ptp_clk(50 MHz) and is derived from the peri_emac_ptp_clk(200
> MHz).
> 
> You can look at the clock tree by doing a 'cat
> /sys/kernel/debug/clk/clk_summary'.
> 
> Dinh
> 
I dont disagree, but this devicetree is a representation of what was implemented
in the devkit no?  Should we first request that this is changed in the design?
or should i set this to STRATIX10_EMAC_PTP_CLK and overide it in the top level
socdk devicetree?

dalon
