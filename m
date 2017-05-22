From: Marcin Nowakowski <marcin.nowakowski-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/21] MIPS memblock: Remove bootmem code and switch to
 NO_BOOTMEM
Date: Mon, 22 May 2017 14:19:09 +0200
Message-ID: <eeb52dd6-3fdd-01b9-6774-236ab50e3f4d@imgtec.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
 <be0b6614-708d-a32a-029d-7e606a673e5b@imgtec.com>
 <20170522102643.GA17763@mobilestation>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522102643.GA17763@mobilestation>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Serge,

On 22.05.2017 12:26, Serge Semin wrote:

> Regarding the patchset. I'm still pretty much eager to make it being
> part of kernel MIPS arch. But there was a problem I outlined
> in the patchset header message, which I can't fix by myself.
> Particulary It's connected with Loonson3 or SGI IP27 code alteration,
> so to make it free of ancient boot_mem_map dependencies (see the
> patchset header message). Without a help from someone, who has
> Loonson64 and SGI IP27 hardware and strong desire to make it free of
> old bootmem allocator, it is useless to make any progress from my
> side. That's why Ralf moved this email-thread into RFC actually.
> Anyway If either you or someone else has got such hardware and is
> interested in the cooperation, I'll be more than happy to push
> my efforts forward with this patchset contribution. But only after
> I got a bit less busy with my work. As I said it will happen within
> next 1-2 months. So do you have the hardware and desire to be part
> of this?

I should be able to update/test the changes on a Loongson64 platform.


Marcin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
