From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V6 1/3] dt-bindings: document common IEEE 802.11 frequency
 limit property
Date: Wed, 4 Jan 2017 13:46:46 -0600
Message-ID: <CAL_JsqLg5YkC-YUHg6mQ35nmGaG7SC33VJB++fgtZsu1fRV-7Q@mail.gmail.com>
References: <20170104175832.25996-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170104175832.25996-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 4, 2017 at 11:58 AM, Rafał Miłecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
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
> V6: Even better property description, thanks Rob for your help!
> ---
>  .../devicetree/bindings/net/wireless/ieee80211.txt | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/ieee80211.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
