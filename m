From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3 v2] clk: qoriq: remove legacy bindings and add more
 compatibles
Date: Wed, 24 Oct 2018 17:10:33 -0500
Message-ID: <20181024221033.GA5876@bogus>
References: <20181024021122.3942-1-andy.tang@nxp.com>
 <20181024021122.3942-2-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181024021122.3942-2-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.tang@nxp.com
Cc: sboyd@kernel.org, mturquette@baylibre.com, oss@buserror.net, mark.rutland@arm.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 24, 2018 at 10:11:21AM +0800, andy.tang@nxp.com wrote:
> From: Yuantian Tang <andy.tang@nxp.com>
> 
> The new bindings will be used, so delete the old bindings.
> Add more SOC compatibles as needed as well.

I'm a bit confused by this series. Normally you want to update the dts 
files first and wait some period of time before removing driver support 
(and bindings).

Rob

> 
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> ---
> v2:
>   - involve more chips
> 
>  .../devicetree/bindings/clock/qoriq-clock.txt      |  112 +------------------
>  1 files changed, 6 insertions(+), 106 deletions(-)
