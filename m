From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 16/22] firmware: arm_scmi: add arm_mhu specific mailbox interface
Date: Fri, 13 Oct 2017 20:49:13 +0530
Message-ID: <CABb+yY3_FnckLSnGS5P5z1U-vukSrRz7RSXpJ6nxYL6B6itrZw@mail.gmail.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com>
 <1506604306-20739-17-git-send-email-sudeep.holla@arm.com> <CAK8P3a0XmiXqZ-z7WV+nk7B86p23Jmf31Q=pVovXVebhA28_0Q@mail.gmail.com>
 <CABb+yY1N6hmC6Kd2QteMw_oCf=-mYHf7p6RdhYPQK+QUO7VP4A@mail.gmail.com>
 <f142dac2-a27c-4c46-4d22-4df4f2e8cfb1@arm.com> <CABb+yY1w358uw2EoeioAvZy06LTuOO0krGFFXoQSNAR5m5ANmQ@mail.gmail.com>
 <25023d1a-a221-b131-5a1e-7d909b006d1b@arm.com> <CAOCOHw54mQUVxVyLRWbV5Ty7trK99MM6zgXsuuxQEHnD3qvKVA@mail.gmail.com>
 <0b65a3fd-32ff-f708-7dce-8e3a5cabf908@arm.com> <CABb+yY0HxvLs51PmB7K-T2pp+OJE8ckiBAdBa=ss2rfUes=u2A@mail.gmail.com>
 <94004135-8ce2-8006-21f6-f8d219c0430d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <94004135-8ce2-8006-21f6-f8d219c0430d-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 13, 2017 at 8:17 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> On 13/10/17 15:12, Jassi Brar wrote:
>
>> In MHU the 32bits are tied together and all go to one target
>> processor. Whereas on QCom, each bit corresponds to independent signal
>> going to a different target processor.
>>
>
> I was not aware of that. Thanks for clarifying the differences.
>
>> IOW, QCom has 32 channels per register whereas MHU has one. The
>
> OK, that depends on how we consider it. As you said yes it just goes to
> single target processor, but hardware designers consider it still 32
> channels are they can be controller independently without any locking.
>
MHU spec says it has three channels.
Locking is not a criterion for a channel. A signal and associated data
transfer defines a channel.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
