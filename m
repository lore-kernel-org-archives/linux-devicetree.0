From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATH v7 1/2] mailbox: ZynqMP IPI mailbox controller
Date: Fri, 21 Dec 2018 19:59:48 -0600
Message-ID: <CABb+yY27K8V-Mg_0kvQFvvAGhzdXG+7Zcz9tGDe_1FTStvra3Q@mail.gmail.com>
References: <1545327149-22331-1-git-send-email-wendy.liang@xilinx.com> <1545327149-22331-2-git-send-email-wendy.liang@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545327149-22331-2-git-send-email-wendy.liang@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wendy Liang <wendy.liang@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, Devicetree List <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 20, 2018 at 11:32 AM Wendy Liang <wendy.liang@xilinx.com> wrote:


> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
> new file mode 100644
> index 0000000..bbddfd5
> --- /dev/null
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -0,0 +1,764 @@

......
> +
> +/* IPI SMC Macros */
> +#define IPI_SMC_OPEN_IRQ_MASK          0x00000001UL /* IRQ enable bit in IPI
> +                                                     * open SMC call
> +                                                     */
> +#define IPI_SMC_NOTIFY_BLOCK_MASK      0x00000001UL /* Flag to indicate if
> +                                                     * IPI notification needs
> +                                                     * to be blocking.
> +                                                     */
> +#define IPI_SMC_ENQUIRY_DIRQ_MASK      0x00000001UL /* Flag to indicate if
> +                                                     * notification interrupt
> +                                                     * to be disabled.
> +                                                     */
> +#define IPI_SMC_ACK_EIRQ_MASK          0x00000001UL /* Flag to indicate if
> +                                                     * notification interrupt
> +                                                     * to be enabled.
> +                                                     */
> +
The first two are unused.


> +struct zynqmp_ipi_pdata {
> +       struct device *dev;
> +       int irq;
> +       unsigned int method;
>
'method' doesn't track the HVC option in the driver. Please have a look.

......
> +
> +static void zynqmp_ipi_fw_call(struct zynqmp_ipi_mbox *ipi_mbox,
> +                              unsigned long a0, unsigned long a3,
> +                              unsigned long a4, unsigned long a5,
> +                              unsigned long a6, unsigned long a7,
> +                              struct arm_smccc_res *res)
>
[a4,a7] are always 0, so maybe just drop them?


> +static bool zynqmp_ipi_last_tx_done(struct mbox_chan *chan)
> +{
> +       struct device *dev = chan->mbox->dev;
> +       struct zynqmp_ipi_mbox *ipi_mbox = dev_get_drvdata(dev);
> +       struct zynqmp_ipi_mchan *mchan = chan->con_priv;
> +       int ret;
> +       u64 arg0;
> +       struct arm_smccc_res res;
> +       struct zynqmp_ipi_message *msg;
> +
> +       if (WARN_ON(!ipi_mbox)) {
> +               dev_err(dev, "no platform drv data??\n");
> +               return false;
> +       }
> +
> +       if (mchan->chan_type == IPI_MB_CHNL_TX) {
> +               /* We only need to check if the message been taken
> +                * by the remote in the TX channel
> +                */
> +               arg0 = SMC_IPI_MAILBOX_STATUS_ENQUIRY;
> +               zynqmp_ipi_fw_call(ipi_mbox, arg0, 0, 0, 0, 0, 0, &res);
> +               /* Check the SMC call status, a0 of the result */
> +               ret = (int)(res.a0 & 0xFFFFFFFF);
> +               if (ret < 0 || ret & IPI_MB_STATUS_SEND_PENDING)
> +                       return false;
> +
OK, but ...

> +               msg = mchan->rx_buf;
> +               msg->len = mchan->resp_buf_size;
> +               memcpy_fromio(msg->data, mchan->resp_buf, msg->len);
> +               mbox_chan_received_data(chan, (void *)msg);
>
.... wouldn't this be done from zynqmp_ipi_interrupt()?



> +static int zynqmp_ipi_send_data(struct mbox_chan *chan, void *data)
> +{
  .........
> +               /* Enquire if the mailbox is free to send message */
> +               arg0 = SMC_IPI_MAILBOX_STATUS_ENQUIRY;
> +               timeout = 10;
> +               if (msg && msg->len) {
> +                       timeout = 10;
> +                       do {
> +                               zynqmp_ipi_fw_call(ipi_mbox, arg0,
> +                                                  0, 0, 0, 0, 0, &res);
> +                               ret = res.a0 & 0xFFFFFFFF;
> +                               if (ret >= 0 &&
> +                                   !(ret & IPI_MB_STATUS_SEND_PENDING))
> +                                       break;
> +                               usleep_range(1, 2);
> +                               timeout--;
> +                       } while (timeout);
> +                       if (!timeout) {
> +                               dev_warn(dev, "chan %d sending msg timeout.\n",
> +                                        ipi_mbox->remote_id);
> +                               return -ETIME;
> +                       }
> +                       memcpy_toio(mchan->req_buf, msg->data, msg->len);
> +               }
>
This check should be done in last_tx_done, and not here.
send_data is never called unless last_tx_done returns true.

> +               /* Kick IPI mailbox to send message */
> +               arg0 = SMC_IPI_MAILBOX_NOTIFY;
> +               zynqmp_ipi_fw_call(ipi_mbox, arg0, 0, 0, 0, 0, 0, &res);
> +       } else {
> +               /* Send response message */
> +               if (msg && msg->len > mchan->resp_buf_size) {
> +                       dev_err(dev, "channel %d message length %u > max %lu\n",
> +                               mchan->chan_type, (unsigned int)msg->len,
> +                               mchan->resp_buf_size);
> +                       return -EINVAL;
> +               }
> +               if (msg && msg->len)
> +                       memcpy_toio(mchan->resp_buf, msg->data, msg->len);
>

> +               arg0 = SMC_IPI_MAILBOX_NOTIFY;
> +               arg0 = SMC_IPI_MAILBOX_ACK;
>
This is obviously wrong.

....
> +       mbox->chans = chans;
> +       chans[IPI_MB_CHNL_TX].con_priv = &ipi_mbox->mchans[IPI_MB_CHNL_TX];
> +       chans[IPI_MB_CHNL_RX].con_priv = &ipi_mbox->mchans[IPI_MB_CHNL_RX];
> +       ipi_mbox->mchans[IPI_MB_CHNL_TX].chan_type = IPI_MB_CHNL_TX;
> +       ipi_mbox->mchans[IPI_MB_CHNL_RX].chan_type = IPI_MB_CHNL_RX;
> +       ret = mbox_controller_register(mbox);
>
while at it, you may want to start using
devm_mbox_controller_register() recently added by Thierry.

> +       if (ret)
> +               dev_err(mdev,
> +                       "Failed to register mbox_controller(%d)\n", ret);
> +       else
> +               dev_info(mdev, "Probed ZynqMP IPI Mailbox driver.\n");
>
You may want to also print something instance specific here.


> +static int zynqmp_ipi_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *nc, *np = pdev->dev.of_node;
> +       struct zynqmp_ipi_pdata *pdata;
> +       struct zynqmp_ipi_mbox *mbox;
> +       int i, ret = -EINVAL;
> +
> +       i = 0;
> +       for_each_available_child_of_node(np, nc)
> +               i++;
>
of_get_child_count() ?


Thnx
