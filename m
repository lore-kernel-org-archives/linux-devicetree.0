From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 15/22] firmware: arm_scmi: abstract mailbox interface
Date: Fri, 6 Oct 2017 17:04:01 +0530
Message-ID: <CABb+yY0SmQaPgBxan44a_Sx2mFuuiPcMz41J1yjqfO5irPTYig@mail.gmail.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-16-git-send-email-sudeep.holla@arm.com> <CAK8P3a0EUr_aEZdOrjHixzp44yXqsNxTMzBceSBTmk-x8x2MAg@mail.gmail.com>
 <f316b938-c6d5-3aa9-4f03-6b5c6ad4bfa7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f316b938-c6d5-3aa9-4f03-6b5c6ad4bfa7-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 4, 2017 at 5:02 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:

> Also, I have added shim only for specific controllers that need them.
> E.g. ARM MHU as Jassi disagreed to add doorbell mechanism to that.
> mbox_if provides default implementation that just calls direct mailbox
> APIs.
>
Yeah you could hack away the MHU driver to make your life easy at the
cost of duplicated code and extra DT bindings, but for a moment think
what if your development platform wasn't MHU but, say, Rockchip
mailbox controller?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
