From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 6/7] mailbox: bcm-flexrm-mailbox: Set msg_queue_len for
 each channel
Date: Mon, 24 Jul 2017 09:26:30 +0530
Message-ID: <CAALAos_yh0bCMZFrSmf-c92pNMBGhLT05YFF0duhmpxgYec+_w@mail.gmail.com>
References: <1500620142-910-1-git-send-email-anup.patel@broadcom.com>
 <1500620142-910-7-git-send-email-anup.patel@broadcom.com> <CABb+yY1Pxhgvvit=0eZr66DpLJ3MDEvRPx9dwDPJM8PwiKXiew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY1Pxhgvvit=0eZr66DpLJ3MDEvRPx9dwDPJM8PwiKXiew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jassi,

Sorry for the delayed response...

On Fri, Jul 21, 2017 at 9:16 PM, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Anup,
>
> On Fri, Jul 21, 2017 at 12:25 PM, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> The Broadcom FlexRM ring (i.e. mailbox channel) can handle
>> larger number of messages queued in one FlexRM ring hence
>> this patch sets msg_queue_len for each mailbox channel to
>> be same as RING_MAX_REQ_COUNT.
>>
>> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  drivers/mailbox/bcm-flexrm-mailbox.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
>> index 9873818..20055a0 100644
>> --- a/drivers/mailbox/bcm-flexrm-mailbox.c
>> +++ b/drivers/mailbox/bcm-flexrm-mailbox.c
>> @@ -1683,8 +1683,11 @@ static int flexrm_mbox_probe(struct platform_device *pdev)
>>                 ret = -ENOMEM;
>>                 goto fail_free_debugfs_root;
>>         }
>> -       for (index = 0; index < mbox->num_rings; index++)
>> +       for (index = 0; index < mbox->num_rings; index++) {
>> +               mbox->controller.chans[index].msg_queue_len =
>> +                                               RING_MAX_REQ_COUNT;
>>                 mbox->controller.chans[index].con_priv = &mbox->rings[index];
>> +       }
>>
> While writing mailbox.c I wasn't unaware that there is the option to
> choose the queue length at runtime.
> The idea was to keep the code as simple as possible. I am open to
> making it a runtime thing, but first, please help me understand how
> that is useful here.
>
> I understand FlexRm has a ring buffer of RING_MAX_REQ_COUNT(1024)
> elements. Any message submitted to mailbox api can be immediately
> written onto the ringbuffer if there is some space.
> Is there any mechanism to report back to a client driver, if its
> message in ringbuffer failed "to be sent"?
> If there isn't any, then I think, in flexrm_last_tx_done() you should
> simply return true if there is some space left in the rung-buffer,
> false otherwise.

Yes, we have error code in "struct brcm_message" to report back
errors from send_message. In our mailbox clients, we check
return value of mbox_send_message() and also the error code
in "struct brcm_message".

The flexrm_last_tx_done() will mostly return true when it is able to
write message in the FlexRM ring. It will return false only when
there was no room in FlexRM ring or number of in-flight messages
in FlexRM ring are 1024 (max enteries in completion queue of
FlexRM ring).

We started seeing issues with fixed queue length in mailbox framework
when we stressed one FlexRM ring from multiple CPUs. Instead of simply
increasing MBOX_TX_QUEUE_LEN, it is better to let mailbox controller
driver to choose the queue length because there also Ring Manager
hardware who support variable sized rings.

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
