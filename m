From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] clocksource: sh_tmu: Document r8a7778 binding
Date: Mon, 27 Oct 2014 09:24:16 +0900
Message-ID: <20141027002415.GI25692@verge.net.au>
References: <1414150312-5542-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414150312-5542-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 01:31:52PM +0200, Geert Uytterhoeven wrote:
> The r8a7778 is very similar to the r8a7779, and already handled by
> the current driver in the non-DT case.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This depends on "clocksource: sh_tmu: Document R-Mobile r8a7740 binding"
> 
>  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> index 4ae7910af09ffcb4..cd5f20bf2582e742 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> @@ -10,6 +10,7 @@ Required Properties:
>  
>    - compatible: must contain one or more of the following:
>      - "renesas,tmu-r8a7740" for the r8a7740 TMU
> +    - "renesas,tmu-r8a7778" for the r8a7778 TMU
>      - "renesas,tmu-r8a7779" for the r8a7779 TMU
>      - "renesas,tmu" for any TMU.
>        This is a fallback for the above renesas,tmu-* entries

Thanks, I have queued this up.
