From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [RFC PATCH v1 1/2] drm/rockchip: vop: add rk3229 vop support
Date: Tue, 5 Jan 2016 11:21:15 +0800
Message-ID: <568B36AB.4070105@rock-chips.com>
References: <1451908218-25278-1-git-send-email-ykk@rock-chips.com>
 <1451908438-26581-1-git-send-email-ykk@rock-chips.com>
 <11434893.zL5bTOLgHP@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11434893.zL5bTOLgHP@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 01/04/2016 08:23 PM, Heiko Stuebner wrote:
> Hi Yakir,
>
> Am Montag, 4. Januar 2016, 19:53:58 schrieb Yakir Yang:
>> RK3229 registers layout is simalar to RK3288 layout, only the
>> interruput registers is different to RK3288.
>>
>> RK3229 support two overlay plane and one hwc plane, max output
>> resolution is 4K. it support IOMMU, and its IOMMU same as rk3288's.
>>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c |   7 +-
>>   drivers/gpu/drm/rockchip/rockchip_drm_vop.h |   2 +
>>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 120
>> ++++++++++++++++++++++++++++ drivers/gpu/drm/rockchip/rockchip_vop_reg.h
>> |  90 +++++++++++++++++++++ 4 files changed, 217 insertions(+), 2
>> deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c index d83bf87..3c83097
>> 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -63,9 +63,12 @@
>>   #define VOP_INTR_SET_TYPE(vop, name, type, v) \
>>   	do { \
>>   		int i, reg = 0; \
>> -		for (i = 0; i < vop->data->intr->nintrs; i++) { \
>> -			if (vop->data->intr->intrs[i] & type) \
>> +		const struct vop_intr *intr = vop->data->intr; \
>> +		for (i = 0; i < intr->nintrs; i++) { \
>> +			if (intr->intrs[i] & type) { \
>>   				reg |= (v) << i; \
>> +				reg |= intr->write_mask ? (1 << (i + 16)) : 0; \
>> +			} \
>>   		} \
>>   		VOP_INTR_SET(vop, name, reg); \
>>   	} while (0)
> I do believe this part, as well as setting the default .write_mask = false
> for the existing parts should get its own patch + a bit more explanation
> on what this does and why it's needed.
>
> ---- 8< ----
> drm/rockchip: Add support for interrupt registers using write-masks
>
> Some new display-controllers are need to set write-masks to enable writes
> to interrupt registers. Allow this to be set on a per-vop basis.
> ---- 8< ----
>
> or something like that, and then patches 2+3 being the rk3229 support +
> binding.

Great, will send the new version out.

>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
>> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h index 071ff0b..1e839e8
>> 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
>> @@ -60,6 +60,7 @@ struct vop_ctrl {
>>   };
>>
>>   struct vop_intr {
>> +	bool write_mask;
>>   	const int *intrs;
>>   	uint32_t nintrs;
>>   	struct vop_reg enable;
>> @@ -136,6 +137,7 @@ struct vop_data {
>>   };
>>
>>   /* interrupt define */
>> +#define DUMMY_INTR			(0 << 0)
>>   #define DSP_HOLD_VALID_INTR		(1 << 0)
>>   #define FS_INTR				(1 << 1)
>>   #define LINE_FLAG_INTR			(1 << 2)
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c index 3166b46..bbcd128
>> 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> @@ -174,6 +174,7 @@ static const int rk3288_vop_intrs[] = {
>>   };
>>
>>   static const struct vop_intr rk3288_vop_intr = {
>> +	.write_mask = false,
>>   	.intrs = rk3288_vop_intrs,
>>   	.nintrs = ARRAY_SIZE(rk3288_vop_intrs),
>>   	.status = VOP_REG(RK3288_INTR_CTRL0, 0xf, 0),
>> @@ -190,6 +191,122 @@ static const struct vop_data rk3288_vop = {
>>   	.win_size = ARRAY_SIZE(rk3288_vop_win_data),
>>   };
>>
>> +static const struct vop_scl_extension rk3229_win_full_scl_ext = {
>> +	.cbcr_vsd_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 31),
>> +	.cbcr_vsu_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 30),
>> +	.cbcr_hsd_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x3, 28),
>> +	.cbcr_ver_scl_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x3, 26),
>> +	.cbcr_hor_scl_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x3, 24),
>> +	.yrgb_vsd_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 23),
>> +	.yrgb_vsu_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 22),
>> +	.yrgb_hsd_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x3, 20),
>> +	.yrgb_ver_scl_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x3, 18),
>> +	.yrgb_hor_scl_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x3, 16),
>> +	.line_load_mode = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 15),
>> +	.cbcr_axi_gather_num = VOP_REG(RK3229_WIN0_CTRL1, 0x7, 12),
>> +	.yrgb_axi_gather_num = VOP_REG(RK3229_WIN0_CTRL1, 0xf, 8),
>> +	.vsd_cbcr_gt2 = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 7),
>> +	.vsd_cbcr_gt4 = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 6),
>> +	.vsd_yrgb_gt2 = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 5),
>> +	.vsd_yrgb_gt4 = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 4),
>> +	.bic_coe_sel = VOP_REG(RK3229_WIN0_CTRL1, 0x3, 2),
>> +	.cbcr_axi_gather_en = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 1),
>> +	.yrgb_axi_gather_en = VOP_REG(RK3229_WIN0_CTRL1, 0x1, 0),
>> +	.lb_mode = VOP_REG(RK3229_WIN0_CTRL0, 0x7, 5),
>> +};
>> +
>> +static const struct vop_scl_regs rk3229_win_full_scl = {
>> +	.ext = &rk3229_win_full_scl_ext,
>> +	.scale_yrgb_x = VOP_REG(RK3229_WIN0_SCL_FACTOR_YRGB, 0xffff, 0x0),
>> +	.scale_yrgb_y = VOP_REG(RK3229_WIN0_SCL_FACTOR_YRGB, 0xffff, 16),
>> +	.scale_cbcr_x = VOP_REG(RK3229_WIN0_SCL_FACTOR_CBR, 0xffff, 0x0),
>> +	.scale_cbcr_y = VOP_REG(RK3229_WIN0_SCL_FACTOR_CBR, 0xffff, 16),
>> +};
>> +
>> +static const struct vop_win_phy rk3229_win01_data = {
>> +	.scl = &rk3229_win_full_scl,
>> +	.data_formats = formats_win_full,
>> +	.nformats = ARRAY_SIZE(formats_win_full),
>> +	.enable = VOP_REG(RK3229_WIN0_CTRL0, 0x1, 0),
>> +	.format = VOP_REG(RK3229_WIN0_CTRL0, 0x7, 1),
>> +	.rb_swap = VOP_REG(RK3229_WIN0_CTRL0, 0x1, 12),
>> +	.act_info = VOP_REG(RK3229_WIN0_ACT_INFO, 0x1fff1fff, 0),
>> +	.dsp_info = VOP_REG(RK3229_WIN0_DSP_INFO, 0x0fff0fff, 0),
>> +	.dsp_st = VOP_REG(RK3229_WIN0_DSP_ST, 0x1fff1fff, 0),
>> +	.yrgb_mst = VOP_REG(RK3229_WIN0_YRGB_MST, 0xffffffff, 0),
>> +	.uv_mst = VOP_REG(RK3229_WIN0_CBR_MST, 0xffffffff, 0),
>> +	.yrgb_vir = VOP_REG(RK3229_WIN0_VIR, 0x3fff, 0),
>> +	.uv_vir = VOP_REG(RK3229_WIN0_VIR, 0x3fff, 16),
>> +	.src_alpha_ctl = VOP_REG(RK3229_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
>> +	.dst_alpha_ctl = VOP_REG(RK3229_WIN0_DST_ALPHA_CTRL, 0xff, 0),
>> +};
>> +
>> +static const struct vop_win_data rk3229_vop_win_data[] = {
>> +	{ .base = 0x00, .phy = &rk3229_win01_data,
>> +	  .type = DRM_PLANE_TYPE_PRIMARY },
>> +	{ .base = 0x40, .phy = &rk3229_win01_data,
>> +	  .type = DRM_PLANE_TYPE_CURSOR },
>> +};
>> +
>> +static const struct vop_ctrl rk3229_ctrl_data = {
>> +	.cfg_done = VOP_REG(RK3229_REG_CFG_DONE, 0x1, 0),
>> +	.standby = VOP_REG(RK3229_SYS_CTRL, 0x1, 22),
>> +	.gate_en = VOP_REG(RK3229_SYS_CTRL, 0x1, 23),
>> +	.mmu_en = VOP_REG(RK3229_SYS_CTRL, 0x1, 20),
>> +	.rgb_en = VOP_REG(RK3229_SYS_CTRL, 0x1, 12),
>> +	.hdmi_en = VOP_REG(RK3229_SYS_CTRL, 0x1, 13),
>> +	.edp_en = VOP_REG(RK3229_SYS_CTRL, 0x1, 14),
>> +	.mipi_en = VOP_REG(RK3229_SYS_CTRL, 0x1, 15),
>> +	.data_blank = VOP_REG(RK3229_DSP_CTRL0, 0x1, 19),
>> +	.out_mode = VOP_REG(RK3229_DSP_CTRL0, 0xf, 0),
>> +	.pin_pol = VOP_REG(RK3229_DSP_CTRL1, 0xf, 20),
>> +	.dither_up = VOP_REG(RK3229_DSP_CTRL1, 0x1, 6),
>> +	.htotal_pw = VOP_REG(RK3229_DSP_HTOTAL_HS_END, 0x1fff1fff, 0),
>> +	.hact_st_end = VOP_REG(RK3229_DSP_HACT_ST_END, 0x1fff1fff, 0),
>> +	.vtotal_pw = VOP_REG(RK3229_DSP_VTOTAL_VS_END, 0x1fff1fff, 0),
>> +	.vact_st_end = VOP_REG(RK3229_DSP_VACT_ST_END, 0x1fff1fff, 0),
>> +	.hpost_st_end = VOP_REG(RK3229_POST_DSP_HACT_INFO, 0x1fff1fff, 0),
>> +	.vpost_st_end = VOP_REG(RK3229_POST_DSP_VACT_INFO, 0x1fff1fff, 0),
>> +};
>> +
>> +static const int rk3229_vop_intrs[] = {
>> +	FS_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
> I'm not sure we need that extra "DUMMY_INTR" define - a simple 0 should be
> enough as well to mark the positions as unused.
>

Done

Thanks,
- Yakir

> The rest looks nice
> Heiko
>
>
>> +	LINE_FLAG_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DUMMY_INTR,
>> +	DSP_HOLD_VALID_INTR,
>> +};
>> +
>> +static const struct vop_intr rk3229_intr = {
>> +	.write_mask = true,
>> +	.intrs = rk3229_vop_intrs,
>> +	.nintrs = ARRAY_SIZE(rk3229_vop_intrs),
>> +	.status = VOP_REG(RK3229_INTR_STATUS0, 0xffffffff, 0),
>> +	.clear = VOP_REG(RK3229_INTR_CLEAR0, 0xffffffff, 0),
>> +	.enable = VOP_REG(RK3229_INTR_EN0, 0xffffffff, 0),
>> +};
>> +
>> +static const struct vop_reg_data rk3229_vop_init_reg_table[] = {
>> +};
>> +
>> +static const struct vop_data rk3229_vop = {
>> +	.init_table = rk3229_vop_init_reg_table,
>> +	.table_size = ARRAY_SIZE(rk3229_vop_init_reg_table),
>> +	.intr = &rk3229_intr,
>> +	.ctrl = &rk3229_ctrl_data,
>> +	.win = rk3229_vop_win_data,
>> +	.win_size = ARRAY_SIZE(rk3229_vop_win_data),
>> +};
>> +
>>   static const struct vop_scl_regs rk3066_win_scl = {
>>   	.scale_yrgb_x = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 0x0),
>>   	.scale_yrgb_y = VOP_REG(RK3036_WIN0_SCL_FACTOR_YRGB, 0xffff, 16),
>> @@ -240,6 +357,7 @@ static const int rk3036_vop_intrs[] = {
>>   };
>>
>>   static const struct vop_intr rk3036_intr = {
>> +	.write_mask = false,
>>   	.intrs = rk3036_vop_intrs,
>>   	.nintrs = ARRAY_SIZE(rk3036_vop_intrs),
>>   	.status = VOP_REG(RK3036_INT_STATUS, 0xf, 0),
>> @@ -274,6 +392,8 @@ static const struct vop_data rk3036_vop = {
>>   static const struct of_device_id vop_driver_dt_match[] = {
>>   	{ .compatible = "rockchip,rk3288-vop",
>>   	  .data = &rk3288_vop },
>> +	{ .compatible = "rockchip,rk3229-vop",
>> +	  .data = &rk3229_vop },
>>   	{ .compatible = "rockchip,rk3036-vop",
>>   	  .data = &rk3036_vop },
>>   	{},
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
>> b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h index d4b46cb..0280388
>> 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.h
>> @@ -15,6 +15,96 @@
>>   #ifndef _ROCKCHIP_VOP_REG_H
>>   #define _ROCKCHIP_VOP_REG_H
>>
>> +/* rk3229 register definition */
>> +#define RK3229_REG_CFG_DONE			0x0000
>> +#define RK3229_VERSION_INFO			0x0004
>> +#define RK3229_SYS_CTRL				0x0008
>> +#define RK3229_SYS_CTRL1			0x000c
>> +#define RK3229_DSP_CTRL0			0x0010
>> +#define RK3229_DSP_CTRL1			0x0014
>> +#define RK3229_DSP_BG				0x0018
>> +#define RK3229_WIN0_CTRL0			0x0030
>> +#define RK3229_WIN0_CTRL1			0x0034
>> +#define RK3229_WIN0_COLOR_KEY			0x0038
>> +#define RK3229_WIN0_VIR				0x003c
>> +#define RK3229_WIN0_YRGB_MST			0x0040
>> +#define RK3229_WIN0_CBR_MST			0x0044
>> +#define RK3229_WIN0_ACT_INFO			0x0048
>> +#define RK3229_WIN0_DSP_INFO			0x004c
>> +#define RK3229_WIN0_DSP_ST			0x0050
>> +#define RK3229_WIN0_SCL_FACTOR_YRGB		0x0054
>> +#define RK3229_WIN0_SCL_FACTOR_CBR		0x0058
>> +#define RK3229_WIN0_SCL_OFFSET			0x005c
>> +#define RK3229_WIN0_SRC_ALPHA_CTRL		0x0060
>> +#define RK3229_WIN0_DST_ALPHA_CTRL		0x0064
>> +#define RK3229_WIN0_FADING_CTRL			0x0068
>> +/* win1 register */
>> +#define RK3229_WIN1_CTRL0			0x0070
>> +#define RK3229_WIN1_CTRL1			0x0074
>> +#define RK3229_WIN1_COLOR_KEY			0x0078
>> +#define RK3229_WIN1_VIR				0x007c
>> +#define RK3229_WIN1_YRGB_MST			0x0080
>> +#define RK3229_WIN1_CBR_MST			0x0084
>> +#define RK3229_WIN1_ACT_INFO			0x0088
>> +#define RK3229_WIN1_DSP_INFO			0x008c
>> +#define RK3229_WIN1_DSP_ST			0x0090
>> +#define RK3229_WIN1_SCL_FACTOR_YRGB		0x0094
>> +#define RK3229_WIN1_SCL_FACTOR_CBR		0x0098
>> +#define RK3229_WIN1_SCL_OFFSET			0x009c
>> +#define RK3229_WIN1_SRC_ALPHA_CTRL		0x00a0
>> +#define RK3229_WIN1_DST_ALPHA_CTRL		0x00a4
>> +#define RK3229_WIN1_FADING_CTRL			0x00a8
>> +#define RK3229_WIN1_CTRL2			0x00ac
>> +/* hwc register */
>> +#define RK3229_HWC_CTRL0			0x0150
>> +#define RK3229_HWC_CTRL1			0x0154
>> +#define RK3229_HWC_MST				0x0158
>> +#define RK3229_HWC_DSP_ST			0x015c
>> +#define RK3229_HWC_SRC_ALPHA_CTRL		0x0160
>> +#define RK3229_HWC_DST_ALPHA_CTRL		0x0164
>> +#define RK3229_HWC_FADING_CTRL			0x0168
>> +#define RK3229_HWC_RESERVED			0x016c
>> +/* post process register */
>> +#define RK3229_POST_DSP_HACT_INFO		0x0170
>> +#define RK3229_POST_DSP_VACT_INFO		0x0174
>> +#define RK3229_POST_SCL_FACTOR_YRGB		0x0178
>> +#define RK3229_POST_RESERVED			0x017c
>> +#define RK3229_POST_SCL_CTRL			0x0180
>> +#define RK3229_POST_DSP_VACT_INFO_F1		0x0184
>> +#define RK3229_DSP_HTOTAL_HS_END		0x0188
>> +#define RK3229_DSP_HACT_ST_END			0x018c
>> +#define RK3229_DSP_VTOTAL_VS_END		0x0190
>> +#define RK3229_DSP_VACT_ST_END			0x0194
>> +#define RK3229_DSP_VS_ST_END_F1			0x0198
>> +#define RK3229_DSP_VACT_ST_END_F1		0x019c
>> +/* Brightness contrast */
>> +#define RK3229_BCSH_COLOR_BAR			0x01b0
>> +#define RK3229_BCSH_BCS				0x01b4
>> +#define RK3229_BCSH_H				0x01b8
>> +#define RK3229_BCSH_CTRL			0x01bc
>> +/* FRC registers */
>> +#define RK3229_FRC_LOWER01_0			0x01e8
>> +#define RK3229_FRC_LOWER01_1			0x01ec
>> +#define RK3229_FRC_LOWER10_0			0x01f0
>> +#define RK3229_FRC_LOWER10_1			0x01f4
>> +#define RK3229_FRC_LOWER11_0			0x01f8
>> +#define RK3229_FRC_LOWER11_1			0x01fc
>> +/* Interrupt registers */
>> +#define RK3229_INTR_EN0				0x0280
>> +#define RK3229_INTR_CLEAR0			0x0284
>> +#define RK3229_INTR_STATUS0			0x0288
>> +#define RK3229_INTR_RAW_STATUS0			0x028c
>> +#define RK3229_INTR_EN1				0x0290
>> +#define RK3229_INTR_CLEAR1			0x0294
>> +#define RK3229_INTR_STATUS1			0x0298
>> +#define RK3229_INTR_RAW_STATUS1			0x029c
>> +#define RK3229_LINE_FLAG			0x02a0
>> +#define RK3229_VOP_STATUS			0x02a4
>> +#define RK3229_BLANKING_VALUE			0x02a8
>> +#define RK3229_WIN0_DSP_BG			0x02b0
>> +#define RK3229_WIN1_DSP_BG			0x02b4
>> +/* register definition end */
>> +
>>   /* rk3288 register definition */
>>   #define RK3288_REG_CFG_DONE			0x0000
>>   #define RK3288_VERSION_INFO			0x0004
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
