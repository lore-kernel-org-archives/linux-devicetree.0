From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v2 3/6] mailbox: Add support for ST's Mailbox IP
Date: Thu, 30 Jul 2015 14:48:42 +0200
Message-ID: <1438260522.25464.12.camel@tiscali.nl>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
	 <1437990272-23111-4-git-send-email-lee.jones@linaro.org>
	 <1438121215.30903.27.camel@tiscali.nl> <20150730114545.GG14642@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150730114545.GG14642@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On do, 2015-07-30 at 12:45 +0100, Lee Jones wrote:
> On Wed, 29 Jul 2015, Paul Bolle wrote:
> > Besides, if I read sti_max_probe() correctly, without OF support
> > loading
> > this module won't accomplish much. So what would another way of
> > autoloading this module buy you?
> 
> I think this line can be safely removed.

Looking at this patch a little more I notice there's no line reading
     MODULE_DEVICE_TABLE(of, sti_mailbox_match);

The three mailbox drivers that currently support OF do have such a line.
So "another way of autoloading" was rather sloppy as now I don't see how
this driver, if build as a module, will get auto-loaded. Maybe there's
an auto-loading mechanism that I'm not aware of here. Or perhaps auto
-loading is not needed.

Similar question for patch 5/6 and the lack of a line reading
    MODULE_DEVICE_TABLE(of, mbox_test_match);

Thanks,


Paul Bolle
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
