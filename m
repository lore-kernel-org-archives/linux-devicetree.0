From: Michael Drake <michael.drake@codethink.co.uk>
Subject: Re: [PATCH v1 08/11] dt-bindings: display/bridge: Add bindings for
 ti949
Date: Fri, 12 Jul 2019 13:43:36 +0100
Message-ID: <534c485b-2074-1fcc-2d8f-11e5a9f278e4@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
 <20190611140412.32151-9-michael.drake@codethink.co.uk>
 <20190611181351.GW5016@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611181351.GW5016@pendragon.ideasonboard.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk, Patrick Glaser <pglaser@tesla.com>, Nate Case <ncase@tesla.com>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On 11/06/2019 19:13, Laurent Pinchart wrote:
> Hi Michael,
> 
> Thank you for the patch.

My pleasure, and thank you for the feedback!

> On Tue, Jun 11, 2019 at 03:04:09PM +0100, Michael Drake wrote:
>> Adds device tree bindings for:
>>
>>   TI DS90UB949-Q1 1080p HDMI to FPD-Link III bridge serializer
>>
>> It supports instantiation via device tree / ACPI table.
>>
>> The device has the compatible string "ti,ds90ub949", and
>> and allows an arrray of strings to be provided as regulator
>> names to enable for operation of the device.
> 
> All the comments I made regarding the ds90ub948 DT bindings apply here
> too. Same for the comments related to the driver, they apply to the
> subsequent patches in this series.

OK, understood.

Thank you very much for the review.

>> Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
>> Cc: Patrick Glaser <pglaser@tesla.com>
>> Cc: Nate Case <ncase@tesla.com>
>> ---
>>  .../bindings/display/bridge/ti,ds90ub949.txt  | 24 +++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt
>> new file mode 100644
>> index 000000000000..3ba3897d5e81
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,ds90ub949.txt
>> @@ -0,0 +1,24 @@
>> +TI DS90UB949-Q1 1080p HDMI to FPD-Link III bridge serializer
>> +============================================================
>> +
>> +This is the binding for Texas Instruments DS90UB949-Q1 bridge serializer.
>> +
>> +This device supports I2C only.
>> +
>> +Required properties:
>> +
>> +- compatible: "ti,ds90ub949"
>> +
>> +Optional properties:
>> +
>> +- regulators: List of regulator name strings to enable for operation of device.
>> +
>> +Example
>> +-------
>> +
>> +ti949: ds90ub949@0 {
>> +	compatible = "ti,ds90ub949";
>> +
>> +	regulators: "vcc",
>> +	            "vcc_hdmi";
>> +};
> 

-- 
Michael Drake                 https://www.codethink.co.uk/
