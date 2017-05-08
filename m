From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Mon, 8 May 2017 17:53:24 +0100
Message-ID: <993d6114-e996-3953-03ec-fe5f02ee393a@arm.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com>
 <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 08/05/17 17:10, Rob Herring wrote:
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

Indeed single bit doorbell, but 32 of them joined together.
OK, I will have a look at that Bjorn series.

>> +
>>  Mailbox Device Node:
>>  ====================
>>  
>>  Required properties:
>>  --------------------
>> -- compatible:		Shall be "arm,mhu" & "arm,primecell"
>> +- compatible:		Shall be "arm,primecell" and one of the below:
>> +			"arm,mhu" - if the controller doesn't support
>> +				    subchannels
>> +			"arm,mhu-v2" - if the controller supports subchannels
> 
> How do I know if I have v2? This correlates to an IP version or 
> IP configuration or ?
> 

No, it's the same IP, just that initial binding was pushed not to
support the single bit doorbell functionality of the IP. Jassi was/is
against that. I have just quoted the specification above.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
