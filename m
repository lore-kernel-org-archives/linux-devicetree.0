From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Date: Sat, 6 May 2017 00:52:30 +0530
Message-ID: <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org> <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170505183729.GG15143@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, May 6, 2017 at 12:07 AM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri 05 May 03:26 PDT 2017, Jassi Brar wrote:
>
>> On Fri, May 5, 2017 at 1:35 AM, Bjorn Andersson
>> <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> > +
>> > +static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
>> > +{
>> > +       struct qcom_apcs_ipc *apcs = container_of(chan->mbox,
>> > +                                                 struct qcom_apcs_ipc, mbox);
>> > +       unsigned long idx = (unsigned long)chan->con_priv;
>> > +
>> > +       writel(BIT(idx), apcs->base + apcs->offset);
>> > +
>> When/how does this bit get ever cleared again?
>> You may want to add last_tx_done() callback to check if this bit is
>> cleared before you can send the next interrupt. And set
>> txdone_poll/irq accordingly.
>>
>
> It's a write-only register, writing a bit fires off an edge triggered
> interrupt on the specific remote processor, which will ack the
> associated IRQ status and handle the interrupt.
>
> As the "message" is just a notification to the other side that it needs
> to act on "something", there's no harm in notifying it multiple times
> before it has a chance to ack the IRQ and a write after that will be
> seen as a separate interrupt.
>
What causes it to return to '0'?

I think the driver should wait for it to become 0 before writing 1.
For example, the protocol has a command that says to remote cpu to
increase the voltage supply by 0.1v. This command is filled in a
structure and laid out in the shared memory before you ring the
'doorbell'.  In this situation you don't want the remote cpu to act
twice on the same command. Also for a new command, you don't want to
overwrite the last command packet before remote cpu has consumed it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
