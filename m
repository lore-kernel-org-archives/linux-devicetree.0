From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH v10 0/8] Add MT8173 Video Encoder Driver and VPU Driver
Date: Wed, 4 May 2016 10:25:47 +0200
Message-ID: <5729B20B.6090006@xs4all.nl>
References: <1462270287-11374-1-git-send-email-tiffany.lin@mediatek.com>
 <5729A57E.1080505@xs4all.nl> <1462349987.1891.5.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462349987.1891.5.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/04/2016 10:19 AM, tiffany lin wrote:
> Hi Hans,
> 
> On Wed, 2016-05-04 at 09:32 +0200, Hans Verkuil wrote:
>> Hi Tiffany,
>>
>> On 05/03/2016 12:11 PM, Tiffany Lin wrote:
>>> ==============
>>>  Introduction
>>> ==============
>>>
>>> The purpose of this series is to add the driver for video codec hw embedded in the Mediatek's MT8173 SoCs.
>>> Mediatek Video Codec is able to handle video encoding of in a range of formats.
>>>
>>> This patch series also include VPU driver. Mediatek Video Codec driver rely on VPU driver to load,
>>> communicate with VPU.
>>>
>>> Internally the driver uses videobuf2 framework and MTK IOMMU and MTK SMI both have been merged in v4.6-rc1.
>>> This patch series need [PATCH v15 8/8] memory: mtk-smi: export mtk_smi_larb_get/put[1] to build as module
>>>
>>> [1]http://lists.infradead.org/pipermail/linux-mediatek/2016-April/005173.html
>>>
>>> ==================
>>>  Device interface
>>> ==================
>>>
>>> In principle the driver bases on v4l2 memory-to-memory framework:
>>> it provides a single video node and each opened file handle gets its own private context with separate
>>> buffer queues. Each context consist of 2 buffer queues: OUTPUT (for source buffers, i.e. raw video
>>> frames) and CAPTURE (for destination buffers, i.e. encoded video frames).
>>>
>>> ==============================
>>>  VPU (Video Processor Unit)
>>> ==============================
>>> The VPU driver for hw video codec embedded in Mediatek's MT8173 SOCs.
>>> It is able to handle video decoding/encoding in a range of formats.
>>> The driver provides with VPU firmware download, memory management and the communication interface between CPU and VPU.
>>> For VPU initialization, it will create virtual memory for CPU access and physical address for VPU hw device access. 
>>> When a decode/encode instance opens a device node, vpu driver will download vpu firmware to the device.
>>> A decode/encode instant will decode/encode a frame using VPU interface to interrupt vpu to handle decoding/encoding jobs.
>>>
>>> Please have a look at the code and comments will be very much appreciated.
>>>
>>> Change in v10:
>>> 1. Fix smatch/sparse error message
>>> 2. Add depends on ARM || ARM64 and MTK_IOMMU in Kconfig
>>
>> I don't like the ARM or ARM64 dependency since that makes COMPILE_TEST harder.
>>
>> I removed it here and for the VPU and everything still compiles fine with
>> sparse and smatch. So I'll drop those dependencies.
>>
>> Why is the MTK_IOMMU dependency needed? Just curious.
>>
> This is because we need MTK_IOMMU module to get dma continuous memory
> for HW.
> 
>> Note that sparse still complains about this:
>>
>> media-git/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c:261:24: warning: incorrect type in assignment (different base types)
>>
>> I think this code should be rewritten. Something like this would work
>> (if I understand the code correctly):
>>
>> u32 tag = (bs_hdr_len << 5) | 0x10 | not_key;
>>
>> ac_tag[0] = tag & 0xff;
>> ac_tag[1] = (tag >> 8) & 0xff;
>> ac_tag[2] = (tag >> 16) & 0xff;
>>
>> It's perhaps a bit more verbose, but a lot easier to understand.
>>
> 
>> I'm accepting this driver but I'll remove the ARM || ARM64 dependency. Can
>> you post a follow-up patch for this sparse warning?
>>
> 
> Got it. We will provide a patch to fix this.
> I was curious why my sparse do not show this warning.
> Is there any parameter I need to set except C=1?

I'm running it with these parameters: C=2 CF="-D__CHECK_ENDIAN__"

I suspect it is the CHECK_ENDIAN flag that does it.

Regards,

	Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
