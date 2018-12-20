From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: riscv: sifive: add documentation for
 the SiFive FU540
Date: Thu, 20 Dec 2018 14:57:22 -0600
Message-ID: <20181220205722.GA2072@bogus>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-3-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181215052154.24347-3-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 09:21:49PM -0800, Paul Walmsley wrote:
> Add DT binding documentation for the SiFive FU540 SoC.  This
> SoC is documented at:
> 
> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> 
> This file is originally based on
> Documentation/devicetree/bindings/arm/ti/k3.txt.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  .../devicetree/bindings/riscv/sifive/fu540.txt     | 14 ++++++++++++++
>  MAINTAINERS                                        |  9 +++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive/fu540.txt

Reviewed-by: Rob Herring <robh@kernel.org>

However, with 4.21 we're starting to use json-schema and top-level 
SoC/board bindings. Not requiring it yet, but feel free to convert to 
that if you want. Then we don't have to do it later.

Rob
