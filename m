From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 3/4] arm64: add support for i.MX8M EVK board
Date: Fri, 23 Feb 2018 11:46:53 +0800
Message-ID: <20180223034652.GM3217@dragon>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
 <20180201183126.32384-3-l.stach@pengutronix.de>
 <20180205072438.nxvhlqk54d7firbz@sapphire.tkos.co.il>
 <1517829046.3175.9.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1517829046.3175.9.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, "A . s . Dong" <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Mon, Feb 05, 2018 at 12:10:46PM +0100, Lucas Stach wrote:
> I've pushed a branch with all the MX8M work to:
> https://git.pengutronix.de/git/lst/linux mx8-work

I have some problem to boot the kernel (and dtb) built from this branch.
I'm running an U-Boot from NXP which works fine with NXP kernel for
sure.  But using this U-Boot to load your kernel gives me nothing on
serial, even if I put 'earlycon=ec_imx6q,0x30860000' on kernel
cmdline.  Anything I'm missing here?  Thanks.

Shawn

---8<--------------------------

U-Boot 2017.03-00779-g777f3b0e3c60 (Jan 31 2018 - 13:54:54 +0800)

CPU:   Freescale i.MX8MQ rev2.0 1500 MHz (running at 1000 MHz)
CPU:   Commercial temperature grade (0C to 95C) at 30C
Reset cause: POR
Model: Freescale i.MX8MQ EVK
DRAM:  3 GiB
MMC:   FSL_SDHC: 0, FSL_SDHC: 1
In:    serial
Out:   serial
Err:   serial

 BuildInfo:
  - ATF 0
  - U-Boot 2017.03-00779-g777f3b0e3c60

switch to partitions #0, OK
mmc1 is current device
Net:   eth0: ethernet@30be0000
Normal Boot
Hit any key to stop autoboot:  0 
u-boot=> tftpboot 0x42000000 Image; tftpboot 0x48000000 imx8mq-evk.dtb;
booti 0x42000000 - 0x48000000
Using ethernet@30be0000 device
TFTP from server 192.168.0.102; our IP address is 192.168.0.110
Filename 'Image'.
Load address: 0x42000000
Loading:
#################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         #################################################################
         ###########################################
         10.1 MiB/s
done
Bytes transferred = 17803776 (10faa00 hex)
Using ethernet@30be0000 device
TFTP from server 192.168.0.102; our IP address is 192.168.0.110
Filename 'imx8mq-evk.dtb'.
Load address: 0x48000000
Loading: #
         6.2 MiB/s
done
Bytes transferred = 12999 (32c7 hex)
## Flattened Device Tree blob at 48000000
   Booting using the fdt blob at 0x48000000
   reserving fdt memory region: addr=40000000 size=20000
   Using Device Tree in place at 0000000048000000, end 00000000480062c6

Starting kernel ...
