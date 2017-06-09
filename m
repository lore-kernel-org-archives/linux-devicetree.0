From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 0/3] Support for USB DRD PHY driver for NS2
Date: Fri, 9 Jun 2017 16:46:15 +0530
Message-ID: <03f87297-a986-ac9d-b20b-0f75abcc12f7@ti.com>
References: <1496918103-14948-1-git-send-email-raviteja.garimella@broadcom.com>
 <a5344bd7-f7b1-90b5-cce1-d513370103e5@ti.com>
 <CAEHZuqNwPBgWM9mAeWTTQLQVJYjX8uNuUDRqsD_ZidgaSV9pcA@mail.gmail.com>
 <2f492d5a-9016-f965-8dc2-f669d785ba4d@ti.com>
 <CAEHZuqO3zquZokENqBLmcn1ZnSCYSYitCXmKrQ-v9HMB0gJrvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEHZuqO3zquZokENqBLmcn1ZnSCYSYitCXmKrQ-v9HMB0gJrvg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Friday 09 June 2017 04:23 PM, Raviteja Garimella wrote:
> Hi Kishon,
> 
> On Fri, Jun 9, 2017 at 2:36 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>> Hi,
>>
>> On Friday 09 June 2017 02:30 PM, Raviteja Garimella wrote:
>>> Hi,
>>>
>>> On Fri, Jun 9, 2017 at 2:25 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>>>> Hi,
>>>>
>>>> On Thursday 08 June 2017 04:05 PM, Raviteja Garimella wrote:
>>>>> Changes in v8:
>>>>> =============
>>>>> -Renamed phy shutdown routine
>>>>> -Used devm_request_irq in stead of threaded irq
>>>>
>>>> That's not what I intended. Continue to use threaded irq but remove delayed work.
>>>>
>>>
>>> Yes I get that. We see intermittent connection issues without delayed
>>> work. Debounce delay matters there.
>>
>> All right!
>>
>> I'm unable to apply the series. Please rebase to linux-phy next (directory
>> structure has changed)
>>
> 
> Ok. They got applied to linux-phy next for me without issues.
> I will resend the patchset anyways after rebasing to linux-phy next.

the patch you sent is not rebased to the latest linux-phy next.

-Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
