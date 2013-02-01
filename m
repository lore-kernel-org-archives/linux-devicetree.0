From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 1/4] DMA: PL330: Add xlate function
Date: Fri, 1 Feb 2013 14:57:16 +0000
Message-ID: <201302011457.16711.arnd@arndb.de>
References: <1359723116-18173-1-git-send-email-padma.v@samsung.com> <1359723116-18173-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1359723116-18173-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org
List-Id: devicetree@vger.kernel.org

On Friday 01 February 2013, Padmavathi Venna wrote:
> 
> Add xlate to translate the device-tree binding information into
> the appropriate format. The filter function requires the dma
> controller device and dma channel number as filter_params.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
