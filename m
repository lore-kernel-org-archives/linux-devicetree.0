From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: Move Paralella board to Xilinx
Date: Mon, 16 Jul 2018 09:34:20 -0600
Message-ID: <20180716153420.GA15187@rob-hp-laptop>
References: <20180712041024.20583-1-luaraneda@gmail.com>
 <20180712041024.20583-6-luaraneda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180712041024.20583-6-luaraneda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Araneda <luaraneda@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 12:10:23AM -0400, Luis Araneda wrote:
> Move the Adapteva Parallela board to Xilinx dt-bindings,
> as it's based on a Zynq SoC from Xilinx
> 
> Signed-off-by: Luis Araneda <luaraneda@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/adapteva.txt | 7 -------
>  Documentation/devicetree/bindings/arm/xilinx.txt   | 3 +++
>  2 files changed, 3 insertions(+), 7 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/adapteva.txt

Reviewed-by: Rob Herring <robh@kernel.org>
