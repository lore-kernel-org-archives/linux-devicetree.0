From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: Document img,boston-clock binding
Date: Thu, 8 Jun 2017 17:20:47 -0500
Message-ID: <20170608222047.c27en4hqbqkqybin@rob-hp-laptop>
References: <20170602182003.16269-1-paul.burton@imgtec.com>
 <20170602182003.16269-2-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170602182003.16269-2-paul.burton@imgtec.com>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 02, 2017 at 11:20:00AM -0700, Paul Burton wrote:
> Add device tree binding documentation for the clocks provided by the
> MIPS Boston development board from Imagination Technologies, and a
> header file describing the available clocks for use by device trees &
> driver.
> 
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> 
> ---
> 
> Changes in v4:
> - Move img,boston-clock node under platform register syscon node.
> - Add MAINTAINERS entry.
> 
> Changes in v3: None
> 
> Changes in v2:
> - Add BOSTON_CLK_INPUT to expose the input clock.
> 
>  .../devicetree/bindings/clock/img,boston-clock.txt | 31 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++++
>  include/dt-bindings/clock/boston-clock.h           | 14 ++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/img,boston-clock.txt
>  create mode 100644 include/dt-bindings/clock/boston-clock.h

Reviewed-by: Rob Herring <robh@kernel.org>
