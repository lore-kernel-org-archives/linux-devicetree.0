From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: Add optional nvmem MAC address bindings
 to ti,wlink-st
Date: Mon, 4 Dec 2017 07:50:30 +0100
Message-ID: <7A28F1AF-A691-4261-83A0-01C14148EE98@holtmann.org>
References: <1512357682-8911-1-git-send-email-david@lechnology.com>
 <1512357682-8911-2-git-send-email-david@lechnology.com>
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512357682-8911-2-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Gustavo F. Padovan" <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> This adds optional nvmem consumer properties to the ti,wlink-st device tree
> bindings to allow specifying the Bluetooth MAC address.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
> Documentation/devicetree/bindings/net/ti,wilink-st.txt | 4 ++++
> 1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,wilink-st.txt b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
> index 1649c1f..24eb897 100644
> --- a/Documentation/devicetree/bindings/net/ti,wilink-st.txt
> +++ b/Documentation/devicetree/bindings/net/ti,wilink-st.txt
> @@ -32,6 +32,8 @@ Optional properties:
>    See ../clocks/clock-bindings.txt for details.
>  - clock-names : Must include the following entry:
>    "ext_clock" (External clock provided to the TI combo chip).
> + - nvmem-cells: phandle to nvmem data cell that contains a MAC address
> + - nvmem-cell-names: "mac-address" (required when nvmem-cells is specified)

lets call these “bt-address” since they are not really MAC addresses. They have special formatting etc. Also I prefer that the actual format on how they are stored is described. See Documentation/devicetree/bindings/net/bluetooth.txt for an example.

> Example:
> 
> @@ -43,5 +45,7 @@ Example:
> 		enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> 		clocks = <&clk32k_wl18xx>;
> 		clock-names = "ext_clock";
> +		nvmem-cells: <&mac_address>
> +		nvmem-cell-names "mac-address"
> 	};
> };

Regards

Marcel
