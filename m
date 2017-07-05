From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Wed, 5 Jul 2017 19:02:10 +0100
Message-ID: <73cf3d55-f2ec-eb15-746a-0db5e7e28dad@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com>
 <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
 <e85c913d-0188-8780-9ea6-c82849e87d58@arm.com>
 <20170531170801.u6d4fhsfu5mmqgta@rob-hp-laptop>
 <CABb+yY1mA5Hzce5c5JGVtqmRjoTBj=YTZcajVpANq1oQP0Gc0A@mail.gmail.com>
 <9a38040c-8062-870e-ab2a-beb4934428b3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9a38040c-8062-870e-ab2a-beb4934428b3-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 02/06/17 10:32, Sudeep Holla wrote:
> 
> 
> On 02/06/17 06:45, Jassi Brar wrote:
>> Hi Rob,
>>
>> On Wed, May 31, 2017 at 10:38 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Thu, May 25, 2017 at 02:23:44PM +0100, Sudeep Holla wrote:
>>>>
>>>>>>  .../devicetree/bindings/mailbox/arm-mhu.txt        | 46 ++++++++++++++++++++--
>>>>>>  1 file changed, 43 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>>>>>> index 4971f03f0b33..bd9a3a267caf 100644
>>>>>> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>>>>>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>>>>>> @@ -10,21 +10,42 @@ STAT register and the remote clears it after having read the data.
>>>>>>  The last channel is specified to be a 'Secure' resource, hence can't be
>>>>>>  used by Linux running NS.
>>>>>>
>>>>>> +The MHU drives the interrupt signal using a 32-bit register, with all
>>>>>> +32-bits logically ORed together. It provides a set of registers to
>>>>>> +enable software to set, clear and check the status of each of the bits
>>>>>> +of this register independently. The use of 32 bits per interrupt line
>>>>>> +enables software to provide more information about the source of the
>>>>>> +interrupt. For example, each bit of the register can be associated with
>>>>>> +a type of event that can contribute to raising the interrupt. Each of
>>>>>> +the 32-bits can be used as "doorbell" to alert the remote processor.
>>>>>> +
>>>>>>  Mailbox Device Node:
>>>>>>  ====================
>>>>>>
>>>>>>  Required properties:
>>>>>>  --------------------
>>>>>> -- compatible:          Shall be "arm,mhu" & "arm,primecell"
>>>>>> +- compatible:          Shall be "arm,primecell" and one of the below:
>>>>>> +                       "arm,mhu" - if the controller doesn't support
>>>>>> +                                   doorbell model
>>>>>> +                       "arm,mhu-doorbell" - if the controller supports
>>>>>> +                                   doorbell model
>>>>>>  - reg:                 Contains the mailbox register address range (base
>>>>>>                         address and length)
>>>>>> -- #mbox-cells          Shall be 1 - the index of the channel needed.
>>>>>> +- #mbox-cells          Shall be 1 - the index of the channel needed when
>>>>>> +                       compatible is "arm,mhu"
>>>>>> +                       Shall be 2 - the index of the channel needed, and
>>>>>> +                       the index of the doorbell bit with the channel when
>>>>>> +                       compatible is "arm,mhu-doorbell"
>>>>>>  - interrupts:          Contains the interrupt information corresponding to
>>>>>> -                       each of the 3 links of MHU.
>>>>>> +                       each of the 3 physical channels of MHU namely low
>>>>>> +                       priority non-secure, high priority non-secure and
>>>>>> +                       secure channels.
>>>>>>
>>>>>>  Example:
>>>>>>  --------
>>>>>>
>>>>>> +1. Controller which doesn't support doorbells
>>>>>> +
>>>>>>         mhu: mailbox@2b1f0000 {
>>>>>>                 #mbox-cells = <1>;
>>>>>>                 compatible = "arm,mhu", "arm,primecell";
>>>>>> @@ -41,3 +62,22 @@ used by Linux running NS.
>>>>>>                 reg = <0 0x2e000000 0x4000>;
>>>>>>                 mboxes = <&mhu 1>; /* HP-NonSecure */
>>>>>>         };
>>>>>> +
>>>>>> +2. Controller which supports doorbells
>>>>>> +
>>>>>> +       mhu: mailbox@2b1f0000 {
>>>>>> +               #mbox-cells = <2>;
>>>>>> +               compatible = "arm,mhu-doorbell", "arm,primecell";
>>>>>> +               reg = <0 0x2b1f0000 0x1000>;
>>>>>> +               interrupts = <0 36 4>, /* LP-NonSecure */
>>>>>> +                            <0 35 4>, /* HP-NonSecure */
>>>>>> +                            <0 37 4>; /* Secure */
>>>>>> +               clocks = <&clock 0 2 1>;
>>>>>> +               clock-names = "apb_pclk";
>>>>>> +       };
>>>>>> +
>>>>>> +       mhu_client: scb@2e000000 {
>>>>>> +               compatible = "arm,scpi";
>>>>>> +               reg = <0 0x2e000000 0x200>;
>>>>>> +               mboxes = <&mhu 1 4>; /* HP-NonSecure 5th doorbell bit */
>>>>>> +       };
>>>>>>
>>>>> Every MHU controller can by driven as "arm,mhu-doorbell" or "arm,mhu"
>>>>> equally fine. So you are basically smuggling a s/w feature into DT.
>>>>>
>>>>
>>>> I disagree, the spec clearly says each bit can be used for different
>>>> event and hence we need a way to specify that in DT when used as doorbell.
>>>
>>> I think the point is that you should not continue to use both. The
>>>
>> FYKI my point (here and in other threads) is that current MHU
>> driver/bindings can very well support Sudeep's usecase.
>>
>>> single cell usage should be deprecated. Maybe you'll have to encode the
>>> 2nd cell when not used as 0 means bit 0?
>>>
>>> Arguably, you don't even need a new compatible. #mbox-cells tells you
>>> whether to use the old or new binding. I'm fine either way though.
>>>
>> In mailbox terminology, there is a channel and command(s) that we
>> send/recv over it. OOB data passing is optional.
>>
>> MHU driver accepts a command as a u32. Sudeep's usecase has commands
>> of the form of BIT(x)  ... an instance of u32.
>>
> 
> Again read the spec, it is designed to be used as doorbell
> 
>> Instead of having his client driver pass BIT(x) like other MHU
> 
> Client is generic and doesn't understand which controller it's working
> with. It's not custom protocol. I have given enough links and details to
> say it's generic protocol adapted by other vendors.
> 
>> clients, he wants to modify the driver and bindings to specify 'x' via
>> second cell of mboxes.  That would have made sense (and already
>> implemented) if the controller could send only 1 bit at a time and
>> every client/protocol used exactly 1 command - both of which are not
>> true.
> 
> Yes but the controller is designed to provide single bit doorbell
> capability. Please understand that instead of pushing how you think it
> needs to work.
> 
>>
>> I even offered Sudeep to share his client driver and I'll adapt it for
>> him, but her refuses to either see my point or share his code.
>>
> 
> You have not answered my queries, you keep telling I can help but never
> read and answer what I ask. Also I have told you the driver is in
> mainline(drivers/firmware/arm_scpi.c) and there will be another similar
> one. And theres are used by different platforms with different mailbox
> controllers.
> Please post patches to make 2 different protocols like SCPI work. Please
> note these protocols are used by other platforms which have different
> controllers.
> 

I have posted the SCMI patches now[1], please let me know how to get
both SCPI and SCMI working together with different doorbell bits on the
same channel.

-- 
Regards,
Sudeep

[1] http://marc.info/?l=devicetree&m=149849482623492&w=2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
