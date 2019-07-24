From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 5/7] dt-bindings: timer: renesas, cmt: Update R-Car Gen3
 CMT1 usage
Date: Wed, 24 Jul 2019 13:13:16 +0200
Message-ID: <20190724111316.nrkfzeh4e7nwdtau@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345031152.5307.4388075759256453367.sendpatchset@octo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <156345031152.5307.4388075759256453367.sendpatchset@octo>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, geert+renesas@glider.be, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 08:45:11PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> The R-Car Gen3 SoCs so far come with a total for 4 on-chip CMT devices:
>  - CMT0
>  - CMT1
>  - CMT2
>  - CMT3
> 
> CMT0 includes two rather basic 32-bit timer channels. The rest of the on-chip
> CMT devices support 48-bit counters and have 8 channels each.
> 
> Based on the data sheet information "CMT2/3 are exactly same as CMT1"
> it seems that CMT2 and CMT3 now use the CMT1 compat string in the DTSI.
> 
> Clarify this in the DT binding documentation by describing R-Car Gen3 and
> RZ/G2 CMT1 as "48-bit CMT devices".
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
