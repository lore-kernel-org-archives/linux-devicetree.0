From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: dmaengine: sprd: Change channel id
 to slave id for DMA cell specifier
Date: Fri, 22 Feb 2019 14:42:12 -0600
Message-ID: <20190222204212.GA26859@bogus>
References: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, orsonzhai@gmail.com, zhang.lyra@gmail.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, eric.long@unisoc.com, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Feb 2019 13:34:40 +0800, Baolin Wang wrote:
> For Spreadtrum DMA engine, all channels are equal, which means slave can
> request any channels with setting a unique slave id to trigger this channel.
> 
> Thus we can remove the channel id from device tree to assign the channel
> dynamically, moreover we should add the slave id in device tree.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v1:
>  - Remove channel id from DT.
> ---
>  Documentation/devicetree/bindings/dma/sprd-dma.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
