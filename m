From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: Add optional nvmem BD address
 bindings to ti,wlink-st
Date: Fri, 8 Dec 2017 09:08:36 +0100
Message-ID: <DC2DEAE4-17F2-4512-B69C-4E4BC1C630D8@holtmann.org>
References: <1512701860-8321-1-git-send-email-david@lechnology.com>
 <1512701860-8321-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512701860-8321-3-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Gustavo F. Padovan" <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Network Development <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,


> This adds optional nvmem consumer properties to the ti,wlink-st device tree
> bindings to allow specifying the BD address.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
> 
> v2 changes:
> * Renamed "mac-address" to "bd-address"
> * Fixed typos in example
> * Specify byte order of "bd-address"
> 
> Documentation/devicetree/bindings/net/ti,wilink-st.txt | 5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,wilink-st.txt b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
> index 1649c1f..a45a508 100644
> --- a/Documentation/devicetree/bindings/net/ti,wilink-st.txt
> +++ b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
> @@ -32,6 +32,9 @@ Optional properties:
>    See ../clocks/clock-bindings.txt for details.
>  - clock-names : Must include the following entry:
>    "ext_clock" (External clock provided to the TI combo chip).
> + - nvmem-cells: phandle to nvmem data cell that contains a 6 byte BD address
> +   with the most significant byte first (big-endian).
> + - nvmem-cell-names: "bd-address" (required when nvmem-cells is specified)
> 
> Example:
> 
> @@ -43,5 +46,7 @@ Example:
> 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> 		clocks = <&clk32k_wl18xx>;
> 		clock-names = "ext_clock";
> +		nvmem-cells = <&bd_address>;
> +		nvmem-cell-names = "bd-address”;

For me this looks good, but I like to get an extra ACK from Rob on this.

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
