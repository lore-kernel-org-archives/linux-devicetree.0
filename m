From: =?UTF-8?B?V3UtQ2hlbmcgTGkgKOadjuWLmeiqoCk=?=
	<wuchengli-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 0/9] Add MT8173 Video Decoder Driver
Date: Tue, 14 Jun 2016 16:44:36 +0800
Message-ID: <CAOMLVLjnktOoDWseZBwsFwLbym8mX7CQzOHW3tbum1yWJjfFNA@mail.gmail.com>
References: <1464611363-14936-1-git-send-email-tiffany.lin@mediatek.com>
 <20160607112235.475c2e4c@recife.lan> <575746EE.3030706@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575746EE.3030706-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lin PoChun <PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 6:13 AM, Hans Verkuil <hansverk-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
>
>
> On 06/07/2016 11:22 PM, Mauro Carvalho Chehab wrote:
>>
>> Em Mon, 30 May 2016 20:29:14 +0800
>> Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> escreveu:
>>
>>> ==============
>>>   Introduction
>>> ==============
>>>
>>> The purpose of this series is to add the driver for video codec hw
>>> embedded in the Mediatek's MT8173 SoCs.
>>> Mediatek Video Codec is able to handle video decoding of in a range of
>>> formats.
>>>
>>> This patch series add Mediatek block format V4L2_PIX_FMT_MT21, the
>>> decoder driver will decoded bitstream to
>>> V4L2_PIX_FMT_MT21 format.
>>>
>>> This patch series rely on MTK VPU driver in patch series "Add MT8173
>>> Video Encoder Driver and VPU Driver"[1]
>>> and patch "CHROMIUM: v4l: Add V4L2_PIX_FMT_VP9 definition"[2] for VP9
>>> support.
>>> Mediatek Video Decoder driver rely on VPU driver to load, communicate
>>> with VPU.
>>>
>>> Internally the driver uses videobuf2 framework and MTK IOMMU and MTK SMI
>>> both have been merged in v4.6-rc1.
>>>
>>> [1]https://patchwork.linuxtv.org/patch/33734/
>>> [2]https://chromium-review.googlesource.com/#/c/245241/
>>
>>
>> Hmm... I'm not seeing the firmware for this driver at the
>> linux-firmware tree:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/log/
Tiffany. Can you check the license and add the firmware to linux-firmware?

For the information, both encoder and decoder drivers require the
firmware to work.
>>
>> Nor I'm seeing any pull request for them. Did you send it?
>> I'll only merge the driver upstream after seeing such pull request.
>
>
> Mauro, are you confusing the decoder and encoder driver? I haven't
> thoroughly reviewed the decoder driver
> yet, so there is no pull request for the decoder driver.
>
> The only pull request I made was for the encoder driver.
>
> Regards,
>
>         Hans
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
