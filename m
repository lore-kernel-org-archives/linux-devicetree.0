Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FBCC33CB1
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 13:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E35524679
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 13:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgANNig (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 08:38:36 -0500
Received: from salem.gmr.ssr.upm.es ([138.4.36.7]:51408 "EHLO
        salem.gmr.ssr.upm.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgANNig (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 08:38:36 -0500
X-Greylist: delayed 803 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jan 2020 08:38:35 EST
Received: by salem.gmr.ssr.upm.es (Postfix, from userid 1000)
        id E6987AC0403; Tue, 14 Jan 2020 14:25:06 +0100 (CET)
Date:   Tue, 14 Jan 2020 14:25:06 +0100
From:   Alvaro Gamez Machado <alvaro.gamez@hazent.com>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: zynq: add flash memory interfaces, Xilinx efuse and
 missing clocks
Message-ID: <20200114132506.GA22043@salem.gmr.ssr.upm.es>
References: <20200114120024.19779-1-alvaro.gamez@hazent.com>
 <55db7dc3-ca06-4b01-417d-0b6869cb475a@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55db7dc3-ca06-4b01-417d-0b6869cb475a@xilinx.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 14, 2020 at 01:18:01PM +0100, Michal Simek wrote:
> Hi Alvaro,
> 
> here is missing description.

Ok, I'll put something once we've finished reviewing this.
Given the comments below, maybe is it better do split this in qspi+smcc
changes and maybe leter on work on the rest of the issues?

 
> On 14. 01. 20 13:00, Alvaro Gamez Machado wrote:
> > Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> > ---
> >  arch/arm/boot/dts/zynq-7000.dtsi | 50 ++++++++++++++++++++++++++++++--
> >  1 file changed, 47 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
> > index ca6425ad794c..8358315d7803 100644
> > --- a/arch/arm/boot/dts/zynq-7000.dtsi
> > +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> > @@ -197,6 +197,45 @@ spi1: spi@e0007000 {
> >  			#size-cells = <0>;
> >  		};
> >  
> > +		qspi: spi@e000d000 {
> > +			clock-names = "ref_clk", "pclk";
> > +			clocks = <&clkc 10>, <&clkc 43>;
> > +			compatible = "xlnx,zynq-qspi-1.0";
> > +			status = "disabled";
> > +			interrupt-parent = <&intc>;
> > +			interrupts = <0 19 4>;
> > +			reg = <0xe000d000 0x1000>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		smcc: memory-controller@e000e000 {
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			status = "disabled";
> > +			clock-names = "memclk", "apb_pclk";
> > +			clocks = <&clkc 11>, <&clkc 44>;
> > +			compatible = "arm,pl353-smc-r2p1", "arm,primecell";
> > +			interrupt-parent = <&intc>;
> > +			interrupts = <0 18 4>;
> > +			ranges ;
> > +			reg = <0xe000e000 0x1000>;
> > +			nand0: flash@e1000000 {
> > +				status = "disabled";
> > +				compatible = "arm,pl353-nand-r2p1";
> 
> note: Driver is not in mainline but dt binding has been reviewed already.

Ok, so I understand we can leave this as is, even though it won't fully work, but
at least the hardware gets defined, is that right?

> 
> > +				reg = <0xe1000000 0x1000000>;
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +			};
> > +			nor0: flash@e2000000 {
> > +				status = "disabled";
> > +				compatible = "cfi-flash";
> > +				reg = <0xe2000000 0x2000000>;
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +			};
> > +		};
> > +
> >  		gem0: ethernet@e000b000 {
> >  			compatible = "cdns,zynq-gem", "cdns,gem";
> >  			reg = <0xe000b000 0x1000>;
> > @@ -297,14 +336,19 @@ dmac_s: dmac@f8003000 {
> >  
> >  		devcfg: devcfg@f8007000 {
> >  			compatible = "xlnx,zynq-devcfg-1.0";
> > -			reg = <0xf8007000 0x100>;
> >  			interrupt-parent = <&intc>;
> >  			interrupts = <0 8 4>;
> > -			clocks = <&clkc 12>;
> > -			clock-names = "ref_clk";
> > +			reg = <0xf8007000 0x100>;
> > +			clocks = <&clkc 12>, <&clkc 15>, <&clkc 16>, <&clkc 17>, <&clkc 18>;
> > +			clock-names = "ref_clk", "fclk0", "fclk1", "fclk2", "fclk3";
> 
> This is not the part of dt binding.

Sorry, I don't understand what you mean by this. I'm simply adding the list
of clocks that the PS can provide to the PL region of the zynq. Is this
wrong? 
> >  			syscon = <&slcr>;
> >  		};
> >  
> > +		efuse: efuse@f800d000 {
> > +			compatible = "xlnx,zynq-efuse";
> > +			reg = <0xf800d000 0x20>;
> > +		};
> 
> ditto.

Ok, this came from Xilinx' tools and there's no driver for it, so I'll just
remove it.

> > +
> >  		global_timer: timer@f8f00200 {
> >  			compatible = "arm,cortex-a9-global-timer";
> >  			reg = <0xf8f00200 0x20>;
> > 
> 
> 
> Thanks,
> Michal

Thanks!

-- 
Alvaro G. M.
