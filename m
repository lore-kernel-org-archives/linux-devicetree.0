From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 1/3] regulator: bindings: Add properties for
 coupled regulators
Date: Tue, 24 Oct 2017 13:58:01 -0500
Message-ID: <20171024185801.bq27wszp7socsxqx@rob-hp-laptop>
References: <1508330822-8039-1-git-send-email-m.purski@samsung.com>
 <CGME20171018124727eucas1p255ccce41852d5585640f2d97153d2fa8@eucas1p2.samsung.com>
 <1508330822-8039-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508330822-8039-2-git-send-email-m.purski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maciej Purski <m.purski@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 18, 2017 at 02:47:00PM +0200, Maciej Purski wrote:
> Some regulators require keeping their voltage spread below defined
> max_spread.
> 
> Add properties to provide information on regulators' coupling.
> 
> Signed-off-by: Maciej Purski <m.purski@samsung.com>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
> index 378f6dc..6769565 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
> @@ -60,6 +60,10 @@ Optional properties:
>  	0: Disable active discharge.
>  	1: Enable active discharge.
>  	Absence of this property will leave configuration to default.
> +- regulator-coupled-with: Phandle to regulators with which the regulator
> +  should be coupled. Allow up to 9 phandles.

9? Sounds like a driver detail and pretty arbitrary.

Is this linkage 2-way meaning 2 coupled regulators both have links to 
the other one? If so, then what happens when you have a high number? If 
not, how does one decide which regulator has this property? 

> +- regulator-coupled-max-spread: Max spread between voltages of coupled regulators
> +  in microvolts.
>  
>  Deprecated properties:
>  - regulator-compatible: If a regulator chip contains multiple
> -- 
> 2.7.4
> 
