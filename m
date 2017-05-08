From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Mon, 8 May 2017 22:16:06 +0530
Message-ID: <CABb+yY1+rU=gEnqML=ybZ61WDW6Brz_QLw4LpYNNe-XsEgi8dw@mail.gmail.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com> <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 8, 2017 at 9:40 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> +Bjorn
>
> On Tue, May 02, 2017 at 02:55:49PM +0100, Sudeep Holla wrote:
>> The ARM MHU has mechanism to assert interrupt signals to facilitate
>> inter-processor message based communication. It drives the signal using
>> a 32-bit register, with all 32-bits logically ORed together. It also
>> enables software to set, clear and check the status of each of the bits
>> of this register independently. Each bit of the register can be
>> associated with a type of event that can contribute to raising the
>> interrupt thereby allowing it to be used as independent subchannels.
>>
>> Since the first version of this binding can't support sub-channels,
>> this patch extends the existing binding to support them.
>>
>> Cc: Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
>> Cc: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mailbox/arm-mhu.txt        | 44 ++++++++++++++++++++--
>>  1 file changed, 41 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> index 4971f03f0b33..86a66f7918e2 100644
>> --- a/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> +++ b/Documentation/devicetree/bindings/mailbox/arm-mhu.txt
>> @@ -10,21 +10,40 @@ STAT register and the remote clears it after having read the data.
>>  The last channel is specified to be a 'Secure' resource, hence can't be
>>  used by Linux running NS.
>>
>> +The MHU drives the interrupt signal using a 32-bit register, with all
>> +32-bits logically ORed together. It provides a set of registers to
>> +enable software to set, clear and check the status of each of the bits
>> +of this register independently. The use of 32 bits per interrupt line
>> +enables software to provide more information about the source of the
>> +interrupt. For example, each bit of the register can be associated with
>> +a type of event that can contribute to raising the interrupt.
>
> Sounds like a doorbell? (i.e. a single bit mailbox). Bjorn is doing
> something similar for QCom h/w. I guess the difference here is you have
> 32 sources and 1 output. It seems to me these should be described
> similarly.
>
Yes, QCom controller triggers different interrupt for each bit of a
32bits register i.e, each signal is associated with 1bit information.
Whereas MHU signals 32bits at a time to the target cpu.
  Both these cases are already supported by mailbox framework, so
Bjorn has implemented QCom's 'doorbell' driver over mailbox api. And
we can do without this "arm,mhu-v2" driver. I believe Sudeep already
knows well how to use the MHU driver as such to get what his client
drivers need.

>> +
>>  Mailbox Device Node:
>>  ====================
>>
>>  Required properties:
>>  --------------------
>> -- compatible:                Shall be "arm,mhu" & "arm,primecell"
>> +- compatible:                Shall be "arm,primecell" and one of the below:
>> +                     "arm,mhu" - if the controller doesn't support
>> +                                 subchannels
>> +                     "arm,mhu-v2" - if the controller supports subchannels
>
> How do I know if I have v2? This correlates to an IP version or
> IP configuration or ?
>
This is purely a software concept - virtual channel. There are only 3
physical channels and that are managed by existing version of driver &
bindings. This is another reason I am against this patchset.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
