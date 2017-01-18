From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 2/4] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom
 chips
Date: Wed, 18 Jan 2017 10:03:47 -0800
Message-ID: <20170118180347.GO10531@minitux>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-3-git-send-email-vivek.gautam@codeaurora.org>
 <587C880E.90803@ti.com>
 <73a2f6ce-69d6-8d15-b28d-891bdf16672c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <73a2f6ce-69d6-8d15-b28d-891bdf16672c@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, sboyd@codeaurora.org, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 18 Jan 01:13 PST 2017, Vivek Gautam wrote:
> On 01/16/2017 02:15 PM, Kishon Vijay Abraham I wrote:
> > Hi,
> > 
> > On Tuesday 10 January 2017 04:21 PM, Vivek Gautam wrote:
[..]
> > > +static const struct qusb2_phy_init_tbl msm8996_init_tbl[] = {
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE1, 0xf8),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE2, 0xb3),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE3, 0x83),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE4, 0xc0),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TEST2, 0x14),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9f),
> > > +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
> > > +};
> > I wish all this data comes from device tree and one API in phy-core can do all
> > these settings. Your other driver qcom-qmp also seems to have a bunch of
> > similar settings.
> > 
> > The problem is every vendor driver adds a bunch of code to perform the same
> > thing again and again when all of these settings can be done by a single phy API.
> 
> Yes, i understand this. You have commented similar thing in the patch from
> Jaehoon -
> [PATCH V2 2/5] phy: phy-exynos-pcie: Add support for Exynos PCIe phy
> 
> I would like to understand the requirements here.
> Would you like me to get all this information from the device tree -
> an array of register offset and value pair, which we can then program
> by calling a phy_ops (may be calibrate) ? Something of this sort:
> 
> phy-calibrate-data = <val1, register_offset1>,
>                                   <val2, register_offset2>,
>                                   <val3, register_offset3>,
>                                   ....
> 
> I am sure having such information in the driver (like i have in my patch)
> makes the driver look more clumsy.
> But, all this data can be pretty huge - a set of some 100+ register-value
> pairs
> for QMP phy, for example. So, will it be okay to get this from device tree ?
> We also note here that such information changes from one IP version to
> another.
> I remember Rob having some concerns about it.
> 

The devicetree is supposed to describe which hardware components a
certain device has, most of the time this carries a set of properties to
describe how this piece is connected and configured.

A dump of magic register values does not describe how the QMP is
connected to anything and is, as far as this patch shows, static for
this particular hardware block.

Further more moving this blob to devicetree will not allow us to treat
the various QMP configurations as one HW block, as there are other
differences as well.

Like many other drivers it's possible to create a generic version that
has every bit of logic driven by configuration from devicetree, but like
most of those cases this is not the way we split things.



And this has the side effect of keeping the dts files human readable,
human understandable and human maintainable.

Regards,
Bjorn
