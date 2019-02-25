From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: dmaengine: sprd: Change channel id
 to slave id for DMA cell specifier
Date: Mon, 25 Feb 2019 12:11:40 +0530
Message-ID: <20190225064140.GD31146@vkoul-mobl>
References: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <652a8ef9554890c254823ec39858b8d7413fd561.1550719757.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, orsonzhai@gmail.com, zhang.lyra@gmail.com, dan.j.williams@intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, eric.long@unisoc.com, broonie@kernel.org
List-Id: devicetree@vger.kernel.org

On 21-02-19, 13:34, Baolin Wang wrote:
> For Spreadtrum DMA engine, all channels are equal, which means slave can
> request any channels with setting a unique slave id to trigger this channel.
> 
> Thus we can remove the channel id from device tree to assign the channel
> dynamically, moreover we should add the slave id in device tree.

Applied, thanks

-- 
~Vinod
