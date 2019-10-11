From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
Date: Fri, 11 Oct 2019 12:01:20 -0500
Message-ID: <20191011170120.GA15442@bogus>
References: <20191010020725.3990-1-andrew@aj.id.au>
 <20191010020725.3990-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191010020725.3990-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 10 Oct 2019 12:37:24 +1030, Andrew Jeffery wrote:
> The AST2600 has an explicit gate for the RMII RCLK for each of the four
> MACs.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
