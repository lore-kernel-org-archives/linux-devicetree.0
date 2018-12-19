From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: marvell,mmp2: fix a typo in bindings doc
Date: Wed, 19 Dec 2018 11:19:45 -0600
Message-ID: <20181219171945.GA32656@bogus>
References: <20181203114748.637314-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203114748.637314-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: Jiri Kosina <trivial@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 12:47:48PM +0100, Lubomir Rintel wrote:
> A trivial one, but it's annoying that copy & paste of the link
> doesn't work.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/clock/marvell,mmp2.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/marvell,mmp2.txt b/Documentation/devicetree/bindings/clock/marvell,mmp2.txt
> index af376a01f2b7..b0447d9896bc 100644
> --- a/Documentation/devicetree/bindings/clock/marvell,mmp2.txt
> +++ b/Documentation/devicetree/bindings/clock/marvell,mmp2.txt
> @@ -18,4 +18,4 @@ Required Properties:
>  Each clock is assigned an identifier and client nodes use this identifier
>  to specify the clock which they consume.
>  
> -All these identifier could be found in <dt-bindings/clock/marvell-mmp2.h>.
> +All these identifier could be found in <dt-bindings/clock/marvell,mmp2.h>.

Really, should be: identifiers can be

> -- 
> 2.19.1
> 
