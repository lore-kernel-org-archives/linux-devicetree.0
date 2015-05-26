From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] mailbox: arm-mhu: update the binding document
Date: Tue, 26 May 2015 15:15:03 +0100
Message-ID: <55647FE7.2060300@arm.com>
References: <1430131945-20628-1-git-send-email-sudeep.holla@arm.com> <CAJe_ZhdirgXRjGOzUE4vux4ay=gL5FM7=t6m53bEN5ZND+LddQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJe_ZhdirgXRjGOzUE4vux4ay=gL5FM7=t6m53bEN5ZND+LddQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Devicetree List <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>
List-Id: devicetree@vger.kernel.org



On 19/05/15 15:42, Jassi Brar wrote:
> On 27 April 2015 at 16:22, Sudeep Holla <sudeep.holla@arm.com> wrote:
>> The initial version of the binding document pushed along with the driver
>> is not clear/explicit about couple of the required properties namely:
>> clocks and clock-names, though the AMBA primecell binding used by the
>> arm-mhu specifies them clearly. Without these property the driver will
>> not even get probed, so it is mandatory to have them in DT.
>>
>> This patch adds the above mentioned required properties to the binding.
>> It also adds the optional interrupt-names property which is good to have
>> along with some minor updates to replace references to the driver with
>> the hardware IP.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Jassi Brar <jaswinder.singh@linaro.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> ---
>>   .../devicetree/bindings/mailbox/arm-mhu.txt        | 29 ++++++++++++++--------
>>   1 file changed, 19 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> index 4971f03f0b33..68146c9a0332 100644
>> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> @@ -1,14 +1,15 @@
>> -ARM MHU Mailbox Driver
>> -======================
>> +ARM Message Handling Unit(MHU)
>> +==============================
>>
>> -The ARM's Message-Handling-Unit (MHU) is a mailbox controller that has
>> +The ARM's Message Handling Unit (MHU) is a mailbox controller that has
>>   3 independent channels/links to communicate with remote processor(s).
>> - MHU links are hardwired on a platform. A link raises interrupt for any
>> -received data. However, there is no specified way of knowing if the sent
>> -data has been read by the remote. This driver assumes the sender polls
>> -STAT register and the remote clears it after having read the data.
>> -The last channel is specified to be a 'Secure' resource, hence can't be
>> -used by Linux running NS.
>> +MHU links are hardwired on a platform. A link raises interrupt for any
>> +received data. The platform/firmware must clear the STAT register after
>> +having receiving the data and sender can poll on the same if the platform
>> +lacks interrupt mechanism for sending data to remote processor.
>> +
>> +Out of 3 channels, the last channel is 'Secure', hence must not be used
>> +by OS or any software running in non-secure state.
>>
>>   Mailbox Device Node:
>>   ====================
>> @@ -20,7 +21,15 @@ used by Linux running NS.
>>                          address and length)
>>   - #mbox-cells          Shall be 1 - the index of the channel needed.
>>   - interrupts:          Contains the interrupt information corresponding to
>> -                       each of the 3 links of MHU.
>> +                       each of the MHU links.
>> +- clocks               phandle to clock for apb pclk as specified in the
>> +                       primecell binding
>> +- clock-names          Shall be "apb_pclk"
>> +
> No other Primecell derivative specify 'apb_pclk' ... because people do
> know that before mailbox its a an AMBA Primecell class device so its
> implied that you look at Primecell bindings.  It doesn't hurt to
> mention it here again, but it's definitely not worth the alarm you
> have been raising.
>

IMO it's better to mention it here explicitly or at-least pointer to
primecell binding document.

>> +Optional properties:
>> +--------------------
>> +- interrupt-names      contains names of the interrupt in the order in which
>> +                       they were specified in the interrupts property
>>
> Nopes. arm_mhu.c shouldn't need to have OF dependency.
> amba_device.irq[] is good enough just like for other amba drivers.
>

In general, these supplemental names properties are optional but
recommended and are useful. I don't understand what you mean by OF
dependency in arm_mhu above. We are already using OF ?

There can be a device(despite how crazy that sounds or may be a silicon
bug) not implementing one of the Rx interrupts but implementing one of
the Tx interrupts. I was just trying to make sure we make binding as
good as possible reusing the existing properties. We need not worry
about breaking any working system in future if we decide to use this.

> And the change in documentation above is an unnecessary trainwreck. It
> 'fixes' nothing, just changes wordings to your taste.
>

Ok, sorry for the trouble if you think so.

Regards,
Sudeep
