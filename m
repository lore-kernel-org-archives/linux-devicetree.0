From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 3/5] nfc: pn533: add UART phy driver
Date: Sun, 28 Oct 2018 11:27:25 +0100
Message-ID: <20181028102725.GL27852@localhost>
References: <20181025132937.24405-1-poeschel@lemonage.de>
 <20181025132937.24405-3-poeschel@lemonage.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181025132937.24405-3-poeschel@lemonage.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:NFC SUBSYSTEM" <linux-wireless@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 03:29:34PM +0200, Lars Poeschel wrote:
> This adds the UART phy interface for the pn533 driver.
> The pn533 driver can be used through UART interface this way.
> It is implemented as a serdev device.

Just a few drive-by comments below.

> +// SPDX-License-Identifier: GPL-2.0

This should match MODULE_LICENSE below which currently says v2 *or
later*.

> +/*
> + * Driver for NXP PN532 NFC Chip - UART transport layer
> + *
> + * Copyright (C) 2018 Lemonage Software GmbH
> + * Author: Lars Pöschel <poeschel@lemonage.de>
> + * All rights reserved.
> + */

> +#define VERSION "0.1"

We don't version kernel drivers individually, so please drop this here
and below.

> +static int pn532_uart_send_frame(struct pn533 *dev,
> +				struct sk_buff *out)
> +{
> +	static const u8 wakeup[] = {
> +		0x55, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
> +	/* wakeup sequence and dummy bytes for waiting time */

Comments should go above the code they apply to.

> +	struct pn532_uart_phy *pn532 = dev->phy;
> +	int count;
> +
> +	print_hex_dump_debug("PN532_uart TX: ", DUMP_PREFIX_NONE, 16, 1,
> +			     out->data, out->len, false);
> +
> +	pn532->cur_out_buf = out;
> +	if (pn532->send_wakeup)
> +		count = serdev_device_write(pn532->serdev,
> +				wakeup, sizeof(wakeup),
> +				MAX_SCHEDULE_TIMEOUT);

No error handling?

> +
> +	count = serdev_device_write(pn532->serdev, out->data, out->len,
> +			MAX_SCHEDULE_TIMEOUT);

Same here.

> +	if (PN533_FRAME_CMD(((struct pn533_std_frame *)out->data)) ==
> +			PN533_CMD_SAM_CONFIGURATION)
> +		pn532->send_wakeup = 0;
> +
> +	mod_timer(&pn532->cmd_timeout, HZ / 40 + jiffies);
> +	return 0;
> +}
> +
> +static int pn532_uart_send_ack(struct pn533 *dev, gfp_t flags)
> +{
> +	struct pn532_uart_phy *pn532 = dev->phy;
> +	static const u8 ack[PN533_STD_FRAME_ACK_SIZE] = {
> +			0x00, 0x00, 0xff, 0x00, 0xff, 0x00};
> +	/* spec 7.1.1.3:  Preamble, SoPC (2), ACK Code (2), Postamble */

Same as above.

> +	int rc;
> +
> +	rc = serdev_device_write(pn532->serdev, ack, sizeof(ack),
> +			MAX_SCHEDULE_TIMEOUT);

Error handling.

> +
> +	return 0;
> +}

> +static int pn532_uart_probe(struct serdev_device *serdev)
> +{
> +	struct pn532_uart_phy *pn532;
> +	struct pn533 *priv;
> +	int err;
> +
> +	err = -ENOMEM;
> +	pn532 = kzalloc(sizeof(*pn532), GFP_KERNEL);
> +	if (pn532 == NULL)

I'd use !pn532 here (and elsewhere).

> +		goto err_exit;
> +
> +	pn532->recv_skb = alloc_skb(PN532_UART_SKB_BUFF_LEN, GFP_KERNEL);
> +	if (pn532->recv_skb == NULL)
> +		goto err_free;
> +
> +	pn532->serdev = serdev;
> +	priv = pn533_register_device(PN533_DEVICE_PN532,
> +				     PN533_NO_TYPE_B_PROTOCOLS,
> +				     PN533_PROTO_REQ_ACK_RESP,
> +				     pn532, &uart_phy_ops, NULL,
> +				     &pn532->serdev->dev,
> +				     &serdev->dev);
> +

Stray new line.

> +	if (IS_ERR(priv)) {
> +		err = PTR_ERR(priv);
> +		goto err_skb;
> +	}

Should you not set up your device fully before registering it? I'd
assume you could get callbacks from NFC core here.

> +
> +	pn532->priv = priv;
> +	serdev_device_set_drvdata(serdev, pn532);
> +	serdev_device_set_client_ops(serdev, &pn532_serdev_ops);
> +	err = serdev_device_open(serdev);
> +	if (err) {
> +		dev_err(&serdev->dev, "Unable to open device %s\n",
> +				serdev->dev.init_name);

dev_err will include the device name so you can drop the init_name bit.

> +		goto err_unregister;
> +	}

Keeping the serial device open at all times will prevent low power
states on some platforms. Wouldn't it be possible to open the device
when the nfc interface is brought up (and during setup)?

> +
> +	err = serdev_device_set_baudrate(serdev, 115200);
> +	if (err != 115200) {
> +		err = -EINVAL;
> +		goto err_serdev;
> +	}
> +
> +	serdev_device_set_flow_control(serdev, false);
> +	pn532->send_wakeup = 1;
> +	timer_setup(&pn532->cmd_timeout, pn532_cmd_timeout, 0);
> +	err = pn533_finalize_setup(pn532->priv);
> +	if (err)
> +		goto err_serdev;
> +
> +	return 0;
> +
> +err_serdev:
> +	serdev_device_close(serdev);
> +err_unregister:
> +	pn533_unregister_device(pn532->priv);
> +err_skb:
> +	kfree_skb(pn532->recv_skb);
> +err_free:
> +	kfree(pn532);
> +err_exit:
> +	return err;
> +}

> +MODULE_AUTHOR("Lars Pöschel <poeschel@lemonage.de>");
> +MODULE_DESCRIPTION("PN532 UART driver ver " VERSION);
> +MODULE_VERSION(VERSION);

Drop version.

> +MODULE_LICENSE("GPL");

Doesn't match SPDX identifier above.

Johan
