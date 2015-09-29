From: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 1/5] Documentation: add DT bindings for ARM SCPI sensors
Date: Tue, 29 Sep 2015 16:11:10 +0100
Message-ID: <9hhd1x16z1t.fsf@e105922-lin.cambridge.arm.com>
References: <1442335861-7282-1-git-send-email-punit.agrawal@arm.com>
	<1442335861-7282-2-git-send-email-punit.agrawal@arm.com>
	<9hhoagubk4m.fsf@e105922-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9hhoagubk4m.fsf-Z9gB6HwUD+TZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org> (Punit Agrawal's
	message of "Tue, 22 Sep 2015 15:31:53 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, liviu.dudau-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org> writes:

> Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org> writes:
>
>> The System Control Processor (SCP) provides access to SoC sensors via
>> the System Control and Power Interface (SCPI) Message Protocol. Add
>> bindings to allow probing of these sensors. Also support referencing
>> of the sensors for setting up thermal zones via the thermal DT
>> bindings.
>>
>> Signed-off-by: Punit Agrawal <punit.agrawal-5wv7dgnIgG8@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>
> Gentle reminder for review of the below bindings. They've been updated
> based on feedback on the earlier version [a].
>
> If there are no further comments, I'd like to request an ack from the DT
> reviewers.

Ping!

>
> [a] http://thread.gmane.org/gmane.linux.power-management.general/65475/focus=134976
>
>> ---
>>  Documentation/devicetree/bindings/arm/arm,scpi.txt | 38 ++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> index f002460..86302de 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> +++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> @@ -72,8 +72,25 @@ Required sub-node properties:
>>  - compatible : should be "arm,juno-scp-shmem" for Non-secure SRAM based
>>  	       shared memory on Juno platforms
>>  
>> +Sensor bindings for the sensors based on SCPI Message Protocol
>> +--------------------------------------------------------------
>> +SCPI provides an API to access the various sensors on the SoC.
>> +
>> +Required properties:
>> +- compatible : should be "arm,scpi-sensors".
>> +- #thermal-sensor-cells: should be set to 1. This property follows the
>> +			 thermal device tree bindings[2].
>> +
>> +			 Valid cell values are raw identifiers (Sensor
>> +			 ID) as used by the firmware. Refer to
>> +			 platform documentation for your
>> +			 implementation for the IDs to use. For Juno
>> +			 R0 and Juno R1 refer to [3].
>> +
>>  [0] http://infocenter.arm.com/help/topic/com.arm.doc.dui0922b/index.html
>>  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +[2] Documentation/devicetree/bindings/thermal/thermal.txt
>> +[3] http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0922b/apas03s22.html
>>  
>>  Example:
>>  
>> @@ -122,6 +139,11 @@ scpi_protocol: scpi@2e000000 {
>>  			clock-output-names = "pxlclk0", "pxlclk1";
>>  		};
>>  	};
>> +
>> +	scpi_sensors0: sensors {
>> +		compatible = "arm,scpi-sensors";
>> +		#thermal-sensor-cells = <1>;
>> +	};
>>  };
>>  
>>  cpu@0 {
>> @@ -136,6 +158,17 @@ hdlcd@7ff60000 {
>>  	clocks = <&scpi_clk 4>;
>>  };
>>  
>> +thermal-zones {
>> +	soc_thermal {
>> +		polling-delay-passive = <100>;
>> +		polling-delay = <1000>;
>> +
>> +				/* sensor         ID */
>> +		thermal-sensors = <&scpi_sensors0 3>;
>> +		...
>> +	};
>> +};
>> +
>>  In the above example, the #clock-cells is set to 1 as required.
>>  scpi_dvfs has 3 output clocks namely: atlclk, aplclk, and gpuclk with 0,
>>  1 and 2 as clock-indices. scpi_clk has 2 output clocks namely: pxlclk0
>> @@ -148,3 +181,8 @@ scpi_dvfs i.e. "atlclk".
>>  Similarly the second example is hdlcd@7ff60000 and it has pxlclk1 as input
>>  clock. '4' in the clock specifier here points to the second entry
>>  in the output clocks of scpi_clocks  i.e. "pxlclk1"
>> +
>> +The thermal-sensors property in the soc_thermal node uses the
>> +temperature sensor provided by SCP firmware to setup a thermal
>> +zone. The ID "3" is the sensor identifier for the temperature sensor
>> +as used by the firmware.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
