From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 04/12] drm/bridge/synopsys: dw-hdmi: Export some PHY
 related functions
Date: Mon, 15 Jan 2018 16:13:22 +0100
Message-ID: <3ea0c21c-0ab4-651e-3779-abdc71dcb599@baylibre.com>
References: <20180110192512.19684-1-jernej.skrabec@siol.net>
 <20180110192512.19684-5-jernej.skrabec@siol.net>
 <2850049.ORu4oj41BJ@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <2850049.ORu4oj41BJ@jernej-laptop>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
Cc: maxime.ripard@free-electrons.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, mturquette@baylibre.com, sboyd@codeaurora.org, Jose.Abreu@synopsys.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On 12/01/2018 21:42, Jernej Škrabec wrote:
> Hi all,
> 
> Dne sreda, 10. januar 2018 ob 20:25:04 CET je Jernej Skrabec napisal(a):
>> Parts of PHY code could be useful also for custom PHYs. For example,
>> Allwinner A83T has custom PHY which is probably Synopsys gen2 PHY
>> with few additional memory mapped registers, so most of the Synopsys PHY
>> related code could be reused.
>>
>> Functions exported here are actually not specific to Synopsys PHYs but
>> to DWC HDMI controller PHY interface. This means that even if the PHY is
>> completely custom, i.e. not designed by Synopsys, exported functions can
>> be useful.
>>
>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 44
>> +++++++++++++++++++++---------- include/drm/bridge/dw_hdmi.h              |
>> 11 ++++++++
>>  2 files changed, 41 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
>> 7ca14d7325b5..7d80f4b56683 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -1037,19 +1037,21 @@ static void dw_hdmi_phy_enable_svsret(struct dw_hdmi
>> *hdmi, u8 enable) HDMI_PHY_CONF0_SVSRET_MASK);
>>  }
>>
>> -static void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable)
>> +void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable)
>>  {
>>  	hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
>>  			 HDMI_PHY_CONF0_GEN2_PDDQ_OFFSET,
>>  			 HDMI_PHY_CONF0_GEN2_PDDQ_MASK);
>>  }
>> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen2_pddq);
>>
>> -static void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable)
>> +void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable)
>>  {
>>  	hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
>>  			 HDMI_PHY_CONF0_GEN2_TXPWRON_OFFSET,
>>  			 HDMI_PHY_CONF0_GEN2_TXPWRON_MASK);
>>  }
>> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen2_txpwron);
>>
>>  static void dw_hdmi_phy_sel_data_en_pol(struct dw_hdmi *hdmi, u8 enable)
>>  {
>> @@ -1065,6 +1067,22 @@ static void dw_hdmi_phy_sel_interface_control(struct
>> dw_hdmi *hdmi, u8 enable) HDMI_PHY_CONF0_SELDIPIF_MASK);
>>  }
>>
>> +void dw_hdmi_phy_reset(struct dw_hdmi *hdmi)
>> +{
>> +	/* PHY reset. The reset signal is active high on Gen2 PHYs. */
>> +	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
>> +	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
>> +}
>> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset);
> 
> I just noticed that meson dw hdmi driver uses function with the same name, 
> which break compilation. Is it ok if I rename meson specific reset to 
> meson_dw_hdmi_phy_reset()?

Hi Jernej,

Yes,

Neil

> 
> Best regards,
> Jernej
> 
[...]
