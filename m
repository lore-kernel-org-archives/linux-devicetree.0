From: Liang Yang <liang.yang@amlogic.com>
Subject: Re: [PATCH v7 0/2] mtd: rawnand: meson: add Amlogic NAND driver
 support
Date: Mon, 26 Nov 2018 14:39:58 +0800
Message-ID: <9c340a88-06a1-2b81-f435-f9da338077ba@amlogic.com>
References: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542386439-30166-1-git-send-email-jianxin.pan@amlogic.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>, Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Yixun Lan <yixun.lan@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Boris and Miquel,

How about the v7 patch?

On 2018/11/17 0:40, Jianxin Pan wrote:
> These two patches try to add initial NAND driver support for Amlogic Meson
> SoCs, current it has been tested on GXL(p212) and AXG(s400) platform.
> 
> Changes since V6 at [7]
>   - use timings->tBERS_max as the maximum time out, delete NFC_CMD_RB_TIMEOUT
>   - fix nand_rw_cmd and support small block flash and which row address less than 3
>   - fix coding style
>   - replace readl/writel_* with readl/writel_relaxed*
>   - delete ECC_SET_PROTECTED_OOB_BYTE and ECC_GET_PROTECTED_OOB_BYTE
>   - implement dma access for read_buf and write_buf, more efficient.
>   - delete waiting dma finish in write process and let NAND_CMD_PAGEPROG and
> RB command go on queuing
>   - add waiting the completed flag of last ecc page be set, for more strict
> 
