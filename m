From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v1 1/3] dt-bindings: net: Add 'mac-address-lookup'
 property
Date: Wed, 15 Aug 2018 14:45:29 -0600
Message-ID: <20180815204529.GA24830@rob-hp-laptop>
References: <20180814223758.117433-1-briannorris@chromium.org>
 <20180814223758.117433-2-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180814223758.117433-2-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 14, 2018 at 03:37:56PM -0700, Brian Norris wrote:
> Some firmwares present data tables that can be parsed to retrieve
> device-specific details, like MAC addresses. While in some cases, one
> could teach the firmware to understand the device tree format and insert
> a 'mac-address'/'local-mac-address' property into the FDT on its own,
> this method can be brittle (e.g., involving memorizing expected FDT
> structure), and it's not strictly necessary -- especially when parsers
> for such firmware formats are already needed in the OS for other
> reasons.

If you have an 'ethernetN' alias then you don't need to know the 
structure. IIRC, that is what u-boot does.

> 
> One such format: the Vital Product Data (VPD) [1] used by Coreboot. It
> supports a table of key/value pairs, and some systems keep MAC addresses
> there in a well-known format. Allow a device tree to specify
>   (1) that the MAC address for a given device is stored in the VPD table
>       and
>   (2) what key should be used to retrieve the MAC address for said
>       device (e.g., "ethernet_mac0" or "wifi_mac1").
> 
> [1] Ref:
> https://chromium.googlesource.com/chromiumos/platform/vpd/+/master/README.md
> TL;DR: VPD consists of a TLV-like table, with key/value pairs of
> strings. This is often stored persistently on the boot flash and
> presented via in-memory Coreboot tables, for the operating system to
> read.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  Documentation/devicetree/bindings/net/ethernet.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
> index cfc376bc977a..d3fd1da18bf4 100644
> --- a/Documentation/devicetree/bindings/net/ethernet.txt
> +++ b/Documentation/devicetree/bindings/net/ethernet.txt
> @@ -4,6 +4,18 @@ NOTE: All 'phy*' properties documented below are Ethernet specific. For the
>  generic PHY 'phys' property, see
>  Documentation/devicetree/bindings/phy/phy-bindings.txt.
>  
> +- mac-address-lookup: string, indicating a method by which a MAC address may be
> +  discovered for this device. Methods may be parameterized by some value, such
> +  that the method can determine the device's MAC address using that parameter.
> +  For example, a firmware might store MAC addresses in a table, keyed by some
> +  predetermined string, and baked in read-only flash. A lookup method "foo"
> +  with a parameter "bar" should be written "foo:bar".
> +  Supported values for method:
> +    "google-vpd" - Google's Vital Product Data (VPD), as used in the Coreboot
> +      project. Documentation for VPD can be found at:
> +        https://chromium.googlesource.com/chromiumos/platform/vpd/+/master/README.md
> +  Example:
> +    mac-address-lookup = "google-vpd:ethernet_mac0"

This doesn't strike me as a very DT style way of describing this. I 
would expect something like a phandle to the VPD and an identifier. 

Also, an already common way besides local-mac-address is using nvmem 
binding which wouldn't use this and perhaps could be used here? This 
feels very much Google specific, not common (and maybe that is fine).

Rob
