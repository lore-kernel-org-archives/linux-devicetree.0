From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/6] Documentation: devicetree: add bindings to support
 ARM MHU doorbells
Date: Thu, 6 Jul 2017 10:18:39 +0100
Message-ID: <1e1fc7b3-ba5a-da30-a601-3b79122ff959@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <1495621003-4291-3-git-send-email-sudeep.holla@arm.com>
 <CABb+yY0gXDEfoRmfHPOoEKgGjp_e5B5orYZ2qjcypL7ven50hw@mail.gmail.com>
 <e85c913d-0188-8780-9ea6-c82849e87d58@arm.com>
 <20170531170801.u6d4fhsfu5mmqgta@rob-hp-laptop>
 <CABb+yY1mA5Hzce5c5JGVtqmRjoTBj=YTZcajVpANq1oQP0Gc0A@mail.gmail.com>
 <9a38040c-8062-870e-ab2a-beb4934428b3@arm.com>
 <73cf3d55-f2ec-eb15-746a-0db5e7e28dad@arm.com>
 <CABb+yY04F0zuiD8iW=m2wPCqftoe+VmcGzzRCXp184JKr25KPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY04F0zuiD8iW=m2wPCqftoe+VmcGzzRCXp184JKr25KPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 06/07/17 07:28, Jassi Brar wrote:
> On Wed, Jul 5, 2017 at 11:32 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> 
>>
>> I have posted the SCMI patches now[1],
>>
> I wish I was CC'ed on that. Now LKML seems too busy to forward it.
> 

Yes, my mistake, I should have cc-ed you.

>> please let me know how to get
>> both SCPI and SCMI working together with different doorbell bits on the
>> same channel.
>>
> You say in the cover letter :
> "Let me begin admitting that we are introducing yet another protocol to
> achieve same things as many existing protocols like ARM SCPI, TI SCI,
> QCOM RPM, Nvidia Tegra BPMP, and so on"
> 
>  So SCMI is supposed to replace SCPI, SCI, RPM and BPMP   or   SCMI is
> to be used for future platforms.
> If SCPI and SCMI achieve the same, why have them both active simultaneously?
> 

Yes it may not be used, but the firmware might support both for backward
compatibility. E.g. on Juno, we still may continue supporting SCPI while
we transition to SCMI. So both old and new DTs must work.

> Assuming there really is some sane excuse :-

Yes as I mentioned above.

>     SCPI and SCMI are two separate client working over an MHU channel.
> So, as is the case with users relying on a common resource, you need a
> shim arbitrator that serialises access to the resource.>

Yes, that's what I have done with this series of patches retaining the
backward compatibility. I have made it generic to ARM MHU instead of
specifically addressing couple of protocols on a particular platform.

If I try to come up with an additional shim driver, I bet it will become
much ugly, bigger and platform specific.

The specification of MHU mentions on how to use it as doorbell bit and I
am doing that to provide cleaner and generic solution which I you seem
to disagree with. So please suggest/provide alternative solution.

A shim layer may get complicated as both SCMI and SCPI will call
standard mailbox APIs. Do you mean I need to replace those calls with
shim layer API ? If I do that it may break on other platforms which are
using SCPI.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
