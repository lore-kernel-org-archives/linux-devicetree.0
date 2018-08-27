From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v9 0/4] drm/atmel-hlcdc: bus-width override support
Date: Mon, 27 Aug 2018 22:31:22 +0200
Message-ID: <ca38bd82-09d2-8e55-a3a2-e0e559abdf7f@axentia.se>
References: <20180825085620.10566-1-peda@axentia.se>
 <20180827212449.723bdc99@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827212449.723bdc99@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org

On 2018-08-27 21:24, Boris Brezillon wrote:
> On Sat, 25 Aug 2018 10:56:16 +0200
> Peter Rosin <peda@axentia.se> wrote:
> 
>> Hi!
>>
>> The background for these patches is that our PCB interface between
>> the SAMA5D3 and the ds90c185 lvds encoder is only using 16 bits, and
>> this has to be described somewhere, or the atmel-hlcdc driver have no
>> chance of selecting the correct output mode. Since we have similar
>> problems with a tda19988 HDMI encoder I added patches to override
>> the atmel-hlcdc output format via DT properties compatible with the
>> media video-interface binding and things start to play together.
> 
> Queued to drm-misc-next.

Thanks!

Minute issue, you seem to have some spell-check going on or something,
because the subject of patch 1/4 has been "corrected" from
"...add ti,ds90c185" to "...add ti, ds90c185"

You might want to evaluate if that auto-correction "feature" should be
disabled/tweaked/whatever...

Cheers,
Peter

> Thanks,
> 
> Boris
> 
>>
>> Cheers,
>> Peter
>>
>> Changes since v8  https://lkml.org/lkml/2018/8/10/309
>> - go back to the solution in v7 (but the ep device_node leak fixed)
>>   for patch 4/4
>> - redo (part of) 3/4 w/o using the disliked of_graph_parse_endpoint
>>
>> Changes since v7  https://lkml.org/lkml/2018/8/4/288
>> - The ep device_node was leaked in v7 patch 3/3, so add patch 3/4
>>   which simplifies fixing this in patch 4/4 (and adds flexibility)
>>   and adjust patch 4/4 to the changes done in the new 3/4.
>> - return -ENOMEM on allocation failure in patch 4/4
>>
>> Changes since v6  https://lkml.org/lkml/2018/8/3/333
>> - zap bus-type from the binding in patch 2/3
>>
>> Changes since (the shortened) v5  https://lkml.org/lkml/2018/8/3/182
>> - add reg properties (and #*-cells) to the example in patch 2/3
>> - prohibit bus-width 0 in the device-tree in patch 3/3
>> - added reviewed-by from Jacopo to patch 2/3 and 3/3
>>
>> Peter Rosin (4):
>>   dt-bindings: display: bridge: lvds-transmitter: add ti,ds90c185
>>   dt-bindings: display: atmel: optional video-interface of endpoints
>>   drm/atmel-hlcdc: always iterate over the first 4 output endpoints
>>   drm/atmel-hlcdc: support bus-width (12/16/18/24) in endpoint nodes
>>
>>  .../devicetree/bindings/display/atmel/hlcdc-dc.txt | 23 ++++++
>>  .../bindings/display/bridge/lvds-transmitter.txt   |  8 +-
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     | 70 +++++++++++-----
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |  1 +
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   | 92 +++++++++++++++++++---
>>  5 files changed, 163 insertions(+), 31 deletions(-)
>>
> 
