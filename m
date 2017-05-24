From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Wed, 24 May 2017 16:26:13 +0530
Message-ID: <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw@mail.gmail.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495621003-4291-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 24, 2017 at 3:46 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
>
> Hi,
>
> This series adds doorbell support to ARM MHU mailbox controller driver.
> Since we need to callback the different client based on the doorbel bits
> triggered from the remote, we can manage with single channel for the set
> of 32 doorbells.
>
> Regards,
> Sudeep
>
> v1->v2:
>         - Removed the notion od subchannels
>         - Treat each bit in the MHU register as a doorbell and hence
>           different channel with respect to mailbox framework
>
Whatever happened to the endless explanations I gave you, how the MHU
driver already supports your usecase?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
