From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 14/19] ARM: dts: shmobile/r8a7xxx: replace
 gpio-key,wakeup with wakeup-source property
Date: Fri, 23 Oct 2015 09:18:51 +0900
Message-ID: <20151023001851.GA15844@verge.net.au>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-15-git-send-email-sudeep.holla@arm.com>
 <CAMuHMdXpY7gSOPAGxh9Z_LurpL392y7Vx0pBe-FqfauXjVnMFQ@mail.gmail.com>
 <56276787.6090900@arm.com>
 <20151022005051.GD8879@verge.net.au>
 <5628AE72.3020809@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5628AE72.3020809-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 10:37:54AM +0100, Sudeep Holla wrote:
> 
> 
> On 22/10/15 01:50, Simon Horman wrote:
> >On Wed, Oct 21, 2015 at 11:23:03AM +0100, Sudeep Holla wrote:
> >>
> >>
> >>On 21/10/15 11:18, Geert Uytterhoeven wrote:
> >>>On Wed, Oct 21, 2015 at 12:10 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> >>>>Though the keyboard driver for GPIO buttons(gpio-keys) will continue to
> >>>>check for/support the legacy "gpio-key,wakeup" boolean property to
> >>>>enable gpio buttons as wakeup source, "wakeup-source" is the new
> >>>>standard binding.
> >>>>
> >>>>This patch replaces the legacy "gpio-key,wakeup" with the unified
> >>>>"wakeup-source" property in order to avoid any futher copy-paste
> >>>>duplication.
> >>>
> >>>Thanks!
> >>>
> >>>I made the same changes to my local tree a few weeks ago, but never found
> >>>time to send them out...
> >>>
> >>
> >>Ah OK, even I had these changes for long. I waited until I fixed all the
> >>binding documents(which was boring ;))
> >>
> >>>>Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> >>>>Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>>>Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>>>Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> >>>
> >>>Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >
> >Can I clarify that you would like me to pick up this patch?
> >If so I'm happy to do so.
> >
> 
> Yes you can pick up this patch as it has no dependency on driver changes.

Thanks, I have queued this up for v4.5.

It should appear in the devel branch of the renesas tree some time today.
I will include it in the next branch, which is included in the linux-next
tree, once v4.4-rc1 has been released.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
