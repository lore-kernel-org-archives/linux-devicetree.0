From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v4 4/6] nfc: pn533: add UART phy driver
Date: Wed, 14 Nov 2018 16:35:17 +0100
Message-ID: <20181114153517.GB19900@localhost>
References: <20181101100216.613-1-poeschel@lemonage.de>
 <20181101100216.613-4-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181101100216.613-4-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 01, 2018 at 11:02:12AM +0100, Lars Poeschel wrote:
> This adds the UART phy interface for the pn533 driver.
> The pn533 driver can be used through UART interface this way.
> It is implemented as a serdev device.
> 
> Signed-off-by: Lars Poeschel <poeschel@lemonage.de>

Please make sure to include reviewers on CC.

> ---
> Changes in v4:
> - SPDX-License-Identifier: GPL-2.0+
> - Source code comments above refering items
> - Error check for serdev_device_write's
> - Change if (xxx == NULL) to if (!xxx)
> - Remove device name from a dev_err
> - move pn533_register in _probe a bit towards the end of _probe
> - make use of newly added dev_up / dev_down phy_ops
> - control send_wakeup variable from dev_up / dev_down
> 
> Changes in v3:
> - depend on SERIAL_DEV_BUS in Kconfig
> 
> Changes in v2:
> - switched from tty line discipline to serdev, resulting in many
>   simplifications
> - SPDX License Identifier
> 
>  drivers/nfc/pn533/Kconfig  |  11 ++
>  drivers/nfc/pn533/Makefile |   2 +
>  drivers/nfc/pn533/pn533.h  |   8 +
>  drivers/nfc/pn533/uart.c   | 311 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 332 insertions(+)
>  create mode 100644 drivers/nfc/pn533/uart.c
> 
> +static void pn532_dev_up(struct pn533 *dev)
> +{
> +	struct pn532_uart_phy *pn532 = dev->phy;
> +
> +	serdev_device_open(pn532->serdev);
> +	pn532->send_wakeup = PN532_SEND_LAST_WAKEUP;
> +}
> +
> +static void pn532_dev_down(struct pn533 *dev)
> +{
> +	struct pn532_uart_phy *pn532 = dev->phy;
> +
> +	serdev_device_close(pn532->serdev);
> +	pn532->send_wakeup = PN532_SEND_WAKEUP;
> +}
> +
> +static struct pn533_phy_ops uart_phy_ops = {
> +	.send_frame = pn532_uart_send_frame,
> +	.send_ack = pn532_uart_send_ack,
> +	.abort_cmd = pn532_uart_abort_cmd,
> +	.dev_up = pn532_dev_up,
> +	.dev_down = pn532_dev_down,
> +};

> +static int pn532_uart_probe(struct serdev_device *serdev)
> +{
> +	struct pn532_uart_phy *pn532;
> +	struct pn533 *priv;
> +	int err;
> +
> +	err = -ENOMEM;
> +	pn532 = kzalloc(sizeof(*pn532), GFP_KERNEL);
> +	if (!pn532)
> +		goto err_exit;
> +
> +	pn532->recv_skb = alloc_skb(PN532_UART_SKB_BUFF_LEN, GFP_KERNEL);
> +	if (!pn532->recv_skb)
> +		goto err_free;
> +
> +	pn532->serdev = serdev;
> +	serdev_device_set_drvdata(serdev, pn532);
> +	serdev_device_set_client_ops(serdev, &pn532_serdev_ops);
> +	err = serdev_device_open(serdev);
> +	if (err) {
> +		dev_err(&serdev->dev, "Unable to open device\n");
> +		goto err_skb;
> +	}
> +
> +	err = serdev_device_set_baudrate(serdev, 115200);
> +	if (err != 115200) {
> +		err = -EINVAL;
> +		goto err_serdev;
> +	}
> +
> +	serdev_device_set_flow_control(serdev, false);
> +	pn532->send_wakeup = PN532_SEND_WAKEUP;
> +	timer_setup(&pn532->cmd_timeout, pn532_cmd_timeout, 0);
> +	priv = pn533_register_device(PN533_DEVICE_PN532,
> +				     PN533_NO_TYPE_B_PROTOCOLS,
> +				     PN533_PROTO_REQ_ACK_RESP,
> +				     pn532, &uart_phy_ops, NULL,
> +				     &pn532->serdev->dev,
> +				     &serdev->dev);
> +	if (IS_ERR(priv)) {
> +		err = PTR_ERR(priv);
> +		goto err_serdev;
> +	}
> +
> +	pn532->priv = priv;
> +	err = pn533_finalize_setup(pn532->priv);
> +	if (err)
> +		goto err_unregister;
> +
> +	serdev_device_close(serdev);

This looks broken; what if the NFC interface is brought up before this
point? You'd get a double open, which is likely to crash things, but
even if you survive that, the port would not be closed despite the
interface being up.

Can't you finalise your setup before registering the interface?

> +	return 0;
> +
> +err_unregister:
> +	pn533_unregister_device(pn532->priv);
> +err_serdev:
> +	serdev_device_close(serdev);
> +err_skb:
> +	kfree_skb(pn532->recv_skb);
> +err_free:
> +	kfree(pn532);
> +err_exit:
> +	return err;
> +}
> +
> +static void pn532_uart_remove(struct serdev_device *serdev)
> +{
> +	struct pn532_uart_phy *pn532 = serdev_device_get_drvdata(serdev);
> +
> +	pn533_unregister_device(pn532->priv);
> +	serdev_device_close(serdev);

This is also broken; the port should have been closed when the interface
was deregistered.

> +	kfree_skb(pn532->recv_skb);
> +	kfree(pn532);
> +}

Johan
