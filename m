From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2 v3] clk: qoriq: add more compatibles strings
Date: Mon, 5 Nov 2018 14:27:45 -0600
Message-ID: <20181105202745.GA21644@bogus>
References: <20181031065736.32719-1-andy.tang@nxp.com>
 <20181031065736.32719-2-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181031065736.32719-2-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: oss@buserror.net, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Yuantian Tang <andy.tang@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, 31 Oct 2018 14:57:36 +0800, Yuantian Tang wrote:
> Add more SoC compatible strings to support more chips.
> 
> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
> ---
> v3:
>   - undo deleting old bindings
>   - split the dts and driver to different patchset
> 
>  .../devicetree/bindings/clock/qoriq-clock.txt      |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
