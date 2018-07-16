From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: Add S700 support for Actions
 Semi Soc's
Date: Mon, 16 Jul 2018 09:20:27 -0600
Message-ID: <20180716152027.GA28696@rob-hp-laptop>
References: <20180715203524.11948-1-sravanhome@gmail.com>
 <20180715203524.11948-3-sravanhome@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180715203524.11948-3-sravanhome@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravanan Sekar <sravanhome@gmail.com>
Cc: afaerber@suse.de, manivannan.sadhasivam@linaro.org, sboyd@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, thomas.liau@actions-semi.com, darren@cubietech.com, jeff.chen@actions-semi.com, pn@denx.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mp-cs@actions-semi.com
List-Id: devicetree@vger.kernel.org

On Sun, Jul 15, 2018 at 10:35:21PM +0200, Saravanan Sekar wrote:
> Add clock bindings constants for action S700
> Maintain common clock dt-bindings for Actions Semi SoC's
> S700 and S900.
> 
> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
> ---
>  ...tions,s900-cmu.txt => actions,owl-cmu.txt} |  20 +--
>  include/dt-bindings/clock/actions,s700-cmu.h  | 118 ++++++++++++++++++
>  2 files changed, 129 insertions(+), 9 deletions(-)
>  rename Documentation/devicetree/bindings/clock/{actions,s900-cmu.txt => actions,owl-cmu.txt} (68%)
>  create mode 100644 include/dt-bindings/clock/actions,s700-cmu.h

Reviewed-by: Rob Herring <robh@kernel.org>
