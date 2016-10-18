MIME-Version: 1.0
In-Reply-To: <871394da-988b-b177-79e0-72a02e80b258@denx.de>
References: <20161017163329.11821-1-marex@denx.de>
	<20161017163329.11821-2-marex@denx.de>
	<20161018163037.wl6ceend32epp6k6@rob-hp-laptop>
	<871394da-988b-b177-79e0-72a02e80b258@denx.de>
Date: Tue, 18 Oct 2016 14:58:49 -0500
Message-ID: <CAL_JsqKiLSV_x4P3BEk6X34_+hS3iqBThizppqybVVv-cA4qYg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: it6251: add bindings for IT6251
 LVDS-to-eDP bridge
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Marek Vasut <marex@denx.de>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Cross <xobs@kosagi.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 18, 2016 at 11:35 AM, Marek Vasut <marex@denx.de> wrote:
> On 10/18/2016 06:30 PM, Rob Herring wrote:
>> On Mon, Oct 17, 2016 at 06:33:28PM +0200, Marek Vasut wrote:
>>> Add DT bindings for ITE IT6251 LVDS-to-eDP bridge.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Rob Herring <robh@kernel.org>
>>> Cc: Sean Cross <xobs@kosagi.com>
>>> ---
>>>  .../bindings/display/bridge/ite,it6251.txt         | 35 ++++++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
>>> new file mode 100644
>>> index 0000000..c5db82c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
>>> @@ -0,0 +1,35 @@
>>> +ITE IT6251 LVDS-to-eDP bridge bindings
>>> +
>>> +Required properties:
>>> +- compatible:               Should be "ite,it6251"
>>> +- reg:                      i2c address of the bridge, i2c address of the LVDS part
>>> +- reg-names:                Should be "bridge", "lvds"
>>> +- power-supply:             Regulator to provide the supply voltage
>>
>> The input pin is called "power"?
>
> The chip has about 7 power rails, but the design I have only has an
> upstream regulator which toggles them all. I wonder, shall we model
> all the rails ?

Yes, because others may have a different design.

Rob
