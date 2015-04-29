From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/4] mailbox: add support for System Control and Power
 Interface(SCPI) protocol
Date: Wed, 29 Apr 2015 11:53:52 +0100
Message-ID: <5540B840.1030900@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>	 <1430134846-24320-2-git-send-email-sudeep.holla@arm.com> <1430229283.3321.40.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430229283.3321.40.camel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 28/04/15 14:54, Jon Medhurst (Tixy) wrote:
> On Mon, 2015-04-27 at 12:40 +0100, Sudeep Holla wrote:
>> This patch adds support for System Control and Power Interface (SCPI)
>> Message Protocol used between the Application Cores(AP) and the System
>> Control Processor(SCP). The MHU peripheral provides a mechanism for
>> inter-processor communication between SCP's M3 processor and AP.
>>
>> SCP offers control and management of the core/cluster power states,
>> various power domain DVFS including the core/cluster, certain system
>> clocks configuration, thermal sensors and many others.
>>
>> This protocol driver provides interface for all the client drivers using
>> SCPI to make use of the features offered by the SCP.
>>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> CC: Jassi Brar <jassisinghbrar@gmail.com>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>
> There are several spelling errors but I won't point out each, sure you
> can find them with a spellcheck ;-) I'll just comment on the code...
>

OK :)

> [...]
>> +++ b/drivers/mailbox/scpi_protocol.c
>> @@ -0,0 +1,694 @@
>> +/*
>> + * System Control and Power Interface (SCPI) Message Protocol driver
>> + *
>> + * SCPI Message Protocol is used between the System Control Processor(SCP)
>> + * and the Application Processors(AP). The Message Handling Unit(MHU)
>> + * provides a mechanism for inter-processor communication between SCP's
>> + * Cortex M3 and AP.
>> + *
>> + * SCP offers control and management of the core/cluster power states,
>> + * various power domain DVFS including the core/cluster, certain system
>> + * clocks configuration, thermal sensors and many others.
>> + *
>> + * Copyright (C) 2015 ARM Ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License along
>> + * with this program. If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +

[...]

>> +
>> +static inline int scpi_to_linux_errno(int errno)
>> +{
>> +     if (errno >= SCPI_SUCCESS && errno < SCPI_ERR_MAX)
>> +             return scpi_linux_errmap[errno];
>> +     return -EIO;
>> +}
>> +
>> +static void scpi_process_cmd(struct scpi_chan *ch, u32 cmd)
>> +{
>> +     unsigned long flags;
>> +     struct scpi_xfer *t, *match = NULL;
>> +
>> +     spin_lock_irqsave(&ch->rx_lock, flags);
>> +     if (list_empty(&ch->rx_pending)) {
>> +             spin_unlock_irqrestore(&ch->rx_lock, flags);
>> +             return;
>> +     }
>> +
>> +     list_for_each_entry(t, &ch->rx_pending, node)
>> +             if (CMD_XTRACT_UNIQ(t->cmd) == CMD_XTRACT_UNIQ(cmd)) {
>
> So if UNIQ here isn't actually unique amongst all pending requests, its
> possible we'll pick the wrong one. There's a couple of scenarios where
> that can happen, comments further down about that.
>
>> +                     list_del(&t->node);
>> +                     match = t;
>> +                     break;
>> +             }
>> +     /* check if wait_for_completion is in progress or timed-out */
>> +     if (match && !completion_done(&match->done)) {
>> +             struct scpi_shared_mem *mem = ch->rx_payload;
>> +
>> +             match->status = le32_to_cpu(mem->status);
>> +             memcpy_fromio(match->rx_buf, mem->payload, CMD_SIZE(cmd));
>> +             complete(&match->done);
>> +     }
>> +     spin_unlock_irqrestore(&ch->rx_lock, flags);
>> +}
>> +
>> +static void scpi_handle_remote_msg(struct mbox_client *c, void *msg)
>> +{
>> +     struct scpi_chan *ch = container_of(c, struct scpi_chan, cl);
>> +     struct scpi_shared_mem *mem = ch->rx_payload;
>> +     u32 cmd = le32_to_cpu(mem->command);
>> +
>> +     scpi_process_cmd(ch, cmd);
>> +}
>> +
>> +static void scpi_tx_prepare(struct mbox_client *c, void *msg)
>> +{
>> +     unsigned long flags;
>> +     struct scpi_xfer *t = msg;
>> +     struct scpi_chan *ch = container_of(c, struct scpi_chan, cl);
>> +     struct scpi_shared_mem *mem = (struct scpi_shared_mem *)ch->tx_payload;
>> +
>> +     mem->command = cpu_to_le32(t->cmd);
>> +     if (t->tx_buf)
>> +             memcpy_toio(mem->payload, t->tx_buf, t->tx_len);
>> +     if (t->rx_buf) {
>> +             spin_lock_irqsave(&ch->rx_lock, flags);
>> +             list_add_tail(&t->node, &ch->rx_pending);
>> +             spin_unlock_irqrestore(&ch->rx_lock, flags);
>> +     }
>> +}
>> +
>> +static struct scpi_xfer *get_scpi_xfer(struct scpi_chan *ch)
>> +{
>> +     struct scpi_xfer *t;
>> +
>> +     mutex_lock(&ch->xfers_lock);
>> +     if (list_empty(&ch->xfers_list)) {
>> +             mutex_unlock(&ch->xfers_lock);
>> +             return NULL;
>> +     }
>> +     t = list_first_entry(&ch->xfers_list, struct scpi_xfer, node);
>> +     list_del(&t->node);
>> +     mutex_unlock(&ch->xfers_lock);
>> +     return t;
>> +}
>> +
>> +static void put_scpi_xfer(struct scpi_xfer *t, struct scpi_chan *ch)
>> +{
>> +     mutex_lock(&ch->xfers_lock);
>> +     list_add_tail(&t->node, &ch->xfers_list);
>> +     mutex_unlock(&ch->xfers_lock);
>> +}
>> +
>> +static int
>> +scpi_send_message(u8 cmd, void *tx_buf, unsigned int len, void *rx_buf)
>> +{
>
> So the caller doesn't specify the length of rx_buf, wouldn't this be a
> good idea?
>
> That way we could truncate data sent from the SCP which would prevent
> buffer overruns due to buggy SCP or Linux code. It would also allow the
> SCP message format to be extended in the future in a backwards
> compatible way.
>
> And we could zero fill any data that was too short to allow
> compatibility with Linux drivers using any new extended format messages
> on older SCP firmware. Or at least so any bugs behave more consistently
> by seeing zeros instead of random data left over from old messages.
>

Make sense, will add len in next version.

>> +     int ret;
>> +     u8 token, chan;
>> +     struct scpi_xfer *msg;
>> +     struct scpi_chan *scpi_chan;
>> +
>> +     chan = atomic_inc_return(&scpi_info->next_chan) % scpi_info->num_chans;
>> +     scpi_chan = scpi_info->channels + chan;
>> +
>> +     msg = get_scpi_xfer(scpi_chan);
>> +     if (!msg)
>> +             return -ENOMEM;
>> +
>> +     token = atomic_inc_return(&scpi_chan->token) & CMD_TOKEN_ID_MASK;
>
> So, this 8 bit token is what's used to 'uniquely' identify a pending
> command. But as it's just an incrementing value, then if one command
> gets delayed for long enough that 256 more are issued then we will have
> a non-unique value and scpi_process_cmd can go wrong.
>

IMO by the time 256 message are queued up and serviced we would timeout
on the initial command. Moreover the core mailbox has sent the mailbox
length to 20(MBOX_TX_QUEUE_LEN) which needs to removed to even get the
remote chance of hit the corner case.

> Note, this delay doesn't just have to be at the SCPI end. We could get
> preempted here (?) before actually sending the command to the SCP and
> other kernel threads or processes could send those other 256 commands
> before we get to run again.
>

Agreed, but we would still timeout after 3 jiffies max.

> Wouldn't it be better instead to have scpi_alloc_xfer_list add a unique
> number to each struct scpi_xfer.
>

One of reason using it part of command is that SCP gives it back in the
response to compare.

>> +
>> +     msg->slot = BIT(SCPI_SLOT);
>> +     msg->cmd = PACK_SCPI_CMD(cmd, token, len);
>> +     msg->tx_buf = tx_buf;
>> +     msg->tx_len = len;
>> +     msg->rx_buf = rx_buf;
>> +     init_completion(&msg->done);
>> +
>> +     ret = mbox_send_message(scpi_chan->chan, msg);
>> +     if (ret < 0 || !rx_buf)
>> +             goto out;
>> +
>> +     if (!wait_for_completion_timeout(&msg->done, MAX_RX_TIMEOUT))
>> +             ret = -ETIMEDOUT;
>> +     else
>> +             /* first status word */
>> +             ret = le32_to_cpu(msg->status);
>> +out:
>> +     if (ret < 0 && rx_buf) /* remove entry from the list if timed-out */
>
> So, even with my suggestion that the unique message identifies are
> fixed values stored in struct scpi_xfer, we can still have the situation
> where we timeout a request, that scpi_xfer then getting used for another
> request, and finally the SCP completes the request that we timed out,
> which has the same 'unique' value as the later one.
>

As explained above I can't imagine hitting this condition. I will think
more on that again.

> One way to handle that it to not have any timeout on requests and assume
> the firmware isn't buggy.
>

That's something I can't do ;) based on my experience so far. It's good
to assume firmware *can be buggy* and handle all possible errors. Think
about the development firmware using this driver. This has been very
useful when I was testing the development versions. Even under stress
conditions I still see timeouts(very rarely though), so my personal
preference is to have them.

> Another way is to have something more closely approximating unique in
> the message, e.g. a 64-bit incrementing count. I realise though that
> ARM have already finished the spec so we're limited to 8-bits :-(
>
>> +             scpi_process_cmd(scpi_chan, msg->cmd);
>> +
>> +     put_scpi_xfer(msg, scpi_chan);
>> +     /* SCPI error codes > 0, translate them to Linux scale*/
>> +     return ret > 0 ? scpi_to_linux_errno(ret) : ret;
>> +}
>> +
>> +static u32 scpi_get_version(void)
>> +{
>> +     return scpi_info->protocol_version;
>> +}
>> +
>> +static int
>> +scpi_clk_get_range(u16 clk_id, unsigned long *min, unsigned long *max)
>> +{
>> +     int ret;
>> +     struct clk_get_info clk;
>> +     __le16 le_clk_id = cpu_to_le16(clk_id);
>> +
>> +     ret = scpi_send_message(SCPI_CMD_GET_CLOCK_INFO,
>> +                             &le_clk_id, sizeof(le_clk_id), &clk);
>> +     if (!ret) {
>> +             *min = le32_to_cpu(clk.min_rate);
>> +             *max = le32_to_cpu(clk.max_rate);
>> +     }
>> +     return ret;
>> +}
>> +
>> +static unsigned long scpi_clk_get_val(u16 clk_id)
>> +{
>> +     int ret;
>> +     struct clk_get_value clk;
>> +     __le16 le_clk_id = cpu_to_le16(clk_id);
>> +
>> +     ret = scpi_send_message(SCPI_CMD_GET_CLOCK_VALUE,
>> +                             &le_clk_id, sizeof(le_clk_id), &clk);
>> +     return ret ? ret : le32_to_cpu(clk.rate);
>> +}
>> +
>> +static int scpi_clk_set_val(u16 clk_id, unsigned long rate)
>> +{
>> +     int stat;
>> +     struct clk_set_value clk = {
>> +             cpu_to_le16(clk_id), 0, cpu_to_le32(rate)
>
> I know that '0' is what I suggested when I spotted the 'reserved' member
> wasn't being allowed for, but I have since thought that the more robust
> way of initialising structures here, and in other functions below,
> might be with this syntax:
>
>                  .id = cpu_to_le16(clk_id),
>                  .rate = cpu_to_le32(rate)
>

Ok will update.

[...]

>> +static int scpi_probe(struct platform_device *pdev)
>> +{
>> +     int count, idx, ret;
>> +     struct resource res;
>> +     struct scpi_chan *scpi_chan;
>> +     struct device *dev = &pdev->dev;
>> +     struct device_node *np = dev->of_node;
>> +
>> +     scpi_info = devm_kzalloc(dev, sizeof(*scpi_info), GFP_KERNEL);
>> +     if (!scpi_info) {
>> +             dev_err(dev, "failed to allocate memory for scpi drvinfo\n");
>> +             return -ENOMEM;
>> +     }
>> +
>> +     count = of_count_phandle_with_args(np, "mboxes", "#mbox-cells");
>> +     if (count < 0) {
>> +             dev_err(dev, "no mboxes property in '%s'\n", np->full_name);
>> +             return -ENODEV;
>> +     }
>> +
>> +     scpi_chan = devm_kcalloc(dev, count, sizeof(*scpi_chan), GFP_KERNEL);
>> +     if (!scpi_chan) {
>> +             dev_err(dev, "failed to allocate memory scpi chaninfo\n");
>> +             return -ENOMEM;
>> +     }
>> +
>> +     for (idx = 0; idx < count; idx++) {
>> +             resource_size_t size;
>> +             struct scpi_chan *pchan = scpi_chan + idx;
>> +             struct mbox_client *cl = &pchan->cl;
>> +             struct device_node *shmem = of_parse_phandle(np, "shmem", idx);
>> +
>> +             if (of_address_to_resource(shmem, 0, &res)) {
>> +                     dev_err(dev, "failed to get SCPI payload mem resource\n");
>> +                     ret = -EINVAL;
>> +                     goto err;
>> +             }
>> +
>> +             size = resource_size(&res);
>> +             pchan->rx_payload = devm_ioremap(dev, res.start, size);
>> +             if (!pchan->rx_payload) {
>> +                     dev_err(dev, "failed to ioremap SCPI payload\n");
>> +                     ret = -EADDRNOTAVAIL;
>> +                     goto err;
>> +             }
>> +             pchan->tx_payload = pchan->rx_payload + (size >> 1);
>> +
>> +             cl->dev = dev;
>> +             cl->rx_callback = scpi_handle_remote_msg;
>> +             cl->tx_prepare = scpi_tx_prepare;
>> +             cl->tx_block = true;
>> +             cl->tx_tout = 50;
>> +             cl->knows_txdone = false; /* controller can ack */
>> +
>> +             INIT_LIST_HEAD(&pchan->rx_pending);
>> +             INIT_LIST_HEAD(&pchan->xfers_list);
>> +             spin_lock_init(&pchan->rx_lock);
>> +             mutex_init(&pchan->xfers_lock);
>> +
>> +             ret = scpi_alloc_xfer_list(dev, pchan);
>> +             if (!ret) {
>> +                     pchan->chan = mbox_request_channel(cl, idx);
>> +                     if (!IS_ERR(pchan->chan))
>> +                             continue;
>> +                     ret = -EPROBE_DEFER;
>> +                     dev_err(dev, "failed to acquire channel#%d\n", idx);
>> +             }
>> +err:
>> +             scpi_free_channels(dev, scpi_chan, idx);
>
> Think we need to add one to 'idx' above, otherwise we won't free up
> resources we successfully allocated to the current channel before we got
> the error.
>
> Actually, we also fail to free scpi_chan and scpi_info, so should we not
> just call scpi_remove here instead? (Would require some tweaks as
> scpi_info and drvdata aren't set until a bit further down.)
>

Ok need to look at this again. Few thinks I left assuming devm_* will 
handle it. I will also try to check if there's any memleaks.

Regards,
Sudeep
