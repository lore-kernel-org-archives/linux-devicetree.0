From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: shmobile: dt: Rename incorrect interrupt related
 binding
Date: Fri, 2 Oct 2015 11:20:23 +0900
Message-ID: <20151002022023.GA13404@verge.net.au>
References: <1443516188-3308-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443516188-3308-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, geert+renesas@glider.be, devicetree@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

[CCed linux-sh, Magnus]

On Tue, Sep 29, 2015 at 09:43:08AM +0100, Lee Jones wrote:
> interrupts-names => interrupt-names
> 
> Other line changes are re-aligning.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Thanks, I have queued this up as a cleanup for v4.4.

> ---
>  .../bindings/memory-controllers/renesas-memory-controllers.txt      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas-memory-controllers.txt b/Documentation/devicetree/bindings/memory-controllers/renesas-memory-controllers.txt
> index c64b792..9f78e6c 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/renesas-memory-controllers.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas-memory-controllers.txt
> @@ -24,9 +24,9 @@ Required properties:
>  Optional properties:
>    - interrupts: Must contain a list of interrupt specifiers for memory
>  		controller interrupts, if available.
> -  - interrupts-names: Must contain a list of interrupt names corresponding to
> -		      the interrupts in the interrupts property, if available.
> -		      Valid interrupt names are:
> +  - interrupt-names: Must contain a list of interrupt names corresponding to
> +		     the interrupts in the interrupts property, if available.
> +		     Valid interrupt names are:
>  			- "sec" (secure interrupt)
>  			- "temp" (normal (temperature) interrupt)
>    - power-domains: Must contain a reference to the PM domain that the memory
> -- 
> 1.9.1
> 
