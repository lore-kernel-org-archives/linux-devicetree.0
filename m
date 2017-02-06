From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCHv2 08/16] atmel-isi: document device tree bindings
Date: Mon, 6 Feb 2017 12:46:16 +0100
Message-ID: <3b38dad8-9044-3d2f-6a37-4945a3824bae@xs4all.nl>
References: <20170130140628.18088-1-hverkuil@xs4all.nl>
 <20170130140628.18088-9-hverkuil@xs4all.nl>
 <20170131073035.GR7139@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20170131073035.GR7139@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Songjun Wu <songjun.wu@microchip.com>, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: devicetree@vger.kernel.org

On 01/31/2017 08:30 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Jan 30, 2017 at 03:06:20PM +0100, Hans Verkuil wrote:
>> From: Hans Verkuil <hans.verkuil@cisco.com>
>>
>> Document the device tree bindings for this driver.
>>
>> Mostly copied from the atmel-isc bindings.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
>> ---
>>  .../devicetree/bindings/media/atmel-isi.txt        | 91 +++++++++++++---------
>>  1 file changed, 56 insertions(+), 35 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/atmel-isi.txt b/Documentation/devicetree/bindings/media/atmel-isi.txt
>> index 251f008..d1934b4 100644
>> --- a/Documentation/devicetree/bindings/media/atmel-isi.txt
>> +++ b/Documentation/devicetree/bindings/media/atmel-isi.txt
>> @@ -1,51 +1,72 @@
>> -Atmel Image Sensor Interface (ISI) SoC Camera Subsystem
>> -----------------------------------------------
>> +Atmel Image Sensor Interface (ISI)
>> +----------------------------------
>>  
>> -Required properties:
>> -- compatible: must be "atmel,at91sam9g45-isi"
>> -- reg: physical base address and length of the registers set for the device;
>> -- interrupts: should contain IRQ line for the ISI;
>> -- clocks: list of clock specifiers, corresponding to entries in
>> -          the clock-names property;
>> -- clock-names: must contain "isi_clk", which is the isi peripherial clock.
>> +Required properties for ISI:
>> +- compatible
>> +	Must be "atmel,at91sam9g45-isi".
>> +- reg
>> +	Physical base address and length of the registers set for the device.
>> +- interrupts
>> +	Should contain IRQ line for the ISI.
>> +- clocks
>> +	List of clock specifiers, corresponding to entries in
>> +	the clock-names property;
>> +	Please refer to clock-bindings.txt.
>> +- clock-names
>> +	Required elements: "isi_clk".
>> +- #clock-cells
>> +	Should be 0.
> 
> #clock-cells can't be found in the example. Does the ISI block provide a
> #clock?

Oops, left-over from the atmel-isc.txt bindings. Removed.

> 
>> +- pinctrl-names, pinctrl-0
>> +	Please refer to pinctrl-bindings.txt.
>>  
>>  ISI supports a single port node with parallel bus. It should contain one
>>  'port' child node with child 'endpoint' node. Please refer to the bindings
>>  defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
> 
> We haven't documented exactly which properties are relevant for parallel
> interfaces. I think we should, but until that's done we should explicitly
> document which endpoint properties are mandatory and which are optional.
> 
> Such as in Documentation/devicetree/bindings/media/i2c/nokia,smia.txt .

Done.

Thanks,

	Hans
