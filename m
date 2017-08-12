From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 4/4] drm: adv7511/33: add HDMI CEC support
Date: Sat, 12 Aug 2017 12:54:29 +0200
Message-ID: <0af0bb9b-51b0-661d-c37b-e4f577207d8c@xs4all.nl>
References: <20170730130743.19681-1-hverkuil@xs4all.nl>
 <20170730130743.19681-5-hverkuil@xs4all.nl>
 <811a3e0c-d938-744e-2d1d-46be76b708aa@codeaurora.org>
 <2d2e2a68-8b55-580d-b109-f639aa9fcd00@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <2d2e2a68-8b55-580d-b109-f639aa9fcd00@xs4all.nl>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: devicetree@vger.kernel.org

On 12/08/17 11:53, Hans Verkuil wrote:
> On 10/08/17 10:49, Archit Taneja wrote:
>>
>>
>> On 07/30/2017 06:37 PM, Hans Verkuil wrote:
>>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>>
>>> Add support for HDMI CEC to the drm adv7511/adv7533 drivers.
>>>
>>> The CEC registers that we need to use are identical for both drivers,
>>> but they appear at different offsets in the register map.
>>
>> Thanks for the patch. Some minor comments below.
>>
>>>
>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>>> ---
>>>   drivers/gpu/drm/bridge/adv7511/Kconfig       |   8 +
>>>   drivers/gpu/drm/bridge/adv7511/Makefile      |   1 +
>>>   drivers/gpu/drm/bridge/adv7511/adv7511.h     |  45 +++-
>>>   drivers/gpu/drm/bridge/adv7511/adv7511_cec.c | 314 +++++++++++++++++++++++++++
>>>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 152 +++++++++++--
>>>   drivers/gpu/drm/bridge/adv7511/adv7533.c     |  30 +--
>>>   6 files changed, 500 insertions(+), 50 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
>>>

<snip>

>>>   +static bool adv7533_cec_register_volatile(struct device *dev, unsigned int reg)
>>> +{
>>> +    switch (reg) {
>>> +    case ADV7511_REG_CEC_RX_FRAME_HDR + ADV7533_REG_CEC_OFFSET:
>>> +    case ADV7511_REG_CEC_RX_FRAME_DATA0 + ADV7533_REG_CEC_OFFSET...
>>> +        ADV7511_REG_CEC_RX_FRAME_DATA0 + ADV7533_REG_CEC_OFFSET + 14:
>>> +    case ADV7511_REG_CEC_RX_FRAME_LEN + ADV7533_REG_CEC_OFFSET:
>>> +    case ADV7511_REG_CEC_RX_BUFFERS + ADV7533_REG_CEC_OFFSET:
>>> +    case ADV7511_REG_CEC_TX_LOW_DRV_CNT + ADV7533_REG_CEC_OFFSET:
>>> +        return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static const struct regmap_config adv7533_cec_regmap_config = {
>>> +    .reg_bits = 8,
>>> +    .val_bits = 8,
>>> +
>>> +    .max_register = 0xff,
>>> +    .cache_type = REGCACHE_RBTREE,
>>> +    .volatile_reg = adv7533_cec_register_volatile,
>>> +};
>>> +
>>> +static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
>>> +{
>>
>> Maybe we could combine the two register_volatile() funcs and the remap_config structs
>> for adv7511 and adv7533 by passing (reg + offset) to switch?
> 
> How? How would I know in the volatile function whether it is an adv7511 or adv7533?
> Is there an easy way to go from the struct device to a struct adv7511?

Never mind, I figured it out.

Implemented.

Regards,

	Hans
