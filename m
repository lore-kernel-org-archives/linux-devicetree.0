From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] usb: dwc3: Add node to update cache type setting
Date: Wed, 24 Jul 2019 14:42:22 -0600
Message-ID: <20190724204222.GA1234@bogus>
References: <20190712064206.48249-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190712064206.48249-1-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 12, 2019 at 02:42:05PM +0800, Ran Wang wrote:
> Some Layerscape paltforms (such as LS1088A, LS2088A, etc) encounter USB
> detect failues when adding dma-coherent to DWC3 node. This is because the
> HW default cache type configuration of those SoC are not right, need to
> be updated in DTS.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Change in v2:
> 	- New file.
> 
>  Documentation/devicetree/bindings/usb/dwc3.txt | 43 ++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 8e5265e..7bc1cef 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -110,6 +110,43 @@ Optional properties:
>   - in addition all properties from usb-xhci.txt from the current directory are
>     supported as well
>  
> +* Cache type nodes (optional)
> +
> +The Cache type node is used to tell how to configure cache type on 4 different
> +transfer types: Data Read, Desc Read, Data Write and Desc write. For each
> +treasfer type, controller has a 4-bit register field to enable different cache
> +type. Quoted from DWC3 data book Table 6-5 Cache Type Bit Assignments:
> +----------------------------------------------------------------
> +MBUS_TYPE| bit[3]       |bit[2]       |bit[1]     |bit[0]
> +----------------------------------------------------------------
> +AHB      |Cacheable     |Bufferable   |Privilegge |Data
> +AXI3     |Write Allocate|Read Allocate|Cacheable  |Bufferable
> +AXI4     |Allocate Other|Allocate     |Modifiable |Bufferable
> +AXI4     |Other Allocate|Allocate     |Modifiable |Bufferable
> +Native   |Same as AXI   |Same as AXI  |Same as AXI|Same as AXI
> +----------------------------------------------------------------
> +Note: The AHB, AXI3, AXI4, and PCIe busses use different names for certain
> +signals, which have the same meaning:
> +  Bufferable = Posted
> +  Cacheable = Modifiable = Snoop (negation of No Snoop)

This should all be implied from the SoC specific compatible strings. 

Rob
