From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 01/26] dt-bindings: display: display-timing: Add property
 to configure sync drive edge
Date: Mon, 12 Sep 2016 16:22:53 +0300
Message-ID: <57580a7f-2462-3fb9-bb87-ff8387f7be38@ti.com>
References: <20160901112320.15246-1-peter.ujfalusi@ti.com>
 <20160901112320.15246-2-peter.ujfalusi@ti.com>
 <20160912130520.GA9582@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160912130520.GA9582@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, airlied@linux.ie, tomi.valkeinen@ti.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/12/16 16:05, Rob Herring wrote:
> On Thu, Sep 01, 2016 at 02:22:55PM +0300, Peter Ujfalusi wrote:
>> There are display panels which demands that the sync signal is driven on
>> different edge than the pixel data.
>> With the syncclk-active property we can specify the clk edge to be used to
>> drive the sync signal. When the property is missing it indicates that the
>> sync is driven on the same edge as the pixel data.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> CC: Rob Herring <robh+dt@kernel.org>
>> CC: Mark Rutland <mark.rutland@arm.com>
>> CC: devicetree@vger.kernel.org
>> ---
>>  Documentation/devicetree/bindings/display/panel/display-timing.txt | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/display-timing.txt b/Documentation/devicetree/bindings/display/panel/display-timing.txt
>> index e1d4a0b59612..1436292e7a56 100644
>> --- a/Documentation/devicetree/bindings/display/panel/display-timing.txt
>> +++ b/Documentation/devicetree/bindings/display/panel/display-timing.txt
>> @@ -32,6 +32,12 @@ optional properties:
>>  			- active low  = drive pixel data on falling edge/
>>  					sample data on rising edge
>>  			- ignored     = ignored
>> + - syncclk-active: with
>> +			- active high = drive sync on rising edge/
> 
> rising edge of what? pixel clk?

Yes, pixel clk, I have copied and modified the 'pixelclk-active' option.
Probably it would be better to state it explicitly.

> 
>> +					sample sync on falling edge
>> +			- active low  = drive sync on falling edge/
>> +					sample sync on rising edge
>> +			- omitted     = same configuration as pixelclk-active
>>   - interlaced (bool): boolean to enable interlaced mode
>>   - doublescan (bool): boolean to enable doublescan mode
>>   - doubleclk (bool): boolean to enable doubleclock mode
>> -- 
>> 2.9.3
>>


-- 
Péter
