From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] MIPS: ralink: add mt7621-clk.h for device tree binding
Date: Thu, 13 Jun 2019 15:34:12 -0600
Message-ID: <20190613213412.GA4156@bogus>
References: <20190516072731.21957-1-gch981213@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190516072731.21957-1-gch981213@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>, Weijie Gao <hackpascal@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 16 May 2019 15:25:51 +0800, Chuanhong Guo wrote:
> This patch adds dt binding header for mediatek,mt7621-pll which
> was added in:
> commit e6046b5e69a0 ("MIPS: ralink: fix cpu clock of mt7621 and add dt clk devices")
> 
> Signed-off-by: Weijie Gao <hackpascal@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
> 
> checkpatch.pl shows a warning that the line referencing old commit
> is over 75 chars but if I shink it down anyhow it gave me an error
> saying I should use a proper style for commits. So I chose to ignore
> the warning and fix the error.
> 
>  include/dt-bindings/clock/mt7621-clk.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt7621-clk.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
