From: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Subject: Re: [PATCH RFC 6/8] drm: hisilicon: Add support for fbdev
Date: Wed, 16 Sep 2015 11:32:17 +0800
Message-ID: <55F8E2C1.5030207@hisilicon.com>
References: <1442309834-21420-1-git-send-email-kong.kongxinwei@hisilicon.com> <1442309834-21420-7-git-send-email-kong.kongxinwei@hisilicon.com> <55F862A1.30308@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <55F862A1.30308@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, airlied@linux.ie, corbet@lwn.net, catalin.marinas@arm.com, will.deacon@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xinliang.liu@linaro.org, andy.green@linaro.org, qijiwen@hisilicon.com, gongyu@hisilicon.com, haojian.zhuang@linaro.org, liguozhu@hisilicon.com, xuwei5@hisilicon.com, yinshengbao@hisilicon.com, yanhaifeng@hisilicon.com, ml.yang@hisilicon.com, yimin@huawei.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, benjamin.gaignard@linaro.org, xuyiping@hisilicon.com, james.yanglong@hisilicon.com, fangdechun@hisilicon.com
List-Id: devicetree@vger.kernel.org

hi rob

On 2015/9/16 2:25, Rob Herring wrote:
> On 09/15/2015 04:37 AM, Xinwei Kong wrote:
>> If you config DRM_HISI_FBDEV optional, this patch will only support fbdev
>> mode while also supporting double buffer.
> 
> This is a lot of duplicated code from CMA fbdev. Is double buffering the
> only reason why CMA fbdev can't be used or are there some other
> constraints? Double buffering in fbdev has always been a hack, so I'm
> guessing that is not a feature that should be added here.
> 
I will drop it.

xinwei
> Rob
> 
>> Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
>> Signed-off-by: Xinwei Kong <kong.kongxinwei@hisilicon.com>
>> Signed-off-by: Andy Green <andy.green@linaro.org>
>> Signed-off-by: Jiwen Qi <qijiwen@hisilicon.com>
>> Signed-off-by: Yu Gong <gongyu@hisilicon.com>
>> ---
>>  drivers/gpu/drm/hisilicon/Kconfig              |  13 +
>>  drivers/gpu/drm/hisilicon/Makefile             |   3 +-
>>  drivers/gpu/drm/hisilicon/hisi_drm_connector.c |   4 +
>>  drivers/gpu/drm/hisilicon/hisi_drm_drv.c       |   9 +
>>  drivers/gpu/drm/hisilicon/hisi_drm_dsi.c       |  15 +
>>  drivers/gpu/drm/hisilicon/hisi_drm_fb.h        |   5 +
>>  drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c     | 395 +++++++++++++++++++++++++
>>  drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h     |  24 ++
>>  8 files changed, 467 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.c
>>  create mode 100644 drivers/gpu/drm/hisilicon/hisi_drm_fbdev.h
> 
> 
> .
> 

