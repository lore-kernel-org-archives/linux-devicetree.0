From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 0/4] drm/tinydrm: new dirver for ILI9341 displays
Date: Sun, 3 Jun 2018 20:21:09 -0500
Message-ID: <d5297fc5-94f2-edcd-5a11-95d7a9dca78d@lechnology.com>
References: <20180525193623.15533-1-david@lechnology.com>
 <8840212b-fd46-e700-58a1-cb1b882c5771@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8840212b-fd46-e700-58a1-cb1b882c5771@tronnes.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, limor@ladyada.net, Nitin Patil <nitin@mindsensors.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 6/3/18 5:00 PM, Noralf Trønnes wrote:
> 
> Den 25.05.2018 21.36, skrev David Lechner:
>> This series adds a new tinydrm driver for the Ilitek ILI9341 
>> controller and
>> a 2.4" display panel that uses this controller.
> 
> David, do you have commit rights now?

No. Opened a bug a while back to request access, but I guess the
right person didn't see it.

https://bugs.freedesktop.org/show_bug.cgi?id=105166

> 
> Noralf.
> 
>> A few things to note here:
>> * The datasheet for this display[1] doesn't have a vendor mentioned on it
>>    anywhere, so I have used "adafruit" as the vendor prefix. If 
>> someone has a
>>    better suggestion, please speak up.
>> * The MAINTAINERS patch for ili9225 is included so we don't end up 
>> with a merge
>>    conflict later on.
>>
>> v2 changes:
>> * change vendor prefix from "noname" to "adafruit"
>> * new patch for "adafruit" vendor prefix
>> * minor style changes
>> * drop regulator from driver (instead of adding to DT bindings)
>>
>> [1]: 
>> https://cdn-learn.adafruit.com/assets/assets/000/046/879/original/SPEC-YX240QV29-T_Rev.A__1_.pdf 
>>
>>
>>
>> David Lechner (4):
>>    MAINTAINERS: fix path to ilitek,ili9225 device tree bindings
>>    dt-bindings: Add vendor prefix for Adafruit
>>    dt-bindings: new binding for Ilitek ILI9341 display panels
>>    drm/tinydrm: new driver for ILI9341 display panels
>>
>>   .../bindings/display/ilitek,ili9341.txt       |  27 ++
>>   .../devicetree/bindings/vendor-prefixes.txt   |   1 +
>>   MAINTAINERS                                   |   8 +-
>>   drivers/gpu/drm/tinydrm/Kconfig               |  10 +
>>   drivers/gpu/drm/tinydrm/Makefile              |   1 +
>>   drivers/gpu/drm/tinydrm/ili9341.c             | 233 ++++++++++++++++++
>>   6 files changed, 279 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/display/ilitek,ili9341.txt
>>   create mode 100644 drivers/gpu/drm/tinydrm/ili9341.c
>>
> 
