From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 3/4] dt-bindings: i3c: Make 'assigned-address' valid if
 static address != 0
Date: Thu, 29 Aug 2019 12:51:38 +0200
Message-ID: <20190829125138.4b36b8f6@collabora.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <9d69c83c7193e377bbc77bea7f1812fc17dafaee.1567071213.git.vitor.soares@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9d69c83c7193e377bbc77bea7f1812fc17dafaee.1567071213.git.vitor.soares@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vitor Soares <Vitor.Soares@synopsys.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, bbrezillon@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Joao.Pinto@synopsys.com
List-Id: devicetree@vger.kernel.org

On Thu, 29 Aug 2019 12:19:34 +0200
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> The I3C devices without a static address can require a specific dynamic
> address for priority reasons.
> 
> Let's update the binding document to make the 'assigned-address' property
> valid if static address != 0 and add an example with this use case.

           ^ you mean static address == 0, right?

Yes, it makes sense to support that case and do our best to assign the
requested address after DAA has taken place by explicitly executing
SETDA.

> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentation/devicetree/bindings/i3c/i3c.txt
> index ab729a0..c851e75 100644
> --- a/Documentation/devicetree/bindings/i3c/i3c.txt
> +++ b/Documentation/devicetree/bindings/i3c/i3c.txt
> @@ -98,9 +98,7 @@ Required properties
>  
>  Optional properties
>  -------------------
> -- assigned-address: dynamic address to be assigned to this device. This
> -		    property is only valid if the I3C device has a static
> -		    address (first cell of the reg property != 0).
> +- assigned-address: dynamic address to be assigned to this device.

We should probably mention that we don't provide strong guarantees
here. We will try to assign this dynamic address to the device, but if
something fails (like another device owning the address and refusing to
give it up), the actual dynamic address will be different.
This clarification can be done in a separate patch.

>  
>  
>  Example:
> @@ -129,6 +127,15 @@ Example:
>  
>  		/*
>  		 * I3C device without a static I2C address but requiring
> +		 * specific dynamic address.
> +		 */
> +		sensor@0,39200154004 {
> +			reg = <0x0 0x6072 0x303904d2>;
> +			assigned-address = <0xb>;
> +		};
> +
> +		/*
> +		 * I3C device without a static I2C address but requiring
>  		 * resources described in the DT.
>  		 */
>  		sensor@0,39200154004 {
