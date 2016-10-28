From: Joshua Clayton <stillcompiling@gmail.com>
Subject: Re: [PATCH v2 3/5] fpga manager: Add cyclone-ps-spi driver for Altera
 FPGAs
Date: Fri, 28 Oct 2016 14:05:36 -0700
Message-ID: <7f36c345-b4f9-60b2-5f88-99fa7ec31119@gmail.com>
References: <201610290422.JEtRRTFh%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201610290422.JEtRRTFh%fengguang.wu@intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kbuild test robot <lkp@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Moritz Fischer <moritz.fischer@ettus.com>, devicetree@vger.kernel.org, Alan Tull <atull@opensource.altera.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Dang it!

This was flagged last time around and I forgot to fix it.

On 10/28/2016 01:41 PM, kbuild test robot wrote:
> Hi Joshua,
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.9-rc2 next-20161028]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> [Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
> [Check https://git-scm.com/docs/git-format-patch for more information]
>
> url:    https://github.com/0day-ci/linux/commits/Joshua-Clayton/lib-add-bitrev8x4/20161029-012535
> config: openrisc-allmodconfig (attached as .config)
> compiler: or32-linux-gcc (GCC) 4.5.1-or32-1.0rc1
> reproduce:Dang it!
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=openrisc 
>
> All errors (new ones prefixed by >>):
>
>    drivers/fpga/cyclone-ps-spi.c: In function 'cyclonespi_write':
>    drivers/fpga/cyclone-ps-spi.c:89:19: error: 'SZ_4K' undeclared (first use in this function)
>    drivers/fpga/cyclone-ps-spi.c:89:19: note: each undeclared identifier is reported only once for each function it appears in
>>> drivers/fpga/cyclone-ps-spi.c:89:19: error: type defaults to 'int' in declaration of '__UNIQUE_ID_min2_15'
> vim +89 drivers/fpga/cyclone-ps-spi.c
>
>     83		struct cyclonespi_conf *conf = (struct cyclonespi_conf *)mgr->priv;
>     84		const char *fw_data = buf;
>     85		const char *fw_data_end = fw_data + count;
>     86	
>     87		while (fw_data < fw_data_end) {
>     88			int ret;
>   > 89			size_t stride = min(fw_data_end - fw_data, SZ_4K);
>     90	
>     91			rev_buf((void *)fw_data, stride);
>     92			ret = spi_write(conf->spi, fw_data, stride);
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
Thanks, kbuild test robot.
Will fix this time.
