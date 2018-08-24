From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v8 0/4] drm/atmel-hlcdc: bus-width override support
Date: Fri, 24 Aug 2018 09:59:11 +0200
Message-ID: <da750a67-8739-9153-72a7-7c7efd0ed7ec@axentia.se>
References: <20180810130359.9882-1-peda@axentia.se>
 <20180824095131.5d9cb33f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824095131.5d9cb33f@bbrezillon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org

On 2018-08-24 09:51, Boris Brezillon wrote:
> Hi Peter,
> 
> On Fri, 10 Aug 2018 15:03:55 +0200
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
>>
>> Cheers,
>> Peter
>>
>> Changes since v7  https://lkml.org/lkml/2018/8/4/288
>> - The ep device_node was leaked in v7 patch 3/3, so add patch 3/4
>>   which simplifies fixing this in patch 4/4 (and adds flexibility)
>>   and adjust patch 4/4 to the changes done in the new 3/4.
>> - return -ENOMEM on allocation failure in patch 4/4
> 
> I stopped following the discussion at some point. Are there any open
> issues or Ack you're waiting for?

The only worry is the silence from Rob on that multiple-endpoint
discussion. Since I don't really care deeply, my plan was fix up
the of_node leak in v7 without using of_graph_parse_endpoint. I.e.
drop 3/4.

But I would have prefer Rob to add some final opinion instead of the
discussion petering out like it did.

Cheers,
Peter
