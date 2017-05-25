From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Thu, 25 May 2017 14:23:44 +0100
Message-ID: <e85c913d-0188-8780-9ea6-c82849e87d58@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com>
 <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 25/05/17 14:22, Jassi Brar wrote:
> On Wed, May 24, 2017 at 3:46 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>> The ARM MHU has mechanism to assert interrupt signals to facilitate
>> inter-processor message based communication. It drives the signal using
>> a 32-bit register, with all 32-bits logically ORed together. It also
>> enables software to set, clear and check the status of each of the bits
>> of this register independently. Each bit of the register can be
>> associated with a type of event that can contribute to raising the
>> interrupt thereby allowing it to be used as independent doorbells.
>>
>> Since the first version of this binding can't support doorbells,
>> this patch extends the existing binding to support them.
>>
>> Cc: Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
>> Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mailbox/arm-mhu.txt        | 46 ++++++++++++++++++++--
>>  1 file changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> index 4971f03f0b33..bd9a3a267caf 100644
>> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> @@ -10,21 +10,42 @@ STAT register and the remote clears it after having read the data.
>>  The last channel is specified to be a 'Secure' resource, hence can't be
>>  used by Linux running NS.
>>
>> +The MHU drives the interrupt signal using a 32-bit register, with all
>> +32-bits logically ORed together. It provides a set of registers to
>> +enable software to set, clear and check the status of each of the bits
>> +of this register independently. The use of 32 bits per interrupt line
>> +enables software to provide more information about the source of the
>> +interrupt. For example, each bit of the register can be associated with
>> +a type of event that can contribute to raising the interrupt. Each of
>> +the 32-bits can be used as "doorbell" to alert the remote processor.
>> +
>>  Mailbox Device Node:
>>  ====================
>>
>>  Required properties:
>>  --------------------
>> -- compatible:          Shall be "arm,mhu" & "arm,primecell"
>> +- compatible:          Shall be "arm,primecell" and one of the below:
>> +                       "arm,mhu" - if the controller doesn't support
>> +                                   doorbell model
>> +                       "arm,mhu-doorbell" - if the controller supports
>> +                                   doorbell model
>>  - reg:                 Contains the mailbox register address range (base
>>                         address and length)
>> -- #mbox-cells          Shall be 1 - the index of the channel needed.
>> +- #mbox-cells          Shall be 1 - the index of the channel needed when
>> +                       compatible is "arm,mhu"
>> +                       Shall be 2 - the index of the channel needed, and
>> +                       the index of the doorbell bit with the channel when
>> +                       compatible is "arm,mhu-doorbell"
>>  - interrupts:          Contains the interrupt information corresponding to
>> -                       each of the 3 links of MHU.
>> +                       each of the 3 physical channels of MHU namely low
>> +                       priority non-secure, high priority non-secure and
>> +                       secure channels.
>>
>>  Example:
>>  --------
>>
>> +1. Controller which doesn't support doorbells
>> +
>>         mhu: mailbox@2b1f0000 {
>>                 #mbox-cells = <1>;
>>                 compatible = "arm,mhu", "arm,primecell";
>> @@ -41,3 +62,22 @@ used by Linux running NS.
>>                 reg = <0 0x2e000000 0x4000>;
>>                 mboxes = <&mhu 1>; /* HP-NonSecure */
>>         };
>> +
>> +2. Controller which supports doorbells
>> +
>> +       mhu: mailbox@2b1f0000 {
>> +               #mbox-cells = <2>;
>> +               compatible = "arm,mhu-doorbell", "arm,primecell";
>> +               reg = <0 0x2b1f0000 0x1000>;
>> +               interrupts = <0 36 4>, /* LP-NonSecure */
>> +                            <0 35 4>, /* HP-NonSecure */
>> +                            <0 37 4>; /* Secure */
>> +               clocks = <&clock 0 2 1>;
>> +               clock-names = "apb_pclk";
>> +       };
>> +
>> +       mhu_client: scb@2e000000 {
>> +               compatible = "arm,scpi";
>> +               reg = <0 0x2e000000 0x200>;
>> +               mboxes = <&mhu 1 4>; /* HP-NonSecure 5th doorbell bit */
>> +       };
>>
> Every MHU controller can by driven as "arm,mhu-doorbell" or "arm,mhu"
> equally fine. So you are basically smuggling a s/w feature into DT.
> 

I disagree, the spec clearly says each bit can be used for different
event and hence we need a way to specify that in DT when used as doorbell.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
