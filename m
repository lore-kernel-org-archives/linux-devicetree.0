From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Date: Wed, 9 Jan 2019 11:49:27 +0100
Message-ID: <20190109104922.z6g772vgncdqqbqt@verge.net.au>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 06, 2018 at 09:46:47PM +0100, Marek Vasut wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds SDHI{0,1,3} device nodes for the r8a77990 SoC
> and enables SD card slot connected to SDHI0, micro SD card slot
> connected to SDHI1 and eMMC connected to SDHI3 on the Ebisu board
> using the R8A77990 SoC.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Deduplicated regular and UHS pins
>     - Added sdhi3_ds pin pinmux
> V3: - Squash two patches, one adding SDHI nodes to R8A77990 E3 DTSI
>       and another enabling them on E3 Ebisu, together.

Hi,

I am wondering if something special is required in order to use eMMC
connected to SDHI3. Using renesas-drivers-2019-01-08-v5.0-rc1 I do not see
that device initialised to the point where a corresponding block device is
present.

[    0.000127] NOTICE:  BL2: R-Car Gen3 Initial Program Loader(CA53)
Rev.1.0.21
[    0.005703] NOTICE:  BL2: PRR is R-Car E3 Ver.1.0
[    0.010361] NOTICE:  BL2: PLL1 nonSSCG Clock select
[    0.015356] NOTICE:  BL2: Board is Ebisu-4D Rev.1.0
[    0.020041] NOTICE:  BL2: Boot device is HyperFlash(80MHz)
[    0.025479] NOTICE:  BL2: LCM state is CM
[    0.029445] NOTICE:  BL2: 0x400000000 - 0x480000000, 2 GiB
[    0.034877] NOTICE:  BL2: DDR1856(rev.0.07)NOTICE:  ..0
[    0.040425] NOTICE:  BL2: DRAM Split is OFF
[    0.044304] NOTICE:  BL2: QoS is default setting(rev.0.02)
[    0.049748] NOTICE:  BL2: DRAM refresh interval 3.9 usec
[    0.055089] NOTICE:  BL2: v1.4(release):15dba6b-dirty
[    0.060029] NOTICE:  BL2: Built : 04:48:01, Jun 26 2018
[    0.065217] NOTICE:  BL2: Normal boot
[    0.068872] NOTICE:  BL2: dst=0xe6311d00 src=0x8180000 len=512(0x200)
[    0.075247] NOTICE:  BL2: dst=0x43f00000 src=0x8180400 len=6144(0x1800)
[    0.081874] NOTICE:  BL2: dst=0x44000000 src=0x81c0000 len=65536(0x10000)
[    0.089118] NOTICE:  BL2: dst=0x44100000 src=0x8200000 len=1048576(0x100000)
[    0.103992] NOTICE:  BL2: dst=0x50000000 src=0x8640000 len=1048576(0x100000)

# dmesg | egrep "(sd|mmc)"
[    2.872441] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    2.878587] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    2.885806] renesas_sdhi_internal_dmac ee120000.sd: Got CD GPIO
[    2.893284] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    2.901602] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    2.909708] renesas_sdhi_internal_dmac ee160000.sd: Failed getting OCR mask: 0
[    2.917236] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.1
[    2.925214] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.2
[    3.295711] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    3.301808] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    3.308042] renesas_sdhi_internal_dmac ee100000.sd: Linked as a consumer to regulator.4
[    3.316268] renesas_sdhi_internal_dmac ee100000.sd: Linked as a consumer to regulator.6
[    3.373714] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0xee100000 max clock rate 200 MHz
[    3.384547] renesas_sdhi_internal_dmac ee120000.sd: Got CD GPIO
[    3.390915] renesas_sdhi_internal_dmac ee120000.sd: Linked as a consumer to regulator.5
[    3.399171] renesas_sdhi_internal_dmac ee120000.sd: Linked as a consumer to regulator.7
[    3.456829] renesas_sdhi_internal_dmac ee120000.sd: mmc1 base at 0xee120000 max clock rate 200 MHz
[    3.468133] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    3.476448] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    3.484635] renesas_sdhi_internal_dmac ee160000.sd: Failed getting OCR mask: 0
[    3.492147] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.1
[    3.500110] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.2
[    3.562322] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    3.570834] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    3.579021] renesas_sdhi_internal_dmac ee160000.sd: Failed getting OCR mask: 0
[    3.586657] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.1
[    3.594653] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.2
[    3.640782] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    3.649110] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    3.657213] renesas_sdhi_internal_dmac ee160000.sd: Failed getting OCR mask: 0
[    3.664677] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.1
[    3.672599] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.2
[    3.688811] mmc0: new ultra high speed SDR104 SDXC card at address 0007
[    3.698572] mmcblk0: mmc0:0007 SL64G 58.3 GiB 
[    3.726399]  mmcblk0: p1
[    3.763694] mmc1: new ultra high speed SDR104 SDHC card at address 0001
[    3.772525] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    3.781623] mmcblk1: mmc1:0001 00000 29.8 GiB 
[    3.786779] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    3.795548] renesas_sdhi_internal_dmac ee160000.sd: Failed getting OCR mask: 0
[    3.803099] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.1
[    3.811006]  mmcblk1: p1
[    3.815437] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.2
[    3.856991] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.2
[    3.865263] renesas_sdhi_internal_dmac ee160000.sd: Linked as a consumer to regulator.1
[    3.873371] renesas_sdhi_internal_dmac ee160000.sd: Failed getting OCR mask: 0
[    3.880864] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.1
[    3.888786] renesas_sdhi_internal_dmac ee160000.sd: Dropping the link to regulator.2
