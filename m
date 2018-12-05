From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: gnss: add w2sg0004 compatible string
Date: Wed, 5 Dec 2018 16:01:54 +0100
Message-ID: <20181205150154.GG15689@localhost>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <20181118215801.12280-4-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181118215801.12280-4-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 18, 2018 at 10:57:59PM +0100, Andreas Kemnade wrote:
> Add w2sg0004 compatible string since devices without wakeup
> pins are now supported.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  Documentation/devicetree/bindings/gnss/sirfstar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gnss/sirfstar.txt b/Documentation/devicetree/bindings/gnss/sirfstar.txt
> index 648d183cdb77..1be7597ae884 100644
> --- a/Documentation/devicetree/bindings/gnss/sirfstar.txt
> +++ b/Documentation/devicetree/bindings/gnss/sirfstar.txt
> @@ -14,6 +14,7 @@ Required properties:
>  			"linx,r4"
>  			"wi2wi,w2sg0008i"
>  			"wi2wi,w2sg0084i"
> +			"wi2wi,w2sg0004"

Please keep the entries sorted.

>  
>  - vcc-supply	: Main voltage regulator (pin name: 3V3_IN, VCC, VDD)

Johan
