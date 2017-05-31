From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Wed, 31 May 2017 18:12:08 +0100
Message-ID: <b2a34dcc-215d-c9b4-7d78-3830f1769ad6@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com>
 <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
 <e85c913d-0188-8780-9ea6-c82849e87d58@arm.com>
 <20170531170801.u6d4fhsfu5mmqgta@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170531170801.u6d4fhsfu5mmqgta@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 31/05/17 18:08, Rob Herring wrote:
> On Thu, May 25, 2017 at 02:23:44PM +0100, Sudeep Holla wrote:
>>
>>
>> On 25/05/17 14:22, Jassi Brar wrote:

[...]

>>> Every MHU controller can by driven as "arm,mhu-doorbell" or "arm,mhu"
>>> equally fine. So you are basically smuggling a s/w feature into DT.
>>>
>>
>> I disagree, the spec clearly says each bit can be used for different
>> event and hence we need a way to specify that in DT when used as doorbell.
> 
> I think the point is that you should not continue to use both. The 
> single cell usage should be deprecated. Maybe you'll have to encode the 
> 2nd cell when not used as 0 means bit 0?
> 

Instead of having special encoding, I like your below suggestion on
using #mbox-cells to distinguish the usage modes.

> Arguably, you don't even need a new compatible. #mbox-cells tells you 
> whether to use the old or new binding. I'm fine either way though.
> 

Ah good point, yes we can distinguish with #mbox-cells. I will drop the
new compatible.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
