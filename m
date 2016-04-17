From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Axi-usb: Add support for 64-bit addressing.
Date: Sun, 17 Apr 2016 16:09:30 +0200
Message-ID: <5220051.FEUC6vJBCk@wuerfel>
References: <201604111626.g2x2SCHX%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201604111626.g2x2SCHX%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: Nava kishore Manne <nava.manne@xilinx.com>, kbuild-all@01.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, balbi@ti.com, gregkh@linuxfoundation.org, hyun.kwon@xilinx.com, navam@xilinx.com, radhey.shyam.pandey@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 11 April 2016 16:08:14 kbuild test robot wrote:
> 
>    230   * @offset: register offset
>    231   * @val: data to be written
>    232   **/
>    233  static void xudc_write64(void __iomem *addr, u32 offset, u64 val)
>    234  {
>    235  #if defined(CONFIG_PHYS_ADDR_T_64BIT)
>  > 236          writeq(val, addr + offset);
>    237  #endif
>    238  }
> 

I think you want lo_hi_writeq() rather than writeq().

	Arnd
