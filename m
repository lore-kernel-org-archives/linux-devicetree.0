Return-Path: <SRS0=DUYD=RQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:54802 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726400AbfCMCly (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Mar 2019 22:41:54 -0400
Message-ID: <1552444909.30977.39.camel@mtkswgap22>
Subject: Re: [PATCH v3 5/7] dt-bindings: scsi: ufs: Add document for
 ufs-mediatek
From: Stanley Chu <stanley.chu@mediatek.com>
Date: Wed, 13 Mar 2019 10:41:49 +0800
In-Reply-To: <20190312133113.GA8956@bogus>
References: <1551252192-535-1-git-send-email-stanley.chu@mediatek.com>
         <1551252192-535-7-git-send-email-stanley.chu@mediatek.com>
         <20190312133113.GA8956@bogus>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Chunfeng Yun =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= <Chunfeng.Yun@mediatek.com>, "kishon@ti.com" <kishon@ti.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "pedrom.sousa@synopsys.com" <pedrom.sousa@synopsys.com>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>, "subhashj@codeaurora.org" <subhashj@codeaurora.org>, "liwei213@huawei.com" <liwei213@huawei.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?= <kuohong.wang@mediatek.com>, Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?= <peter.wang@mediatek.com>, Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?= <Chun-hung.Wu@mediatek.com>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Tue, 2019-03-12 at 21:31 +0800, Rob Herring wrote:
> On Wed, Feb 27, 2019 at 03:23:10PM +0800, Stanley Chu wrote:
> > Add UFS and UFS PHY node document for Mediatek SoC chips.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  .../devicetree/bindings/ufs/ufs-mediatek.txt  | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
> > new file mode 100644
> > index 000000000000..5fc985928b3e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ufs/ufs-mediatek.txt
> > @@ -0,0 +1,47 @@
> > +* Mediatek Universal Flash Storage (UFS) Host Controller
> > +
> > +UFS nodes are defined to describe on-chip UFS hardware macro.
> > +Each UFS Host Controller should have its own node.
> > +
> > +To bind UFS PHY with UFS host controller, the controller node should
> > +contain a phandle reference to UFS M-PHY node.
> > +
> > +Required properties for UFS nodes:
> > +- compatible         : Compatible list, contains the following controller:
> > +                       "mediatek,ufshci"
> 
> Needs an SoC specific compatible string.

Will add.

> 
> > +- reg                : Address and length of the UFS register set.
> > +- interrupt-parent   : Interrupt device.
> 
> Drop this. It is implied or may be in a parent node.

Will remove it.

> 
> > +- phys               : phandle to m-phy.
> > +- clocks             : List of phandle and clock specifier pairs.
> > +- clock-names        : List of clock input name strings sorted in the same
> > +                       order as the clocks property. "ufs-clk" is mandatory.
> > +- freq-table-hz      : Array of <min max> operating frequencies stored in the same
> > +                       order as the clocks property. If this property is not
> > +                       defined or a value in the array is "0" then it is assumed
> > +                       that the frequency is set by the parent clock or a
> > +                       fixed rate clock source.
> > +- vcc-supply         : Power to the UFS device.
> > +- vcc-fixed-regulator: Specify that vcc-supply is a fixed regulator.
> 
> Why is this needed? The driver could query the voltage range of the 
> regulator or you could check the regulator node.

Both ufshcd-pltfrm.txt and ufshcd-pltfrm.c driver allow 

- <name>-fixed-regulator : boolean property specifying that
<name>-supply is a fixed regulator.

Our vcc does not require further initializatio, so is it OK here or
shall we also modify both ufshcd-pltfrm dt-bindings document and ufs
driver to avoid using it ?

> 
> > +- lanes-per-direction: Number of lanes available per direction. Shall be 1.
> 
> If this can only be one value, then it can be implied by the compatible 
> string.

Will remove it.

> 
> > +
> > +Example:
> > +
> > +	ufs_mphy: ufs_mphy@11fa0000 {
> > +		...
> > +	};
> > +
> > +	ufshci:ufshci@11270000 {
> > +		compatible = "mediatek,ufshci";
> > +		reg = <0 0x11270000 0 0x2300>;
> > +		interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_LOW>;
> > +		phys = <&ufs_mphy>;
> > +
> > +		clocks = <&infracfg_ao INFRACFG_AO_UFS_CG>;
> > +		clock-names = "ufs-clk";
> > +		freq-table-hz = <0 0>;
> > +
> > +		vcc-supply = <&mt_pmic_vemc_ldo_reg>;
> > +		vcc-fixed-regulator;
> > +
> > +		lanes-per-direction = <1>;
> > +	};
> > -- 
> > 2.18.0
> > 
