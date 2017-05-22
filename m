From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/3] Fix mdp device tree
Date: Mon, 22 May 2017 16:14:26 +0200
Message-ID: <1f7de9e7-2c18-6662-4b95-519d22a70723@gmail.com>
References: <1494559361-42835-1-git-send-email-minghsiu.tsai@mediatek.com>
 <20ba4f83-7d22-2a8e-4eb6-7d4eba92e2ae@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20ba4f83-7d22-2a8e-4eb6-7d4eba92e2ae-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wu-Cheng Li <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 22/05/17 11:09, Hans Verkuil wrote:
> On 05/12/2017 05:22 AM, Minghsiu Tsai wrote:
> 
> Who should take care of the dtsi changes? I'm not sure who maintains the mdp dts.

I will take care of the dtsi patches.

> 
> The driver change and the dtsi change need to be in sync, so it is probably easiest
> to merge this via one tree.
> 
> Here is my Acked-by for these three patches:
> 
> Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
> 
> I can take all three, provided I have the Ack of the mdp dts maintainer. Or it can
> go through him with my Ack.
> 

I think we should provide backwards compability instead, as proposed here:
http://lists.infradead.org/pipermail/linux-mediatek/2017-May/008811.html

If this change is ok for you, please let Minghsiu know so that he can 
provide a v4.

Regards,
Matthias

> Regards,
> 
> 	Hans
> 
>> Changes in v3:
>> - Upload patches again because forget to add v2 in title
>>
>> Changes in v2:
>> - Update commit message
>>
>> If the mdp_* nodes are under an mdp sub-node, their corresponding
>> platform device does not automatically get its iommu assigned properly.
>>
>> Fix this by moving the mdp component nodes up a level such that they are
>> siblings of mdp and all other SoC subsystems.  This also simplifies the
>> device tree.
>>
>> Although it fixes iommu assignment issue, it also break compatibility
>> with old device tree. So, the patch in driver is needed to iterate over
>> sibling mdp device nodes, not child ones, to keep driver work properly.
>>
>> Daniel Kurtz (2):
>>    arm64: dts: mt8173: Fix mdp device tree
>>    media: mtk-mdp: Fix mdp device tree
>>
>> Minghsiu Tsai (1):
>>    dt-bindings: mt8173: Fix mdp device tree
>>
>>   .../devicetree/bindings/media/mediatek-mdp.txt     |  12 +-
>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 126 ++++++++++-----------
>>   drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |   2 +-
>>   3 files changed, 64 insertions(+), 76 deletions(-)
>>
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
