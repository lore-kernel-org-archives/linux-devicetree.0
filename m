From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Mon, 15 May 2017 19:11:21 -0500
Message-ID: <CAL_Jsq+Pt5necK9cUPwFqmCbK5d-0NVNv-_LRVqyNgr5ajR8LQ@mail.gmail.com>
References: <20170511235625.22427-1-eric@anholt.net> <20170511235625.22427-3-eric@anholt.net>
 <1579603.xgvSgGFBs8@avalon> <87shk53bxq.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87shk53bxq.fsf@eliezer.anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 15, 2017 at 7:03 PM, Eric Anholt <eric@anholt.net> wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
>
>> Hi Eric,
>>
>> Thank you for the patch.
>>
>> On Thursday 11 May 2017 16:56:23 Eric Anholt wrote:
>>> The Raspberry Pi 7" Touchscreen is a DPI touchscreen panel with
>>> DSI->DPI bridge and touchscreen controller integrated, that connects
>>> to the Raspberry Pi through its 15-pin "DSI" connector (some lines are
>>> DSI, some lines are I2C).
>>>
>>> This device is represented in the DT as three nodes (DSI device, I2C
>>> device, panel).  Input will be left to a separate binding later, as it
>>> will be a basic I2C client device.
>>>
>>> Signed-off-by: Eric Anholt <eric@anholt.net>
>>> ---
>>>  .../raspberrypi,7inch-touchscreen-bridge.txt       | 68 +++++++++++++++++++
>>>  .../panel/raspberrypi,7inch-touchscreen-panel.txt  |  7 +++
>>>  2 files changed, 75 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchscr
>>> een-bridge.txt create mode 100644
>>> Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-touchscre
>>> en-panel.txt
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchs
>>> creen-bridge.txt
>>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchs
>>> creen-bridge.txt new file mode 100644
>>> index 000000000000..a5669beaf68f
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-touchs
>>> creen-bridge.txt @@ -0,0 +1,68 @@
>>> +Official 7" (800x480) Raspberry Pi touchscreen panel's bridge.
>>> +
>>> +This DSI panel contains:
>>> +
>>> +- TC358762 DSI->DPI bridge
>>> +- Atmel microcontroller on I2C for power sequencing the DSI bridge and
>>> +  controlling backlight
>>> +- Touchscreen controller on I2C for touch input
>>> +
>>> +and this covers the TC358762 bridge and Atmel microcontroller, while
>>> +../panel/raspberrypi,7inch-touchscreen-panel.txt covers the panel.
>>
>> The TC358762 is a standalone bridge that doesn't depend on the ATTiny
>> microcontroller used by the RPI. As it's usable standalone, I believe this
>> binding should be split in two.
>
> Do you have a plan for how I would implement a driver on top of that
> binding change, though?  Note that we don't program the Toshiba
> directly, we only send commands to the Atmel.

I agree. If it is a black box and the interface to the host is defined
by the Atmel uC firmware, then that's what the DT should describe.
Perhaps a diagram here or pointer to one would help and remove
mentioning what kind of bridge chip it is.

Rob
