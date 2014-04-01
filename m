From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [git pull] Devicetree changes for v3.15
Date: Tue, 1 Apr 2014 15:18:36 -0500
Message-ID: <CAL_JsqKyLPa9PhNbzda1iPyLjfvQpsUMLR7sGRegYmLsrkY-LQ@mail.gmail.com>
References: <CACxGe6vCrkHPL6UNy1p8AO4+z5VFRY6w4_2grQEZQwp_3jJ7Yw@mail.gmail.com>
	<1396381357.23763.16.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396381357.23763.16.camel@x220>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 1, 2014 at 2:42 PM, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
> On Tue, 2014-04-01 at 11:15 +0100, Grant Likely wrote:
>> Grant Likely (13):
>>       [...]
>>       of: remove /proc/device-tree
>
> That commit leaves a select for PROC_DEVICETREE dangling. See "config
> ARCH_OMAP2PLUS" in arch/arm/mach-omap2/Kconfig. Can that select
> statement just be dropped now or is something more elaborate needed?

Yes, it can and should be dropped. It never should have been there to
begin with. It should be a user selectable option, not a platform
selection.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
