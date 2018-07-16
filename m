From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: xilinx: zynq: Improve boards
 description
Date: Mon, 16 Jul 2018 09:33:37 -0600
Message-ID: <20180716153337.GA14237@rob-hp-laptop>
References: <20180712041024.20583-1-luaraneda@gmail.com>
 <20180712041024.20583-4-luaraneda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180712041024.20583-4-luaraneda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Araneda <luaraneda@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 12:10:21AM -0400, Luis Araneda wrote:
> Change the description of some boards to make it similar
> to the value of the model property from their respective
> device-tree, using the format "<manufacturer> <model>"
> 
> Signed-off-by: Luis Araneda <luaraneda@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/xilinx.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
