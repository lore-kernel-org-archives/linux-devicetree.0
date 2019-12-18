Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C77AC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 06:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 396B920717
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 06:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbfLRG12 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 01:27:28 -0500
Received: from regular1.263xmail.com ([211.150.70.196]:48148 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfLRG12 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 01:27:28 -0500
Received: from localhost (unknown [192.168.167.32])
        by regular1.263xmail.com (Postfix) with ESMTP id 828F21058;
        Wed, 18 Dec 2019 14:27:00 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.186] (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31326T140475205932800S1576650418872469_;
        Wed, 18 Dec 2019 14:26:59 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6b66a3096eb34e37649fb219da334bf2>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: huangtao@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH 09/12] drm/rockchip: lvds: Add PX30 support
From:   "sandy.huang" <hjc@rock-chips.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Heiko Stuebner <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-rockchip@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, hjc@rock-chips.com,
        andy.yan@rock-chips.com, tao.huang@rock-chips.com
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
 <20191216105827.rxkfbwemkqw446jx@gilmour.lan> <20191216120312.4aa478da@xps13>
 <20191216111436.wzoq33gvt42w6gqj@gilmour.lan>
 <64f6c582-8ffd-1082-f161-1e8c1a8dda44@rock-chips.com>
Message-ID: <cdf3ee27-b099-b119-483b-af4fe4a75de4@rock-chips.com>
Date:   Wed, 18 Dec 2019 14:26:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <64f6c582-8ffd-1082-f161-1e8c1a8dda44@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi

     some mistakes with last mail, so resend this mail.

在 2019/12/18 上午11:17, sandy.huang 写道:
> Hi Maxime & Miquel,
>
> 在 2019/12/16 下午7:14, Maxime Ripard 写道:
>> On Mon, Dec 16, 2019 at 12:03:12PM +0100, Miquel Raynal wrote:
>>> Maxime Ripard <maxime@cerno.tech> wrote on Mon, 16 Dec 2019 11:58:27 
>>> +0100:
>>>> Hi,
>>>>
>>>> On Fri, Dec 13, 2019 at 07:10:48PM +0100, Miquel Raynal wrote:
>>>>> +static int px30_lvds_grf_config(struct drm_encoder *encoder,
>>>>> +                struct drm_display_mode *mode)
>>>>> +{
>>>>> +    struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
>>>>> +    u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
>>>>> +    u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
>>>>> +    u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
>>>>> +    int ret;
>>>>> +
>>>>> +    if (lvds->output != DISPLAY_OUTPUT_LVDS) {
>>>>> +        DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
>>>>> +                  lvds->output);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    if (nhsync ^ nvsync) {
>>>>> +        DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync 
>>>>> polarity\n");
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    /* Set format */
>>>>> +    ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
>>>>> +                 PX30_LVDS_FORMAT(lvds->format),
>>>>> +                 PX30_LVDS_FORMAT(lvds->format));
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    /* Control Hsync/Vsync polarity */
>>>>> +    ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
>>>>> +                 PX30_LVDS_TIE_CLKS(1),
>>>>> +                 PX30_LVDS_TIE_CLKS(1));
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    /* Set Hsync/Vsync polarity */
>>>>> +    ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
>>>>> +                 PX30_LVDS_INVERT_CLKS(1),
>>>>> +                 PX30_LVDS_INVERT_CLKS(nhsync));
>>>>> +    if (ret)
>>>>> +        return ret;
>>>> I don't know the hardware but it seems pretty weird to me. hsync and
>>>> vsync in LVDS are not clocks (or even signals), they're a bit in the
>>>> payload. Is there any explanation in the datasheet (or even a
>>>> datasheet in the first place)?
>>> There is no explanation about this in the PX30 TRM part 1 (public). But
>>> you are right the naming is weird. Could the "tie clocks" thing above
>>> mean something to you/people knowing the LVDS world?
>> I have no idea what that could mean :)
>
> This two bit(GRF_CON0[9,8]) is not for hsync/vsync polarity config, 
> the polarity is done at vop_crtc_atomic_enable@rockchip_drm_vop.c.
>
> Before px30, all rockchip platform lvds output payload is include 
> hsync,vsync and den clock signal. About years ago, we meet a lvds 
> panel can't work normally at rk3288,  from the panel spec we know the 
> panel need lvds work den mode only, the hsync/vsync need to set 0 at 
> blank time, so we add this two bit(GRF_CON0[9,8]) for this mode.
>
> but now we can't get in touch with the customer and get the panel to 
> test this function, so we can't verify the panel work unnormally is 
> because of  the den mode only and the hsync vsync signal level at 
> blank time.
>
> I recommend not including this part of configuration before we test 
> this funcion at den mode only lvds panel,thanks.
>
>>
>> Maxime
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>


