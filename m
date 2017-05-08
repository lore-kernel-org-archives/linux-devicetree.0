From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Date: Mon, 8 May 2017 12:17:02 +0530
Message-ID: <CABb+yY3CfWFBDh-qoGHDeHyLhVC7mPQZFB=VDS54OaypG-BqPw@mail.gmail.com>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org> <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux> <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org> <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux> <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
 <20170508055439.GJ15143@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170508055439.GJ15143@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 8, 2017 at 11:24 AM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri 05 May 21:48 PDT 2017, Jassi Brar wrote:
>
> The APCS IPC register serves the basis for all inter-processor
> communication in a Qualcomm platform, so it's not only the RPM driver
> discussed earlier that uses this. It's also used for other non-FIFO
> based communication channels, where the signalled information either
> isn't acked at all or acked on a system-level.
>
Something has to indicate consumption of data or "requested action
taken". Otherwise the protocol is design-wise broken.

> But regardless of the protocol implemented ontop, the purpose of the
> APCS IPC bit is _only_ to invoke some remote handler to consume some
> data, somewhere - the event in itself does not carry any information.
>
Yes, every platform that uses shared-memory works like that. However
there is always something that tells if the command has been acted
upon by the remote. In your case that is the read-pointer movement.

>> The client should call mbox_client_txdone() after
>> mbox_send_message().
>
> So every time we call mbox_send_message() from any of the client drivers
> we also needs to call mbox_client_txdone()?
>
Yes.

> This seems like an awkward side effect of using the mailbox framework -
> which has to be spread out in at least 6 different client drivers :(
>
No. Mailbox or whatever you implement - you must (and do) tick the
state machine to keep the messages moving.
  Best designs have some interrupt occurring when the message has been
consumed by the remote. Some designs have a flag set which needs to be
polled to detect completion. Very few (like yours) that support
neither irq nor polling, have to be driven by the upper protocol layer
by some ack packet (or tracking read/write pointers like you do).
These three cases are denoted by TXDONE_BY_IRQ, TXDONE_BY_POLL and
TXDONE_BY_ACK respectively.

  If no client driver will ever submit a message if there is no space
in FIFO, then you can specify TXDONE_BY_POLL and have last_tx_done()
always return true. That way you don't need to call
mbox_client_txdone().
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
