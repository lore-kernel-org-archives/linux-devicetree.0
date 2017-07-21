From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH v2 6/7] mailbox: bcm-flexrm-mailbox: Set msg_queue_len for
 each channel
Date: Fri, 21 Jul 2017 21:16:24 +0530
Message-ID: <CABb+yY1Pxhgvvit=0eZr66DpLJ3MDEvRPx9dwDPJM8PwiKXiew@mail.gmail.com>
References: <1500620142-910-1-git-send-email-anup.patel@broadcom.com>
 <1500620142-910-7-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1500620142-910-7-git-send-email-anup.patel@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anup Patel <anup.patel@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Anup,

On Fri, Jul 21, 2017 at 12:25 PM, Anup Patel <anup.patel@broadcom.com> wrote:
> The Broadcom FlexRM ring (i.e. mailbox channel) can handle
> larger number of messages queued in one FlexRM ring hence
> this patch sets msg_queue_len for each mailbox channel to
> be same as RING_MAX_REQ_COUNT.
>
> Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> ---
>  drivers/mailbox/bcm-flexrm-mailbox.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
> index 9873818..20055a0 100644
> --- a/drivers/mailbox/bcm-flexrm-mailbox.c
> +++ b/drivers/mailbox/bcm-flexrm-mailbox.c
> @@ -1683,8 +1683,11 @@ static int flexrm_mbox_probe(struct platform_device *pdev)
>                 ret = -ENOMEM;
>                 goto fail_free_debugfs_root;
>         }
> -       for (index = 0; index < mbox->num_rings; index++)
> +       for (index = 0; index < mbox->num_rings; index++) {
> +               mbox->controller.chans[index].msg_queue_len =
> +                                               RING_MAX_REQ_COUNT;
>                 mbox->controller.chans[index].con_priv = &mbox->rings[index];
> +       }
>
While writing mailbox.c I wasn't unaware that there is the option to
choose the queue length at runtime.
The idea was to keep the code as simple as possible. I am open to
making it a runtime thing, but first, please help me understand how
that is useful here.

I understand FlexRm has a ring buffer of RING_MAX_REQ_COUNT(1024)
elements. Any message submitted to mailbox api can be immediately
written onto the ringbuffer if there is some space.
Is there any mechanism to report back to a client driver, if its
message in ringbuffer failed "to be sent"?
If there isn't any, then I think, in flexrm_last_tx_done() you should
simply return true if there is some space left in the rung-buffer,
false otherwise.

Thanks
