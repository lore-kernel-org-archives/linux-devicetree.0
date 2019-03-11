From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [5.2][PATCH 0/3] Ingenic JZ47xx KMS driver
Date: Mon, 11 Mar 2019 12:45:05 +0100
Message-ID: <1552304705.1929.0@crapouillou.net>
References: <20190228220756.20262-1-paul@crapouillou.net>
        <fce3f17981cda6a263abcce6b2902591e7984fa4.camel@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fce3f17981cda6a263abcce6b2902591e7984fa4.camel@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ezequiel,

On Mon, Mar 11, 2019 at 1:02 AM, Ezequiel Garcia 
<ezequiel@collabora.com> wrote:
> On Thu, 2019-02-28 at 19:07 -0300, Paul Cercueil wrote:
>>  Hi,
>> 
>>  This is a first attempt at a KMS driver for the JZ47xx MIPS SoCs by
>>  Ingenic. It is aimed to replace the aging jz4740-fb driver.
>> 
>>  The driver will later be updated with new features (overlays, TV-out
>>  etc.), that's why I didn't go with the simple/tiny DRM driver.
>> 
>>  The driver has been tested on the Ben Nanonote (JZ4740) and the
>>  RetroMini RS-90 (JZ4725B) handheld gaming console.
>> 
> 
> Does this support JZ4780? Or otherwise,
> is there any similarity with JZ4780 display controller?
> 
> Thanks,
> Eze

The JZ4780 LCD controller would in theory work with this driver, but
to test on the CI20 you'd need to add support for HDMI first.

-Paul
