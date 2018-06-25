From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] dts: bindings: Document device tree binding for
 CATU
Date: Mon, 25 Jun 2018 14:46:12 -0600
Message-ID: <20180625204612.GA15054@rob-hp-laptop>
References: <20180625112213.23492-1-suzuki.poulose@arm.com>
 <20180625112213.23492-5-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180625112213.23492-5-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org, frowand.list@gmail.com, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2018 at 12:22:11PM +0100, Suzuki K Poulose wrote:
> Document CATU device-tree bindings. CATU augments the TMC-ETR
> by providing an improved Scatter Gather mechanism for streaming
> trace data to non-contiguous system RAM pages.
> 
> Cc: devicetree@vger.kernel.org
> Cc: frowand.list@gmail.com
> Cc: Rob Herring <robh@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../devicetree/bindings/arm/coresight.txt          | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
