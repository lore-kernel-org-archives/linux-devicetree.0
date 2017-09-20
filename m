From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/18] arm: shmobile: Document Kingfisher board DT
 bindings
Date: Wed, 20 Sep 2017 15:52:58 -0500
Message-ID: <20170920133945.6yfeio56lohduvvi@rob-hp-laptop>
References: <1505587727-15543-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1505587727-15543-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 16, 2017 at 09:48:47PM +0300, Vladimir Barinov wrote:
> Add Kingfisher Device tree bindings Documentation, listing it as a
> supported board.
> Kingfisher is the H3ULCB/M3ULCB extension board.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
> Changes in version 2:
> - added own compatible value "shimafuji,kingfisher"
> Changes in version 3:
> - seperate Kingfisher entry from H3ULCB/M3ULCB
> 
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index ae75cb3..5921ac2 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -76,6 +76,8 @@ Boards:
>      compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7743"
>    - iWave Systems RZ/G1M Qseven System On Module (iW-RainboW-G20M-Qseven)
>      compatible = "iwave,g20m", "renesas,r8a7743"
> +  - Kingfisher (SBEV-RCAR-KF-M03)
> +    compatible = "shimafuji,kingfisher";

Not consistent with the ';'. Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

>    - Koelsch (RTP0RC7791SEB00010S)
>      compatible = "renesas,koelsch", "renesas,r8a7791"
>    - Kyoto Microcomputer Co. KZM-A9-Dual
> -- 
> 1.9.1
> 
