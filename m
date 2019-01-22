From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 6/6] dt-bindings: gnss: add lna-supply property
Date: Tue, 22 Jan 2019 19:11:15 +0100
Message-ID: <20190122181115.GT3691@localhost>
References: <20190116211812.6337-1-andreas@kemnade.info>
 <20190116211812.6337-7-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116211812.6337-7-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 10:18:12PM +0100, Andreas Kemnade wrote:
> Add lna-supply property.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v3:
> - moved to gnss.txt
> 
>  Documentation/devicetree/bindings/gnss/gnss.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gnss/gnss.txt b/Documentation/devicetree/bindings/gnss/gnss.txt
> index f1e4a2ff47c5..e31bc225957d 100644
> --- a/Documentation/devicetree/bindings/gnss/gnss.txt
> +++ b/Documentation/devicetree/bindings/gnss/gnss.txt
> @@ -17,6 +17,7 @@ Required properties:
>  		  represents
>  
>  Optional properties:
> +- lna-supply	: Separate supply for a LNA

s/a/an/

>  - enable-gpios	: GPIO used to enable the device
>  - timepulse-gpios	: Time pulse GPIO

Johan
