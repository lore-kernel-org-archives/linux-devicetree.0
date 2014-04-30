From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 01/11] ARM: shmobile: r7s72100: document MSTP clock
 support
Date: Wed, 30 Apr 2014 10:41:48 +0900
Message-ID: <20140430014148.GC24989@verge.net.au>
References: <1398765822-2314-1-git-send-email-wsa@the-dreams.de>
 <1398765822-2314-2-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398765822-2314-2-git-send-email-wsa@the-dreams.de>
Sender: linux-sh-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 29, 2014 at 12:03:32PM +0200, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> index 02a25d99ca61..6c3c0847e4fd 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> @@ -10,6 +10,7 @@ index in the group, from 0 to 31.
>  Required Properties:
>  
>    - compatible: Must be one of the following
> +    - "renesas,r7s72100-mstp-clocks" for R7S72100 (RZ) MSTP gate clocks
>      - "renesas,r8a7790-mstp-clocks" for R8A7790 (R-Car H2) MSTP gate clocks
>      - "renesas,r8a7791-mstp-clocks" for R8A7791 (R-Car M2) MSTP gate clocks
>      - "renesas,cpg-mstp-clock" for generic MSTP gate clocks
> -- 
> 1.9.2

I believe that Mike Turquette (CCed) should take this.

I also believe that as it is relates to bindings it
needs to be reviewed by the devicetree people (CCed).
(Please correct me if I am wrong.)

