From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: add R8A77980 CPG core clock
 definitions
Date: Mon, 5 Feb 2018 00:08:43 -0600
Message-ID: <20180205060843.pwkfh5ntu6bj3d25@rob-hp-laptop>
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
 <4281b305-ff0d-cf56-ce6b-dff4589c39f6@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4281b305-ff0d-cf56-ce6b-dff4589c39f6@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 11:27:47PM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference the R8A77980
> CPG core clocks by index. The data come from the table 8.2e of the R-Car
> Series, 3rd Generation User's Manual: Hardware (Rev. 0.80, Oct, 2017),
> however I had to add the Z2 clock which is somehow present only on the
> figure 8.1e...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  include/dt-bindings/clock/r8a77980-cpg-mssr.h |   51 ++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> Index: renesas-drivers/include/dt-bindings/clock/r8a77980-cpg-mssr.h
> ===================================================================
> --- /dev/null
> +++ renesas-drivers/include/dt-bindings/clock/r8a77980-cpg-mssr.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0+

This should end with ' */' and be its own comment. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
