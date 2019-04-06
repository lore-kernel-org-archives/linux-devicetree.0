From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: sifive: add FU540-C000 PRCI clock constants
Date: Sat, 06 Apr 2019 01:07:19 -0500
Message-ID: <5ca8421a.1c69fb81.a620b.5a7f@mx.google.com>
References: <20190404003820.10679-1-paul.walmsley@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404003820.10679-1-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, wesley@sifive.com, palmer@sifive.com
List-Id: devicetree@vger.kernel.org

On Wed,  3 Apr 2019 17:38:20 -0700, Paul Walmsley wrote:
> Add preprocessor macros for the important PRCI output clocks
> that are needed by both the FU540 PRCI driver and DT data.
> Details are available in the FU540 manual in Chapter 7 of
> 
>     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> ---
> Rob, Mark: this patch is a prerequisite for both the FU540 DT data
> and for the FU540 PRCI clock driver patch series.  To prevent one
> of those patch series from depending on the other, I'd like to ask
> Palmer to merge this patch in one of his -rc pull requests.  Could
> I get an ack from one or both of you for this purpose?  Thanks.
> 
> include/dt-bindings/clock/sifive-fu540-prci.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sifive-fu540-prci.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
