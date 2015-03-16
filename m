From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Mon, 16 Mar 2015 12:58:09 -0700
Message-ID: <550735D1.7030308@gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com> <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

[snip]

> +static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
> +			      u32 len, u8 dma_cmd)
> +{
> +	struct brcmnand_controller *ctrl = host->ctrl;
> +	dma_addr_t buf_pa;
> +	int dir = dma_cmd == CMD_PAGE_READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +
> +	buf_pa = dma_map_single(ctrl->dev, buf, len, dir);

We are missing a dma_mapping_error() check here.
-- 
Florian
