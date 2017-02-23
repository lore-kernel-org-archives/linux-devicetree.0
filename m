From: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: Re: [PATCH v4 2/3] mailbox: Add iProc mailbox controller driver
Date: Thu, 23 Feb 2017 10:59:30 -0800
Message-ID: <09177a6f-0612-1e17-a12e-0b1969f5b2e1@broadcom.com>
References: <1485463082-27067-1-git-send-email-jonathan.richardson@broadcom.com>
 <1485463082-27067-3-git-send-email-jonathan.richardson@broadcom.com>
 <CABb+yY0rmAFutskhVkQ926QfsvtJ-WnXrQc=+PQNg=7NZEXC+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABb+yY0rmAFutskhVkQ926QfsvtJ-WnXrQc=+PQNg=7NZEXC+Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Russell King <linux@armlinux.org.uk>, Vikram Prakash <vikram.prakash@broadcom.com>, Rob Herring <robh+dt@kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 17-02-16 10:20 PM, Jassi Brar wrote:
> On Fri, Jan 27, 2017 at 2:08 AM, Jonathan Richardson
> <jonathan.richardson@broadcom.com> wrote:
>
>> +static int iproc_mbox_send_data_m0(struct mbox_chan *chan, void *data)
>> +{
>> +       struct iproc_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
>> +       struct iproc_mbox_msg *msg = (struct iproc_mbox_msg *)data;
>> +               unsigned long flags;
>> +       int err = 0;
>> +       const int poll_period_us = 5;
>> +       const int max_retries = (MAX_M0_TIMEOUT_MS * 1000) / poll_period_us;
>> +
>> +       if (!msg)
>> +               return -EINVAL;
>> +
>> +       spin_lock_irqsave(&mbox->lock, flags);
>> +
>> +       dev_dbg(mbox->dev, "Send msg to M0: cmd=0x%x, param=0x%x, wait_ack=%d\n",
>> +               msg->cmd, msg->param, msg->wait_ack);
>> +
> prints should be outside the spinlocks.
>
>> +       writel(msg->cmd, mbox->base + IPROC_CRMU_MAILBOX0_OFFSET);
>> +       writel(msg->param, mbox->base + IPROC_CRMU_MAILBOX1_OFFSET);
>> +
>> +       if (msg->wait_ack) {
>> +               int retries;
>> +
> move poll_period_us and max_retries in here or just define' them
>
>> +               err = msg->reply_code = -ETIMEDOUT;
>> +               for (retries = 0; retries < max_retries; retries++) {
>> +                       u32 val = readl(
>> +                               mbox->base + IPROC_CRMU_MAILBOX0_OFFSET);
>> +                       if (val & M0_IPC_CMD_DONE_MASK) {
>> +                               /*
>> +                                * M0 replied - save reply code and
>> +                                * clear error.
>> +                                */
>> +                               msg->reply_code = (val &
>> +                                       M0_IPC_CMD_REPLY_MASK) >>
>> +                                       M0_IPC_CMD_REPLY_SHIFT;
>> +                               err = 0;
>> +                               break;
>> +                       }
>> +                       udelay(poll_period_us);
>>
> potentially 2ms inside spin_lock_irqsave. Alternative is to implement
> a simple 'peek_data' and call it for requests with 'wait_ack'
Hi Jassi. The M0 response is normally 25-30 us. We have one message that takes 280us but we can get rid of it if necessary. Regarding your suggestion of peek_data. I don't see how it can be used without the spinlock to serialize multiple clients/channels over a single mailbox channel. peek_data is going to allow the client to poll for data. But the spinlock is there to prevent other clients from accessing the mailbox channel until any pending transaction is complete. last_tx_done looks like an option but even that will not prevent another client from clobbering a pending transaction. A shared channel among all clients with a blocking model would probably work, but not pretty. Let me know what you advise. Thanks.
