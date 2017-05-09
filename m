From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] Documentation: devicetree: add bindings to support
 ARM MHU subchannels
Date: Tue, 9 May 2017 16:01:55 +0530
Message-ID: <CABb+yY1S_aRGDZJwVt+p7U6PcO2dQGsg5bi21-yvx715HGjUtw@mail.gmail.com>
References: <1493733353-25812-1-git-send-email-sudeep.holla@arm.com>
 <1493733353-25812-3-git-send-email-sudeep.holla@arm.com> <20170508161026.5vdqnv52ub7hurwf@rob-hp-laptop>
 <CABb+yY1+rU=gEnqML=ybZ61WDW6Brz_QLw4LpYNNe-XsEgi8dw@mail.gmail.com>
 <ff6535ec-fa31-e0b7-53a1-9f4a2f03693d@arm.com> <CABb+yY3tXMgQdQratM56mQVEV4Med1i0NyT=zkXk1P4oCao6+A@mail.gmail.com>
 <ec7869d0-fa18-ec9e-3df7-ac841e06b2d1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ec7869d0-fa18-ec9e-3df7-ac841e06b2d1-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 9, 2017 at 3:28 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:

>>
>> If it is still not clear, please share your client driver. I will
>> adapt that to work with existing MHU driver & bindings.
>>
>
> Just take example of SCPI in the mainline. Assume there's another
> protocol SCMI which uses few more bits in the same channel and the
> remote firmware implements both but both are totally independent and not
> related/linked. Also be keep in mind that SCPI is used by other
> platforms and so will be the new protocol. We simply make SCPI or SCMI
> bindings aligned to ARM MHU. That's ruled out.
>
Not sure what you mean by "that's ruled out". Anyways, to be clear,
the bindings must remain same as long as the h/w doesn't change. It is
the client driver (DT node) that should be versioned for SCPI or SCMI
based on what the platform supports.

I have tried many ways to explain how to implement it and apparently
failed. So lets talk code.
You have already shared this "v2" MHU driver, now please also share
your client driver. I'll make it work with original MHU driver and
that should settle your confusion.

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
