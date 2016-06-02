From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] Axi-usb: Add support for 64-bit addressing.
Date: Thu, 2 Jun 2016 17:58:15 -0500
Message-ID: <20160602225815.GA5508@rob-hp-laptop>
References: <1464626798-1334-1-git-send-email-navam@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464626798-1334-1-git-send-email-navam@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, balbi@ti.com, gregkh@linuxfoundation.org, hyun.kwon@xilinx.com, navam@xilinx.com, radhey.shyam.pandey@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 30, 2016 at 10:16:38PM +0530, Nava kishore Manne wrote:
> This patch updates the driver to support 64-bit DMA addressing.
> 
> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> ---
> Changes for v4:
> 		-Used boolen property insted of addrwith property in the DT
> 		 as suggested by Arnd Bergmann.
> 		-Adopt the DT relevant changes into the driver.
> 
> Changes for v3:
>                 -Added new compatable string for 5.00 IP version as suggested by
>                  Arnd Bergmann.
>                 -Used write_fn() insted of lo_hi_writeq() as suggested by
>                  Arnd Bergmann.
> 
> Changes for v2:
>                 -Added dma-ranges property in device tree as suggested by Arnd Bergmann.
>                 -Modified the driver code based on the xlnx,addrwidth.
> 
>  .../devicetree/bindings/usb/udc-xilinx.txt         |  5 ++-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/usb/gadget/udc/udc-xilinx.c                | 52 +++++++++++++++++++++-
>  2 files changed, 54 insertions(+), 3 deletions(-)
