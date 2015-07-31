From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/8] Documentation: add DT binding for ARM System Control
 and Power Interface(SCPI) protocol
Date: Fri, 31 Jul 2015 17:07:26 +0100
Message-ID: <55BB9D3E.1000605@arm.com>
References: <1437649828-14540-1-git-send-email-sudeep.holla@arm.com> <1437649828-14540-2-git-send-email-sudeep.holla@arm.com> <20150731160027.GG25118@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150731160027.GG25118@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Punit Agrawal <Punit.Agrawal-5wv7dgnIgG8@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 31/07/15 17:00, Mark Rutland wrote:
> Hi,
>
> On Thu, Jul 23, 2015 at 12:10:21PM +0100, Sudeep Holla wrote:
>> This patch adds devicetree binding for System Control and Power
>> Interface (SCPI) Message Protocol used between the Application Cores(AP)
>> and the System Control Processor(SCP). The MHU peripheral provides a
>> mechanism for inter-processor communication between SCP's M3 processor
>> and AP.
>>
>> SCP offers control and management of the core/cluster power states,
>> various power domain DVFS including the core/cluster, certain system
>> clocks configuration, thermal sensors and many others.
>>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> CC: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
>> Cc: Jon Medhurst (Tixy) <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>   Documentation/devicetree/bindings/arm/arm,scpi.txt | 151 +++++++++++++++++++++
>>   MAINTAINERS                                        |   6 +
>>   2 files changed, 157 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/arm,scpi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> new file mode 100644
>> index 000000000000..e21cce646561
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
>> @@ -0,0 +1,151 @@
>> +System Control and Power Interface (SCPI) Message Protocol
>> +----------------------------------------------------------
>> +
>> +Firmware implementing the SCPI described in ARM document number ARM DUI 0922B
>> +("ARM Compute Subsystem SCP: Message Interface Protocols")[0] can be used
>> +by Linux to initiate various system control and power operations.
>> +
>> +Required properties:
>> +
>> +- compatible : should be "arm,scpi"
>> +- mboxes: List of phandle and mailbox channel specifiers
>> +	  All the channels reserved by remote SCP firmware for use by
>> +	  SCPI message protocol should be specified in any order
>> +- shmem : List of phandle pointing to the shared memory(SHM) area between the
>> +	  processors using these mailboxes for IPC, one for each mailbox
>> +	  SHM can be any memory reserved for the purpose of this communication
>> +	  between the processors.
>> +
>> +See Documentation/devicetree/bindings/mailbox/mailbox.txt
>> +for more details about the generic mailbox controller and
>> +client driver bindings.
>> +
>> +Clock bindings for the clocks based on SCPI Message Protocol
>> +------------------------------------------------------------
>> +
>> +This binding uses the common clock binding[1].
>> +
>> +Container Node
>> +==============
>> +Required properties:
>> +- compatible : should be "arm,scpi-clocks"
>> +	       All the clocks provided by SCP firmware via SCPI message
>> +	       protocol much be listed as sub-nodes under this node.
>> +
>> +Sub-nodes
>> +=========
>> +Required properties:
>> +- compatible : shall include one of the following
>> +	"arm,scpi-dvfs-clocks" - all the clocks that are variable and index based.
>> +		These clocks don't provide an entire range of values between the
>> +		limits but only discrete points within the range. The firmware
>> +		provides the mapping for each such operating frequency and the
>> +		index associated with it. The firmware also manages the
>> +		voltage scaling appropriately with the clock scaling.
>> +	"arm,scpi-variable-clocks" - all the clocks that are variable and provide full
>> +		range within the specified range. The firmware provides the
>> +		range of values within a specified range.
>> +
>> +Other required properties for all clocks(all from common clock binding):
>> +- #clock-cells : should be set to 1 as each of the SCPI clocks have multiple
>> +	outputs.
>
> Could you change this to:
>
> #clock-cells: Should be 1. Contains the Clock ID value used by SCPI
>                commands.
>

Changed now.

> That will make it clear what value should be used when writing a dts
> (the raw value commands use, as opposed to some logical abstraction
> thereof).
>

Agreed.

> With that:
>
> Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>

Thanks.

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
