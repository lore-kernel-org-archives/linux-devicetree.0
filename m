Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54967C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 08:09:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27EB12080C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 08:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgHTIJG convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 04:09:06 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43255 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgHTIIh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 04:08:37 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5F85520006;
        Thu, 20 Aug 2020 08:08:30 +0000 (UTC)
Date:   Thu, 20 Aug 2020 10:08:29 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthew Schnoor <matthew.schnoor@intel.com>,
        Nicolas Pitre <npitre@baylibre.com>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
Message-ID: <20200820100829.0e44200a@xps13>
In-Reply-To: <20200814034854.460830-3-nico@fluxnic.net>
References: <20200814034854.460830-1-nico@fluxnic.net>
        <20200814034854.460830-3-nico@fluxnic.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Nicolas,

Nicolas Pitre <nico@fluxnic.net> wrote on Thu, 13 Aug 2020 23:48:54
-0400:

> From: Nicolas Pitre <npitre@baylibre.com>
> 
> This adds basic support for hardware implementing the MIPI I3C HCI
> specification. This driver is currently limited by the capabilities
> of the I3C subsystem, meaning things like scheduled commands,
> auto-commands and NCM are not yet supported.
> 
> This supports version 1.0 of the MIPI I3C HCI spec, as well as the
> imminent release of version 1.1. Support for draft version 2.0 of the
> spec is also partially included but is guaranteed to change as the spec
> is still a work in progress.
> 
> This is also lightly tested as actual hardware is still very scarse,
> even for HCI v1.0. Further contributions to this driver are expected
> once vendor implementations and new I3C devices become available.

Nice work! I honnestly do not know a lot about HCIs and I basically
had only minor nits to point out, see below.

> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>  drivers/i3c/master/Kconfig                 |  13 +
>  drivers/i3c/master/Makefile                |   1 +
>  drivers/i3c/master/mipi-i3c-hci/Makefile   |   9 +
>  drivers/i3c/master/mipi-i3c-hci/cmd.h      | 106 +++
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   | 362 ++++++++
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   | 280 ++++++
>  drivers/i3c/master/mipi-i3c-hci/core.c     | 801 +++++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/dat.h      |  28 +
>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c   | 170 ++++
>  drivers/i3c/master/mipi-i3c-hci/dct.h      |  16 +
>  drivers/i3c/master/mipi-i3c-hci/dct_v1.c   |  36 +
>  drivers/i3c/master/mipi-i3c-hci/debug.c    |  79 ++
>  drivers/i3c/master/mipi-i3c-hci/debug.h    |  17 +
>  drivers/i3c/master/mipi-i3c-hci/dma.c      | 767 ++++++++++++++++
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 249 ++++++
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.h |  19 +
>  drivers/i3c/master/mipi-i3c-hci/hci.h      | 150 ++++
>  drivers/i3c/master/mipi-i3c-hci/ibi.h      |  42 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c      | 961 +++++++++++++++++++++
>  19 files changed, 4106 insertions(+)
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/Makefile
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd.h
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/core.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat.h
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat_v1.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct.h
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct_v1.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/debug.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/debug.h
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/dma.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.c
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.h
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci.h
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/ibi.h
>  create mode 100644 drivers/i3c/master/mipi-i3c-hci/pio.c
> 
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 4e80a1fcbf..eb5830923f 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -21,3 +21,16 @@ config DW_I3C_MASTER
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called dw-i3c-master.
> +
> +config MIPI_I3C_HCI
> +	tristate "MIPI I3C Host Controller Interface driver"
> +	depends on I3C
> +	help
> +	  Support for hardware following the MIPI Aliance's I3C Host Controller
> +	  Interface specification.
> +
> +	  For details please see:
> +	  https://www.mipi.org/specifications/i3c-hci
> +
> +	  This driver can also be built as a module.  If so, the module will be
> +	  called mipi-i3c-hci.
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 7eea9e0861..b892fd4caf 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
>  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
> +obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
> diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
> new file mode 100644
> index 0000000000..8349960c5b
> --- /dev/null
> +++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: BSD-3-Clause

Just out of curiosity, why this license?

> +
> +#ccflags-y := -DDEBUG

Probably a leftover?

> +
> +obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
> +mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
> +					   cmd_v1.o cmd_v2.o \
> +					   dat_v1.o dct_v1.o \
> +					   debug.o

[...]

> +#define CMD_C1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(63, 48), v)
> +#define CMD_C1_OFFSET(v)		FIELD_PREP(W1_MASK(47, 32), v)
> +#define CMD_C0_TOC			           W0_BIT_(31)
> +#define CMD_C0_ROC			           W0_BIT_(30)
> +#define CMD_C0_RNW			           W0_BIT_(29)
> +#define CMD_C0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
> +#define CMD_C0_16_BIT_SUBOFFSET		W0_bit(25)
> +#define CMD_C0_FIRST_PHASE_MODE		           W0_BIT_(24)
> +#define CMD_C0_DATA_LENGTH_POSITION(v)	FIELD_PREP(W0_MASK(23, 22), v)
> +#define CMD_C0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
> +#define CMD_C0_CP			           W0_BIT_(15)
> +#define CMD_C0_CMD(v)			FIELD_PREP(W0_MASK(14, 7), v)
> +#define CMD_C0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
> +
> +/*
> + * Internal Control Command
> + */
> +
> +#define CMD_0_ATTR_M			FIELD_PREP(CMD_0_ATTR, 0x7)
> +
> +#define CMD_M1_VENDOR_SPECIFIC		           W1_MASK(63, 32)
> +#define CMD_M0_MIPI_RESERVED		           W0_MASK(31, 12)
> +#define CMD_M0_MIPI_CMD			           W0_MASK(11, 8)
> +#define CMD_M0_VENDOR_INFO_PRESENT	           W0_BIT_(7)
> +#define CMD_M0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
> +
> +
> +static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
> +			       struct hci_xfer *xfer,
> +			       u8 ccc_addr, u8 ccc_cmd, bool raw)
> +{
> +	u_int dat_idx = 0;

I guess u_int her and below is not the preferred way to declare an unsigned int?

> +	int mode = hci_get_i3c_mode(hci);
> +	u8 *data = xfer->data;
> +	u_int data_len = xfer->data_len;
> +	bool rnw = xfer->rnw;
> +	int ret;
> +
> +	BUG_ON(raw);

It looks like 'raw' cannot be used with v1 (at least you seem to take
care of it in v2), so maybe BUG_ON is a bit radical here and you can
simply return an error? I think the use of BUG() is not appreciated in
general.

> +
> +	if (ccc_addr != I3C_BROADCAST_ADDR) {
> +		ret = i3c_hci_dat_get_index(hci, ccc_addr);
> +		if (ret < 0)
> +			return -ENODEV;
> +		dat_idx = ret;
> +	}
> +
> +	xfer->cmd_tid = hci_get_tid(4);
> +
> +	if (!rnw && data_len <= 4) {
> +		/* we use an Immediate Data Transfer Command */
> +		xfer->cmd_desc[0] =
> +			CMD_0_ATTR_I |
> +			CMD_I0_TID(xfer->cmd_tid) |
> +			CMD_I0_CMD(ccc_cmd) | CMD_I0_CP |
> +			CMD_I0_DEV_INDEX(dat_idx) |
> +			CMD_I0_DTT(data_len) |
> +			CMD_I0_MODE(mode);
> +		xfer->cmd_desc[1] = 0;
> +		switch (data_len) {
> +		case 4:
> +			xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_4(data[3]);
> +			fallthrough;
> +		case 3:
> +			xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_3(data[2]);
> +			fallthrough;
> +		case 2:
> +			xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_2(data[1]);
> +			fallthrough;
> +		case 1:
> +			xfer->cmd_desc[1] |= CMD_I1_DATA_BYTE_1(data[0]);
> +			fallthrough;
> +		case 0:
> +			break;
> +		}
> +		/* we consumed all the data in the cmd descriptor */
> +		xfer->data = NULL;
> +	} else {
> +		/* we use a Regular Data Transfer Command */
> +		xfer->cmd_desc[0] =
> +			CMD_0_ATTR_R |
> +			CMD_R0_TID(xfer->cmd_tid) |
> +			CMD_R0_CMD(ccc_cmd) | CMD_R0_CP |
> +			CMD_R0_DEV_INDEX(dat_idx) |
> +			CMD_R0_MODE(mode) |
> +			(rnw ? CMD_R0_RNW : 0);
> +		xfer->cmd_desc[1] =
> +			CMD_R1_DATA_LENGTH(data_len);
> +	}
> +
> +	return 0;
> +}

[...]

> +static int hci_cmd_v1_daa(struct i3c_hci *hci)
> +{
> +	struct hci_xfer *xfer;
> +	int ret, dat_idx = -1;
> +	u8 next_addr;
> +	u64 pid;
> +	u_int dcr, bcr;
> +	DECLARE_COMPLETION_ONSTACK(done);
> +
> +	xfer = hci_alloc_xfer(2);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Simple for now: we allocate a temporary DAT entry, do a single
> +	 * DAA, register the device which will allocate its own DAT entry
> +	 * via the core callback, then free the temporary DAT entry.
> +	 * Loop until there is no more devices to assign an address to.
> +	 * Yes, there is room for improvements.
> +	 */
> +	for (;;) {
> +		ret = i3c_hci_dat_alloc_entry(hci);
> +		if (ret < 0)
> +			break;
> +		dat_idx = ret;
> +		ret = i3c_master_get_free_addr(&hci->master, next_addr);
> +		if (ret < 0)
> +			break;
> +		next_addr = ret;
> +
> +		DBG("next_addr = 0x%02x, DAA using DAT %d", next_addr, dat_idx);
> +		i3c_hci_dat_set_dynamic_addr(hci, dat_idx, next_addr);
> +		i3c_hci_dct_index_reset(hci);
> +
> +		xfer->cmd_tid = hci_get_tid(4);
> +		xfer->cmd_desc[0] =
> +			CMD_0_ATTR_A |
> +			CMD_A0_TID(xfer->cmd_tid) |
> +			CMD_A0_CMD(I3C_CCC_ENTDAA) |
> +			CMD_A0_DEV_INDEX(dat_idx) |
> +			CMD_A0_DEV_COUNT(1) |
> +			CMD_A0_ROC | CMD_A0_TOC;
> +		xfer->cmd_desc[1] = 0;
> +		hci->io->queue_xfer(hci, xfer, 1);
> +		if (!wait_for_completion_timeout(&done, HZ) &&
> +		    hci->io->dequeue_xfer(hci, xfer, 1)) {
> +			ret = -ETIME;
> +			break;
> +		}
> +		if (RESP_STATUS(xfer[0].response) == RESP_ERR_NACK &&
> +		    RESP_STATUS(xfer[0].response) == 1) {
> +			ret = 0;  /* no more devices to be assigned */
> +			break;
> +		}
> +		if (RESP_STATUS(xfer[0].response) != RESP_SUCCESS) {
> +			ret = -EIO;
> +			break;
> +		}
> +
> +		i3c_hci_dct_get_val(hci, 0, &pid, &dcr, &bcr);
> +		DBG("assigned address %#x to device PID=0x%llx DCR=%#x BCR=%#x",
> +		    next_addr, pid, dcr, bcr);
> +
> +		i3c_hci_dat_free_entry(hci, dat_idx);
> +		dat_idx = -1;
> +
> +		/*
> +		 * TODO: Extend the subsystem layer to allow for registering
> +		 * new device and provide BCR/DCR/PID at the same time.

Not sure this is needed if you don't use it directly as the core will
anyway (in its current form) send the relevant CCC to read these
registers.

> +		 */
> +		ret = i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
> +		if (ret)
> +			break;
> +	}
> +
> +	if (dat_idx >= 0)
> +		i3c_hci_dat_free_entry(hci, dat_idx);
> +	hci_free_xfer(xfer, 1);
> +	return ret;
> +}
> +
> +const struct hci_cmd_ops i3c_hci_cmd_v1 = {
> +	.prep_ccc		= hci_cmd_v1_prep_ccc,
> +	.prep_i3c_xfer		= hci_cmd_v1_prep_i3c_xfer,
> +	.prep_i2c_xfer		= hci_cmd_v1_prep_i2c_xfer,
> +	.perform_daa		= hci_cmd_v1_daa,

I know Boris does not like such space alignment :)

> +};

[...]

> +void i3c_hci_resume(struct i3c_hci *hci)
> +{
> +	/* the HC_CONTROL_RESUME bit is R/W1C so just read and write back */
> +	reg_write(HC_CONTROL, reg_read(HC_CONTROL));
> +}
> +
> +/* located here rather than pio.c because needed bits are in core reg space */
> +void i3c_hci_pio_reset(struct i3c_hci *hci)
> +{
> +	reg_write(RESET_CONTROL, RX_FIFO_RST|TX_FIFO_RST|RESP_QUEUE_RST);

Style with missing spaces                  ^ ^

> +}
> +
> +/* located here rather than dct.c because needed bits are in core reg space */
> +void i3c_hci_dct_index_reset(struct i3c_hci *hci)
> +{
> +	reg_write(DCT_SECTION_OFFSET, FIELD_PREP(DCT_TABLE_INDEX, 0));
> +}
> +
> +static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
> +				struct i3c_ccc_cmd *ccc)
> +{
> +	struct i3c_hci *hci = to_i3c_hci(m);
> +	struct hci_xfer *xfer;
> +	bool raw = !!(hci->quirks & HCI_QUIRK_RAW_CCC);
> +	bool prefixed = raw && !!(ccc->id & I3C_CCC_DIRECT);
> +	u_int nxfers = ccc->ndests + prefixed;
> +	DECLARE_COMPLETION_ONSTACK(done);
> +	int i, last, ret = 0;
> +
> +	DBG("cmd=%#x rnw=%d ndests=%d data[0].len=%d",
> +	    ccc->id, ccc->rnw, ccc->ndests, ccc->dests[0].payload.len);
> +
> +	xfer = hci_alloc_xfer(nxfers);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	if (prefixed) {
> +		xfer->data = NULL;
> +		xfer->data_len = 0;
> +		xfer->rnw = false;
> +		hci->cmd->prep_ccc(hci, xfer, I3C_BROADCAST_ADDR,
> +				   ccc->id, true);
> +		xfer++;
> +	}
> +
> +	for (i = 0; i < nxfers - prefixed; i++) {
> +		xfer[i].data = ccc->dests[i].payload.data;
> +		xfer[i].data_len = ccc->dests[i].payload.len;
> +		xfer[i].rnw = ccc->rnw;
> +		ret = hci->cmd->prep_ccc(hci, &xfer[i], ccc->dests[i].addr,
> +					 ccc->id, raw);
> +		if (ret)
> +			goto out;
> +		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> +	}
> +	last = i - 1;
> +	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> +	xfer[last].completion = &done;
> +
> +	if (prefixed)
> +		xfer--;
> +
> +	ret = hci->io->queue_xfer(hci, xfer, nxfers);
> +	if (ret)
> +		goto out;
> +	if (!wait_for_completion_timeout(&done, HZ) &&
> +	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> +		ret = -ETIME;
> +		goto out;
> +	}
> +	for (i = prefixed; i < nxfers; i++) {
> +		if (ccc->rnw)
> +			ccc->dests[i - prefixed].payload.len =
> +				RESP_DATA_LENGTH(xfer[i].response);
> +		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
> +			ret = -EIO;
> +			goto out;
> +		}
> +	}
> +
> +#if 0
> +	if (ccc->rnw) {
> +		HEXDUMP("got: ", ccc->dests[0].payload.data,
> +				 ccc->dests[0].payload.len);
> +	}
> +#endif

I guess this debug block can be dropped too (there are many debug
information the should probably be dropped or turned into dev_info()
or similar).

> +
> +out:
> +	hci_free_xfer(xfer, nxfers);
> +	return ret;
> +}
> +
> +static int i3c_hci_daa(struct i3c_master_controller *m)
> +{
> +	struct i3c_hci *hci = to_i3c_hci(m);
> +
> +	DBG("");
> +
> +	return hci->cmd->perform_daa(hci);
> +}

[...]

> diff --git a/drivers/i3c/master/mipi-i3c-hci/debug.c b/drivers/i3c/master/mipi-i3c-hci/debug.c
> new file mode 100644
> index 0000000000..3885499119
> --- /dev/null
> +++ b/drivers/i3c/master/mipi-i3c-hci/debug.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, MIPI Alliance, Inc.
> + *
> + * Author: Nicolas Pitre <npitre@baylibre.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/i3c/master.h>
> +#include <linux/printk.h>
> +
> +#include "hci.h"
> +#include "debug.h"
> +
> +/*
> + * Paul Kimelman's debug trace log facility.
> + * This is completely vendor and hardware specific.
> + */
> +void __PK_debug_trace(struct i3c_hci *hci, const char *func)
> +{
> +	void __iomem *trcp = (void __iomem *)hci->vendor_data + 7*4;

Maybe you need to define what is 7*4 , 0*4 below, v >> 27, etc

Also there are many missing spaces between operators (7 * 4,w & (1 <<9).

> +	uint32_t idx, cycles, match;
> +	uint32_t trace_full = 1;
> +
> +	if (!hci->vendor_data)
> +		return;
> +
> +	idx = readl(trcp + 0*4);
> +	cycles = idx>>16;
> +	idx &= 0xFFFF;
> +	if (idx > 0xFFF) {
> +		pr_info("Trace count=%d, stored=%d; cycles=%d\n", idx, 0xFFF, cycles);
> +		match = (idx-1) & 0xFFF;
> +	} else {
> +		pr_info("Trace count=%d; cycles=%d\n", idx, cycles);
> +		match = idx;
> +		idx = 0;
> +	}
> +
> +	writel(idx | (trace_full << 31), trcp + 1*4); // 1st to read
> +	for (; idx != match; idx = (idx+1)&0xFFF) { // ring through it
> +		uint32_t v = readl(trcp + 1*4); // get trace word
> +		uint32_t up = trace_full ? readl(trcp + 1*4) : 0;
> +		char *e2 = (v&(1<<9))?"/NACK":"";
> +		char *e3 = (v&(1<<10))?"/WRABT":"";
> +		char *e4 = (v&(1<<11))?"/TERM":"";
> +		char *e5 = (v & (1<<7)) ? "/INVREQ" : "";
> +		char *e6 = (v & (1<<8)) ? "/TIMEOUT" : "";
> +		if (trace_full) {
> +			uint32_t cmd = up >> 16;
> +			pr_info("%-5d: ", up & 0xFFFF);
> +			if (cmd)
> +				pr_info("cmd=%s tid=%02X, TOC=%d, ROC=%d, %s %s addr=%X\n---",
> +					(cmd & (1<<2)) ? "Cmd" : "DAA",
> +					(cmd >> 3) & 0xF, cmd >> 31, (cmd >> 30) & 1,
> +					((cmd >> 7) & 1) ? "I2C" : "I3C",
> +					(cmd & (1<<8))?"Read ":"Write",
> +					(cmd >> 9) & 0x7F);
> +			else
> +				pr_cont("\n----");
> +		} else
> +			pr_info("%08X: ", v);
> +		pr_cont("#%3X: st=%03X,status=%02X%s%s%s%s%s%s%s%s%s%s%s%s\n", idx,
> +			v & 0x7F, (v >> 12) & 0xFFF, ((v >> 24) & 1) ? ", clrs" : "",
> +			((v >> 25) & 1) ? ", ERROR" : "", e2, e3, e4, e5, e6,
> +			((v >> 26) & 1) ? ",clre" : "", ((v >> 27) & 1) ? ", NACK" : "",
> +			((v >> 28) & 1) ? ", IN_DAA" : "",
> +			((v >> 29) & 1) ? ", IRQ" : "", ((v >> 30) & 1) ? ", cRSP" : "");
> +	}
> +	// clear trace index so can tell when we have new ones
> +	writel(0, trcp + 0*4);
> +}

[...]

> +static void hci_dma_cleanup(struct i3c_hci *hci)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +	struct hci_rh_data *rh;
> +	u_int i;
> +
> +	if (!rings)
> +		return;
> +
> +	for (i = 0; i < rings->total; i++) {
> +		rh = &rings->headers[i];
> +
> +		rh_reg_write(RING_CONTROL, 0);
> +		rh_reg_write(CR_SETUP, 0);
> +		rh_reg_write(IBI_SETUP, 0);
> +		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
> +
> +		if (rh->xfer)
> +			dma_free_coherent(&hci->master.dev,
> +					  rh->xfer_struct_sz * rh->xfer_entries,
> +					  rh->xfer, rh->xfer_phys);
> +		if (rh->resp)
> +			dma_free_coherent(&hci->master.dev,
> +					  rh->resp_struct_sz * rh->xfer_entries,
> +					  rh->resp, rh->resp_phys);
> +		kfree(rh->src_xfers);
> +		if (rh->ibi_status)
> +			dma_free_coherent(&hci->master.dev,
> +					  rh->ibi_status_sz * rh->ibi_status_entries,
> +					  rh->ibi_status, rh->ibi_status_phys);
> +		if (rh->ibi_data_phys)

I was told that _phys was a very bad suffix for something which is a
DMA address an not focibly a physical address.

> +			dma_unmap_single(&hci->master.dev, rh->ibi_data_phys,
> +					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
> +					 DMA_FROM_DEVICE);
> +		kfree(rh->ibi_data);
> +	}
> +
> +	rhs_reg_write(CONTROL, 0);
> +
> +	kfree(rings);
> +	hci->io_data = NULL;
> +}

[...]

> +static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> +				 struct hci_xfer *xfer_list, int n)
> +{
> +	struct hci_rings_data *rings = hci->io_data;
> +	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring];
> +	u_int i;
> +	bool did_unqueue = false;
> +
> +	/* stop the ring */
> +	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
> +	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
> +		/*
> +		 * We're deep in it if ever this condition is ever met.
> +		 * Hardware might still be writing to memory, etc.
> +		 */
> +		ERR("unable to abort the ring");
> +		BUG();

Why not just treating the error as always?

> +	}
> +
> +	for (i = 0; i < n; i++) {
> +		struct hci_xfer *xfer = xfer_list + i;
> +		int idx = xfer->ring_entry;
> +
> +		/*
> +		 * At the time the abort happened, the xfer might have
> +		 * completed already. If not then replace corresponding
> +		 * descriptor entries with a no-op.
> +		 */
> +		if (idx >= 0) {
> +			u32 *ring_data = rh->xfer + rh->xfer_struct_sz * idx;
> +
> +			/* store no-op cmd descriptor */
> +			*ring_data++ = FIELD_PREP(CMD_0_ATTR, 0x7);
> +			*ring_data++ = 0;
> +			if (hci->cmd == &i3c_hci_cmd_v2) {
> +				*ring_data++ = 0;
> +				*ring_data++ = 0;
> +			}
> +
> +			/* disassociate this xfer struct */
> +			rh->src_xfers[idx] = NULL;
> +
> +			/* and unmap it */
> +			hci_dma_unmap_xfer(hci, xfer, 1);
> +
> +			did_unqueue = true;
> +		}
> +	}
> +
> +	/* restart the ring */
> +	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
> +
> +	return did_unqueue;
> +}

[...]

> +/*
> + * Structure to represent a master initiated transfer.
> + * The rnw, data and data_len fields must be initialized before calling any
> + * hci->cmd->*() method. The cmd method will initialize cmd_desc[] and
> + * possibly modify (clear) the data field. Then xfer->cmd_desc[0] can
> + * be augmented with CMD_0_ROC and/or CMD_0_TOC.
> + * The completion field needs to be initialized before queueing with
> + * hci->io->queue_xfer(), and requires CMD_0_ROC to be set.
> + */
> +struct hci_xfer {
> +	u32 cmd_desc[4];
> +	u32 response;
> +	bool rnw;
> +	void *data;
> +	u_int data_len;
> +	u_int cmd_tid;
> +	struct completion *completion;
> +	union {
> +		struct {
> +			/* PIO specific */
> +			struct hci_xfer *next_xfer;
> +			struct hci_xfer *next_data;
> +			struct hci_xfer *next_resp;
> +			u_int data_left;
> +			u32 data_word_before_partial;
> +		};

I think anonymous unions are prohibited because the kernel is supposed
to be built with old gcc versions which do not support it.

> +		struct {
> +			/* DMA specific */
> +			dma_addr_t data_phys;
> +			u_int ring;
> +			int ring_entry;
> +		};
> +	};
> +};
> +
> +static inline struct hci_xfer *hci_alloc_xfer(u_int n)
> +{
> +	return kzalloc(sizeof(struct hci_xfer) * n, GFP_KERNEL);
> +}
> +
> +static inline void hci_free_xfer(struct hci_xfer *xfer, u_int n)
> +{
> +	kfree(xfer);
> +}
> +
> +


Thanks,
Miquèl
