From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7] Add support for the Allwinner A31 DMA Controller
Date: Thu, 24 Apr 2014 16:22:43 +0200
Message-ID: <1398349364-10726-1-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBQ554SNAKGQEFNQR4JI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patchset adds support for the DMA controller found in the
Allwinner A31 and A23 SoCs.

This has been tested using the newly introduced SPI driver on an A31
EVK. Support for DMA-driven SPI transfers will be the subject of
another patch serie.

Since this serie has been sent for the first time about 2 monthes ago,
and I never got any comments from the DMA maintainer, yet gathering
some Acked-by, I expect this to be merged quite quickly.

Thanks,
Maxime

Changes from v6:
  - Dropped the merged patches and the clock patches that are pretty
    orthogonal to this driver

Changes from v5:
  - Rebased on top of 3.15-rc1

Changes from v4:
  - Removed the packed attribute on the LLI
  - Switched to using a NULL device pointer in clk_get on PLL6 and
    AHB1 mux to make explicit that we are getting global clocks
  - Switched from spin_lock_irqsave to spin_lock in the interrupt
    handler
  - Various nitpicks from Andy Shevchenko:
    + Switched to using %p printk formats for pointers
    + Inverted some tests to lose a level of indentation
    + Dropped ifdef DEBUG protecting calls to dev_dbg

Changes from v3:
  - A few other comments made by Andy Shevchenko were fixed:
    + Used references in %pa* printk formats
    + Used is_slave_direction in prep_slave_sg to make sure we were
      actually called for something, and to avoid making assumptions
      that we were actually called with the expected directions
    + A few others minor fixes: s/pr_err/dev_err/, etc.

Changes from v2:
  - Removed the clk_put calls in the clock protection functions
  - Splitted out the sunxi machines into several files
  - Moved the clock protection code into these new machine files
  - Moved the PLL6 reparenting to the DMA driver
  - Addressed various comments from Andy Shevchenko: switched to using
    devm_kcalloc, used correct printk formats for physical and DMA
    addresses, etc.

Changes from v1:
  - Removed the clk_put call in the clocks protecting patches
  - Minor fixes here and there as suggested by Andy Shevchenko: switch
    to dmam_pool_create, switch to dev_dbg instead of pr_debug, etc.


Maxime Ripard (1):
  DMA: sun6i: Add driver for the Allwinner A31 DMA controller

 .../devicetree/bindings/dma/sun6i-dma.txt          |  45 +
 drivers/dma/Kconfig                                |   8 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/sun6i-dma.c                            | 987 +++++++++++++++++++++
 4 files changed, 1041 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sun6i-dma.txt
 create mode 100644 drivers/dma/sun6i-dma.c

-- 
1.9.1
