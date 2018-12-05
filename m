From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH RFC 5/5] dt-bindings: gnss: add lna-supply property
Date: Wed, 5 Dec 2018 16:09:39 +0100
Message-ID: <20181205150939.GI15689@localhost>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <20181118215801.12280-6-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181118215801.12280-6-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 18, 2018 at 10:58:01PM +0100, Andreas Kemnade wrote:
> Add lna-supply property.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Documentation/devicetree/bindings/gnss/sirfstar.txt
> index 1be7597ae884..9614774d14bc 100644
> --- a/Documentation/devicetree/bindings/gnss/sirfstar.txt
> +++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
> @@ -30,6 +30,7 @@ Optional properties:
>  - sirf,wakeup-gpios	: GPIO used to determine device power state
>  			  (pin name: RFPWRUP, WAKEUP)
>  - timepulse-gpios	: Time pulse GPIO (pin name: 1PPS, TM)
> +- lna-supply		: Separate supply for a LNA

"Supply for external LNA"?

And please keep the entries sorted.

>  
>  Example:

Johan
