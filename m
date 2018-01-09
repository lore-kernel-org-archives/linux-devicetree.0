From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 04/11] drm/bridge/synopsys: dw-hdmi: Export some PHY related functions
Date: Tue, 09 Jan 2018 18:08:55 +0200
Message-ID: <1586880.7NXXgpct7p@avalon>
References: <20171230210203.24115-1-jernej.skrabec@siol.net> <6b454804-e910-e8e8-6d2b-5bc25c7a4d4c@codeaurora.org> <10903755.CJpSM8RM5e@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <10903755.CJpSM8RM5e@jernej-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Cc: Archit Taneja <architt@codeaurora.org>, maxime.ripard@free-electrons.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, a.hajda@samsung.com, mturquette@baylibre.com, sboyd@codeaurora.org, Jose.Abreu@synopsys.com, narmstrong@baylibre.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hello,

On Tuesday, 9 January 2018 17:58:46 EET Jernej =C5=A0krabec wrote:
> Dne torek, 09. januar 2018 ob 11:43:08 CET je Archit Taneja napisal(a):
> > On 12/31/2017 02:31 AM, Jernej Skrabec wrote:
> >> Parts of PHY code could be useful also for custom PHYs. For example,
> >> Allwinner A83T has custom PHY which is probably Synopsys gen2 PHY
> >> with few additional memory mapped registers, so most of the Synopsys P=
HY
> >> related code could be reused.
> >>=20
> >> It turns out that even completely custom HDMI PHYs, such as the one
> >> found in Allwinner H3, can reuse some of those functions. This would
> >> suggest that (some?) functions exported in this commit are actually pa=
rt
> >> of generic PHY interface and not really specific to Synopsys PHYs.
> >>=20
> >> Export useful PHY functions.
> >>=20
> >> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >> ---
> >>=20
> >> drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 45 +++++++++++++++++-------
> >> drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |  2 ++
> >> include/drm/bridge/dw_hdmi.h              | 10 +++++++
> >> 3 files changed, 44 insertions(+), 13 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> >> 7ca14d7325b5..67467d0b683a 100644
> >> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> >> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c

[snip]

> >> @@ -1065,6 +1067,23 @@ static void
> >> dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
> >>   			 HDMI_PHY_CONF0_SELDIPIF_MASK);
> >>   }
> >>=20
> >> +void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi, u8 enable)
> >> +{
> >> +	hdmi_mask_writeb(hdmi, enable, HDMI_MC_PHYRSTZ,
> >> +			 HDMI_MC_PHYRSTZ_PHYRSTZ_OFFSET,
> >> +			 HDMI_MC_PHYRSTZ_PHYRSTZ_MASK);
> >> +}
> >> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen2_reset);

I don't remember the details, is the reset signal Gen2-specific ?

How about asserting and deasserting the reset signal in the same call inste=
ad=20
of having to call this function twice ?

> >> +void dw_hdmi_phy_set_slave_addr(struct dw_hdmi *hdmi)
> >> +{
> >> +	hdmi_phy_test_clear(hdmi, 1);
> >> +	hdmi_writeb(hdmi, HDMI_PHY_I2CM_SLAVE_ADDR_PHY_GEN2,
> >> +		    HDMI_PHY_I2CM_SLAVE_ADDR);
> >> +	hdmi_phy_test_clear(hdmi, 0);
> >> +}
> >> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_set_slave_addr);
> >=20
> > Should this be called dw_hdmi_phy_gen2_set_slave_addr?
>=20
> Probably. I will rename it in v2 to be consistent with other phy function=
s.

The I2C write function is called dw_hdmi_phy_i2c_write(). If we want to be=
=20
conosistent we should either rename this one to dw_hdmi_phy_i2c_set_addr() =
or=20
rename them both to dw_hdmi_phy_gen2_i2c_write() and=20
dw_hdmi_phy_gen2_i2c_set_addr(). I think I'd prefer the former, and we coul=
d=20
even drop gen2 from dw_hdmi_phy_gen2_pddq() and dw_hdmi_phy_gen2_txpwron() =
if=20
desired.

> > Looks good otherwise. Same for patches 3 and 4 in this series.
> >=20
> >> +
> >>   static void dw_hdmi_phy_power_off(struct dw_hdmi *hdmi)
> >>   {
> >>   	const struct dw_hdmi_phy_data *phy =3D hdmi->phy.data;

[snip]

=2D-=20
Regards,

Laurent Pinchart

