From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC PATCH 1/8] Documentation: add DT binding for ARM System
 Control and Management Interface(SCMI) protocol
Date: Fri, 9 Jun 2017 16:50:21 +0100
Message-ID: <36fb6868-18ef-d1ce-de83-008da8d454e4@arm.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
 <1496851812-19623-2-git-send-email-sudeep.holla@arm.com>
 <20170609141632.eni4k3c4aiyvbkfk@rob-hp-laptop>
 <8d17f317-510c-b98e-4c42-c4ad2a8f0c63@arm.com>
 <CAL_JsqJK9Wkr-x2RbgGfqSDfK7b21MQAaWwONfVwQV8eHAm+qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJK9Wkr-x2RbgGfqSDfK7b21MQAaWwONfVwQV8eHAm+qg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 09/06/17 16:39, Rob Herring wrote:
> On Fri, Jun 9, 2017 at 9:47 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>>
>>
>> On 09/06/17 15:16, Rob Herring wrote:
>>> On Wed, Jun 07, 2017 at 05:10:05PM +0100, Sudeep Holla wrote:
>>>> This patch adds devicetree binding for System Control and Management
>>>> Interface (SCMI) Message Protocol used between the Application Cores(AP)
>>>> and the System Control Processor(SCP). The MHU peripheral provides a
>>>> mechanism for inter-processor communication between SCP's M3 processor
>>>> and AP.
>>>>
>>>> SCP offers control and management of the core/cluster power states,
>>>> various power domain DVFS including the core/cluster, certain system
>>>> clocks configuration, thermal sensors and many others.
>>>>
>>>> SCMI protocol is developed as better replacement to the existing SCPI
>>>> which is not flexible and easily extensible.
>>>>
>>>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>>>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/arm/arm,scmi.txt | 193 +++++++++++++++++++++
>>>>  1 file changed, 193 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/arm/arm,scmi.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/arm,scmi.txt b/Documentation/devicetree/bindings/arm/arm,scmi.txt
>>>> new file mode 100644
>>>> index 000000000000..d6e4b7eff199
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/arm/arm,scmi.txt
>>>> @@ -0,0 +1,193 @@
>>>> +System Control and Management Interface (SCMI) Message Protocol
>>>> +----------------------------------------------------------
>>>> +
>>>> +The SCMI is intended to allow agents such as OSPM to manage various functions
>>>> +that are provided by the hardware platform it is running on, including power
>>>> +and performance functions.
>>>> +
>>>> +This binding is intended to define the interface the firmware implementing
>>>> +the SCMI as described in ARM document number ARM DUI 0922B ("ARM System Control
>>>> +and Management Interface Platform Design Document")[0] provide for OSPM in
>>>> +the device tree.
>>>> +
>>>> +Required properties:
>>>> +
>>>> +- compatible : shall be "arm,scmi"
>>>
>>> Convince me that this genericish string is specific enough.
>>>
>>
>> Now that you raised this point, I think we generate so many 4 letter
>> acronyms that it can collide. How about "arm,sys-ctl-mgmt-if"
> 
> I was more concerned about needing versioning or vendor specific
> compatible strings that we needed with SCPI. Is there a spec version
> or is that discoverable?
> 

Ah ok, it's discoverable and each protocol must implement
PROTOCOL_VERSION. We have specification version implemented, vendor id
and firmware implementation version all of which is mandatory.

>>>> +- method : The method of calling the SCMI firmware. Only permitted value
>>>> +       currently is:
>>>> +       "mailbox-doorbell" : When mailbox doorbell is used as a mechanism
>>>> +                            to alert the presence of a messages and/or
>>>> +                            notification
>>>> +- mboxes: List of phandle and mailbox channel specifiers. It should contain
>>>> +      exactly one or two mailboxes, one for transmitting messages("tx")
>>>> +      and another optional for receiving the notifications("rx") if
>>>> +      supported.
>>>> +- mbox-names: shall be "tx" or "rx"
>>>
>>> ...and optionally "rx"
>>>
>>
>> OK
>>
>>>> +- shmem : List of phandle pointing to the shared memory(SHM) area between the
>>>> +      processors using these mailboxes for IPC, one for each mailbox
>>>> +      SHM can be any memory reserved for the purpose of this communication
>>>> +      between the processors.
>>>
>>> Maybe the mailbox binding should have a standard property for this?
>>>
>>
>> Do you mean as part of it's client binding ? If so, agreed. I can come
>> up with that proposal.
> 
> Yes.

Thanks, will do.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
