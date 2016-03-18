From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: dt: reset: Add syscon reset binding
Date: Fri, 18 Mar 2016 12:02:21 -0500
Message-ID: <56EC349D.3040100@ti.com>
References: <1457646365-1723-1-git-send-email-afd@ti.com>
 <1457646365-1723-2-git-send-email-afd@ti.com>
 <20160318163918.GA13101@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160318163918.GA13101@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 03/18/2016 11:39 AM, Rob Herring wrote:
> On Thu, Mar 10, 2016 at 03:46:04PM -0600, Andrew F. Davis wrote:
>> Add syscon reset controller binding. This will hook to the reset
>> framework and use syscon/regmap to set reset bits. This allows
>> reset control of individual SoC subsytems and devices with
>> memory-mapped reset registers in a common register memory
>> space.
>>
>> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>> [s-anna-l0cyMroinI0@public.gmane.org: revise the binding format]
>> Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../devicetree/bindings/reset/syscon-reset.txt     | 114 +++++++++++++++++++++
>>  include/dt-bindings/reset/syscon.h                 |  23 +++++
>>  2 files changed, 137 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
>>  create mode 100644 include/dt-bindings/reset/syscon.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/syscon-reset.txt b/Documentation/devicetree/bindings/reset/syscon-reset.txt
>> new file mode 100644
>> index 0000000..02bc9e3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/syscon-reset.txt
>> @@ -0,0 +1,114 @@
>> +SysCon Reset Controller
>> +=======================
>> +
>> +Almost all SoCs have hardware modules that require reset control in addition
>> +to clock and power control for their functionality. The reset control is
>> +typically provided by means of memory-mapped I/O registers. These registers are
>> +sometimes a part of a larger register space region implementing various
>> +functionalities. This register range is best represented as a syscon node to
>> +allow multiple entities to access their relevant registers in the common
>> +register space.
>> +
>> +A SysCon Reset Controller node defines a device that uses a syscon node
>> +and provides reset management functionality for various hardware modules
>> +present on the SoC.
>> +
>> +SysCon Reset Controller Node
>> +============================
>> +Each of the reset provider/controller nodes should be a child of a syscon
>> +node and have the following properties.
>> +
>> +Required properties:
>> +--------------------
>> + - compatible		: Should be "syscon-reset"
>> + - #reset-cells		: Should be 1. Please see the reset consumer node below
>> +			  for usage details
>> + - #address-cells	: Should be 1
>> + - #size-cells		: Should be 0
>> +
>> +SysCon Reset Child Node
>> +============================
>> +Each reset provider/controller node should have a child node for each reset
>> +it would like to expose to consumers.
> 
> A node per register bit... Now I'm only more convinced this is too low 
> level.

Thanks for the review/comments. So, what's your recommendation here -
add the reset info to driver match data and use SoC-specific
compatibles? That will also work, we just didn't go that route as it
appeared to be adding hardware data to a driver.

>> +
>> +Required properties:
>> +--------------------
>> + - reg			: This reset's number, this will be used to reference
>> +			  this reset by consumers of this reset
> 
> Now you have a made up index unrelated to anything in the h/w. Sometimes 
> that's unavoidable, but your prior version did.

We have made this change to avoid adding the reset data in the consumer
nodes as was done in v1, and provide it in the controller node itself.
We still need a way for consumers to match a specific reset. This is
unavoidable if the controller were to encode all the reset data (even if
we go with coding up the resets in the driver using SoC-specific
compatibles, and use a dt-include header file to mark the indices).

regards
Suman

> 
>> + - reset-control	: Contains the reset control register information
>> +			  Should contain 3 cells defined as:
>> +			    Cell #1 : register offset of the reset
>> +			              control/status register from the syscon
>> +			              register base
>> +			    Cell #2 : bit shift value for the reset in the
>> +			              respective reset control/status register
>> +			    Cell #3 : polarity of the reset bit. Should be 1 or
>> +				      RESET_ASSERT_SET for resets that are
>> +				      asserted when the bit is set, 0 or
>> +				      RESET_ASSERT_CLEAR for resets that are
>> +				      asserted when the bit is cleared
>> +
>> +Optional properties:
>> +--------------------
>> + - reset-status		: Contains the reset status register information. The
>> +			  contents of this property are the equivalent to
>> +			  reset-control as defined above. If this property is
>> +			  not present and the toggle flag is not set, the
>> +			  reset register is assumed to be the same as the
>> +			  control register
>> + - toggle		: Mark this reset as a toggle only reset, this is used
>> +			  when no status register is available.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
