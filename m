From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Thu, 25 May 2017 17:04:39 +0100
Message-ID: <5c8e93a1-8090-0d4c-c689-cb8695361f9c@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com>
 <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org



On 25/05/17 14:22, Jassi Brar wrote:
> On Wed, May 24, 2017 at 3:46 PM, Sudeep Holla <sudeep.holla@arm.com> wrote:
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
>> Cc: Alexey Klimov <alexey.klimov@arm.com>
>> Cc: Jassi Brar <jaswinder.singh@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
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

I have asked many times now, please explain how would you handle
multiple protocol on a single set of MHU registers.

BIT(0) - SCPI protocol
BIT(1) - SCMI (general)
BIT(2) - SCMI (notification)
BIT(3) - A totally new protocol
:
:
with each of the above with specific shared memory reserved for them.

I know you suggested to pass the values from DT, but that sounds
much horrible than sanely describing the bits as individual doorbells.
And also have that value as part of any protocol also makes no sense
as it's not clearly part of that protocol spec.

Further, we need another layer of indirection. All these protocol
will mbox_request_channel to start with as they need to be generic.
How do you propose to mux multiple requests of these into arm_mhu ?

Rob,

Do you have any objections to specify the doorbell bits in the mailbox
controller as opposed to client sending that value as some magic value ?

-- 
Regards,
Sudeep
