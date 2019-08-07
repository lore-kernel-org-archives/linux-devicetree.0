From: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v8 00/14] Rockchip ISP1 Driver
Date: Wed, 7 Aug 2019 14:57:02 -0300
Message-ID: <6a65a050-6c97-a2d2-2bf2-85d5071dfe7f@collabora.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190807153759.GP21370@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807153759.GP21370@paasikivi.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com
List-Id: devicetree@vger.kernel.org



On 8/7/19 12:37 PM, Sakari Ailus wrote:
> On Tue, Jul 30, 2019 at 03:42:42PM -0300, Helen Koike wrote:
>> Hello,
>>
>> I'm re-sending a new version of ISP(Camera) v4l2 driver for rockchip
>> rk3399 SoC.
>>
>> I didn't change much from the last version, just applying the
>> suggestions made in the previous one.
>>
>> This patchset is also available at:
>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v8
>>
>> Libcamera patched to work with this version:
>> https://gitlab.collabora.com/koike/libcamera
>> (also sent to the mailing list)
>>
>> I tested on the rockpi 4 with a rpi v1.3 sensor and also with the
>> Scarlet Chromebook.
> 
> Could you also post media-ctl -p printout e.g. as a reply to the cover
> letter?
> 
> Thanks.
> 

Yes, I had posted in v7 and I forgot to add it in subsequent cover letters:

media-ctl --print-dot -> file available at: http://ix.io/1NIH

root@rockpi:~# media-ctl -p
Media controller API version 5.3.0

Media device information
------------------------
driver          rkisp1
model           rkisp1
serial
bus info        platform: rkisp1
hw revision     0x0
driver version  5.3.0

Device topology
- entity 1: rkisp1-isp-subdev (4 pads, 5 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:SBGGR10_1X10/800x600 field:none
                 crop.bounds:(0,0)/800x600
                 crop:(0,0)/800x600]
                <- "ov5647 4-0036":0 [ENABLED]
        pad1: Sink
                [fmt:FIXED/800x600 field:none]
                <- "rkisp1-input-params":0 [ENABLED]
        pad2: Source
                [fmt:YUYV8_2X8/800x600 field:none
                 crop.bounds:(0,0)/800x600
                 crop:(0,0)/800x600]
                -> "rkisp1_selfpath":0 [ENABLED]
                -> "rkisp1_mainpath":0 [ENABLED]
        pad3: Source
                [fmt:FIXED/800x600 field:none]
                -> "rkisp1-statistics":0 [ENABLED]

- entity 6: rkisp1_mainpath (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "rkisp1-isp-subdev":2 [ENABLED]

- entity 10: rkisp1_selfpath (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
        pad0: Sink
                <- "rkisp1-isp-subdev":2 [ENABLED]

- entity 14: rkisp1-statistics (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
        pad0: Sink
                <- "rkisp1-isp-subdev":3 [ENABLED]

- entity 18: rkisp1-input-params (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video3
        pad0: Source
                -> "rkisp1-isp-subdev":1 [ENABLED]

- entity 22: ov5647 4-0036 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev1
        pad0: Source
                [fmt:SBGGR8_1X8/1280x960 field:none]
                -> "rkisp1-isp-subdev":0 [ENABLED]


Thanks
Helen
