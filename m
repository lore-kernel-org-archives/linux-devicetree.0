From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 1/3] dt-bindings: document common IEEE 802.11 frequency
 limit property
Date: Wed, 4 Jan 2017 07:20:48 +0100
Message-ID: <d90127bd-6a9e-2773-fdf9-527afdc004a6@gmail.com>
References: <20170103225715.14072-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103225715.14072-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 01/03/2017 11:57 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>
> This new file should be used for properties that apply to all wireless
> devices.
>
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Switch to a single ieee80211-freq-limit property that allows specifying
>     *multiple* ranges. This resolves problem with more complex rules as pointed
>     by Felx.
>     Make description implementation agnostic as pointed by Arend.
>     Rename node to wifi as suggested by Martin.
> V3: Use more real-life frequencies in the example.
> V5: Describe hardware design as possible use for this property
> ---
>  .../devicetree/bindings/net/wireless/ieee80211.txt   | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/ieee80211.txt
>
> diff --git a/Documentation/devicetree/bindings/net/wireless/ieee80211.txt b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
> new file mode 100644
> index 0000000..1c82c16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/wireless/ieee80211.txt
> @@ -0,0 +1,20 @@
> +Common IEEE 802.11 properties
> +
> +This provides documentation of common properties that are valid for all wireless
> +devices.
> +
> +Optional properties:
> + - ieee80211-freq-limit : list of supported frequency ranges in KHz. This can be
> +	used to specify extra hardware limitations caused by e.g. used antennas
> +	or power amplifiers.

Do you find this description sufficient now? I'm not sure how/if I could answer
"Where would this data normally come from?" question.

One vendor may hardcode choice of channels in their PHP web UI.
Another one may do it in Andoid app.
OpenWrt so far was describing this limitation on their wiki page.

It doesn't sound like any valuable info if I understand this correctly. We also
don't describe where to get information about amount o RAM. One may just check
the hardware, one may use vendor firmware, one could check product data sheet.

If I missed the point, could you help me get this?


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
>
