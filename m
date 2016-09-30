From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] mtd: spi nor: gets resource from HiSilicon Flash Memory Controller driver
Date: Fri, 30 Sep 2016 16:19:21 +0200
Message-ID: <201609301619.21674.arnd@arndb.de>
References: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com> <1475225971-30152-3-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475225971-30152-3-git-send-email-linshunquan1@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linshunquan 00354166 <linshunquan1@hisilicon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, dwmw2@infradead.org, computersforpeace@gmail.com, robh@kernel.org, xuejiancheng@hisilicon.com, cyrille.pitchen@atmel.com, ezequiel@vanguardiasur.com.ar, jteki@openedev.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, howell.yang@hisilicon.com, jalen.hsu@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, kevin.lixu@hisilicon.com, lvkuanliang@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Friday 30 September 2016, linshunquan 00354166 wrote:
> 
> From: Shunquan Lin <linshunquan1@hisilicon.com>
> 
> As the HiSilicon Flash Memory Controller(FMC) driver is a Multi-
> function device drivers(MFD) that not only support spi-nor flash
> controller, but spi-nand and nand, so moves the register map of
> HiSilicon spi-nor flash controller driver to
> include/linux/mfd/hisi_fmc.h
> 
> Signed-off-by: Shunquan Lin <linshunquan1@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/hisi-sfc.c | 86 +++---------------------------------------
>  1 file changed, 6 insertions(+), 80 deletions(-)

The patch seems incomplete, maybe forgot "git add" after a rebase?

	Arnd
