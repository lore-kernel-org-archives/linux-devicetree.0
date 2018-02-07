From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: mediatek: modify MT7622 audsys to adapt MFD
 device
Date: Wed, 7 Feb 2018 16:18:59 +0100
Message-ID: <0e0e703c-0ac9-06ad-91c5-abdf16de1ee9@gmail.com>
References: <cover.1515639336.git.ryder.lee@mediatek.com>
 <d6669277f5232446b4798a6b724074b18d5c21aa.1515639336.git.ryder.lee@mediatek.com>
 <72058f8d-c83d-d0e6-dc07-83c9f5fc2710@gmail.com>
 <1517803655.1173.12.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517803655.1173.12.camel@mtkswgap22>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Garlic Tseng <garlic.tseng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 02/05/2018 05:07 AM, Ryder Lee wrote:
> On Sat, 2018-02-03 at 15:26 +0100, Matthias Brugger wrote:
>>
>> On 01/31/2018 08:42 AM, Ryder Lee wrote:
>>> As the new MFD parent is in place, switch probing method to adapt it.
>>>
>>> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  drivers/clk/mediatek/clk-mt7622-aud.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
>>> index 13f752d..8c18536 100644
>>> --- a/drivers/clk/mediatek/clk-mt7622-aud.c
>>> +++ b/drivers/clk/mediatek/clk-mt7622-aud.c
>>> @@ -142,11 +142,12 @@ static int clk_mt7622_audiosys_init(struct platform_device *pdev)
>>>  {
>>>  	struct clk_onecell_data *clk_data;
>>>  	struct device_node *node = pdev->dev.of_node;
>>> +	struct device_node *pnode = pdev->dev.parent->of_node;
>>>  	int r;
>>>  
>>>  	clk_data = mtk_alloc_clk_data(CLK_AUDIO_NR_CLK);
>>>  
>>> -	mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
>>> +	mtk_clk_register_gates(pnode, audio_clks, ARRAY_SIZE(audio_clks),
>>
>> We will need a fallback here for older device tree bindings.
>>
>> Regards,
>> Matthias
> 
> Up to now, I didn't see both driver and bindings are used anywhere.
> Should I still care about that?
> 

Yes please, we have to ensure that newer kernel work with older bindings and
vice-versa.

Thanks,
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
