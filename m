From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v8 2/3] mtd: spi-nor: add rockchip serial flash
 controller driver
Date: Fri, 18 May 2018 13:21:43 +0200
Message-ID: <20180518132143.3105f301@bbrezillon>
References: <1518091958-3672-1-git-send-email-andy.yan@rock-chips.com>
        <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Yan <andy.yan@rock-chips.com>
Cc: cyrille.pitchen@wedev4u.fr, mchehab@kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, shawn.lin@rock-chips.com, heiko@sntech.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Sorry for the late reply.

On Thu,  8 Feb 2018 20:18:47 +0800
Andy Yan <andy.yan@rock-chips.com> wrote:

> From: Shawn Lin <shawn.lin@rock-chips.com>

Commit message please.

> 
> Add Rockchip SFC(serial flash controller) driver.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> 
> ---
> 
> Changes in v8:
> - remove unused macro SFC_CMD_TRAN_BYTES_MASK
> - set max transfer length to 15.5KB
> - remove unnecessary buffer align check
> - remove the duplicate logic what spi-nor.c already does for spi_nor_write
> - add spi_nor_erase, as the SFC should get the erase address.

Would you mind sending a new version addressing the problem reported by
kbuild robots and the comments made by Ezequiel and Robin?

Also, maybe it's too much work, but it would be good to check if the
driver could use the spi_mem interface [1] so that you can move it to
drivers/spi/ and possibly get everything ready for SPI NANDs.

Thanks,

Boris

[1]https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/tree/include/linux/spi/spi-mem.h?h=for-4.18
