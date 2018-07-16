From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: xilinx: zynq: Sort entries
 alphabetically
Date: Mon, 16 Jul 2018 09:34:02 -0600
Message-ID: <20180716153402.GA14804@rob-hp-laptop>
References: <20180712041024.20583-1-luaraneda@gmail.com>
 <20180712041024.20583-5-luaraneda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180712041024.20583-5-luaraneda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Araneda <luaraneda@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 12:10:22AM -0400, Luis Araneda wrote:
> Sort additional compatible strings (boards) alphabetically
> by their manufacturer and model number
> 
> This will help when finding a board because they
> will be grouped by their manufacturer
> 
> Signed-off-by: Luis Araneda <luaraneda@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/xilinx.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
