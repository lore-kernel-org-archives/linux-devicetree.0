From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 1/2] dt-bindings: document common IEEE 802.11
 frequency limit property
Date: Tue, 3 Jan 2017 17:08:41 -0600
Message-ID: <20170103230841.hs7ebd2recvh6ywx@rob-hp-laptop>
References: <20170103110340.23249-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170103110340.23249-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 03, 2017 at 12:03:38PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> This new file should be used for properties that apply to all wireless
> devices.

The commit msg should answer the questions I asked on v1.

> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Switch to a single ieee80211-freq-limit property that allows specifying
>     *multiple* ranges. This resolves problem with more complex rules as pointed
>     by Felx.
>     Make description implementation agnostic as pointed by Arend.
>     Rename node to wifi as suggested by Martin.
> V3: Use more real-life frequencies in the example.
> ---
>  .../devicetree/bindings/net/wireless/ieee80211.txt     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/ieee80211.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.txt b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
> new file mode 100644
> index 0000000..0cd1219
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
> @@ -0,0 +1,18 @@
> +Common IEEE 802.11 properties
> +
> +This provides documentation of common properties that are valid for all wireless
> +devices.
> +
> +Optional properties:
> + - ieee80211-freq-limit : list of supported frequency ranges in KHz
> +
> +Example:
> +
> +pcie@0,0 {
> +	reg = <0x0000 0 0 0 0>;
> +	wifi@0,0 {
> +		reg = <0x0000 0 0 0 0>;
> +		ieee80211-freq-limit = <2402000 2482000>,
> +				       <5170000 5250000>;
> +	};
> +};
> -- 
> 2.10.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
