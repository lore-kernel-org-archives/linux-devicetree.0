From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 7/7] ARM: sun6i: dt: Add A31 DMA controller to DTSI
Date: Wed, 23 Apr 2014 14:35:03 +0200
Message-ID: <201404231435.03920.arnd@arndb.de>
References: <1394723659-4995-1-git-send-email-maxime.ripard@free-electrons.com> <1394723659-4995-8-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394723659-4995-8-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Emilio Lopez <emilio@elopez.com.ar>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, zhuzhenhua@allwinnertech.com, shuge@allwinnertech.com, linux-sunxi@googlegroups.com, kevin.z.m.zh@gmail.com, sunny@allwinnertech.com, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 13 March 2014, Maxime Ripard wrote:
> Now that we have a DMA driver, we can add the DMA bindings in the DTSI for the
> controller and the devices supported that can use DMA.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

But why does this patch have to wait for the driver to get merged?
