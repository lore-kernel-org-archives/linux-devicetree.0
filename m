From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: clk: add documentation for the
 SiFive PRCI driver
Date: Fri, 26 Apr 2019 16:44:36 -0500
Message-ID: <20190426214436.GA29815@bogus>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
 <20190411082733.3736-3-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190411082733.3736-3-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Paul Walmsley <paul@pwsan.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Megan Wachs <megan@sifive.com>
List-Id: devicetree@vger.kernel.org

On Thu, 11 Apr 2019 01:27:34 -0700, Paul Walmsley wrote:
> Add DT binding documentation for the Linux driver for the SiFive
> PRCI clock & reset control IP block, as found on the SiFive
> FU540 chip.
> 
> This version includes changes requested by Stephen Boyd
> <sboyd@kernel.org> and Rob Herring <robh@kernel.org>, and
> fixes some errors in the initial version.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/clock/sifive/fu540-prci.txt      | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
