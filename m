From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH lora-next 01/11] dt-bindings: net: lora: sx130x: add power
 lut binding
Date: Mon, 28 Jan 2019 12:13:39 -0600
Message-ID: <CAL_Jsq+7D0+Zzd3nR2gHiC3tW7BjmvhC+8g-TyxYxBN5Ryo_yQ@mail.gmail.com>
References: <20190128161306.27805-1-ben.whitten@lairdtech.com> <20190128161306.27805-2-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190128161306.27805-2-ben.whitten@lairdtech.com>
Sender: netdev-owner@vger.kernel.org
To: Ben Whitten <ben.whitten@gmail.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, linux-lpwan@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 10:13 AM Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> Adding power lookup table for the concentrator specified in DT.
>
> These values are calibrated for the hardware and are unique to hardware
> designs and certifications.
>
> First byte is signed power in dBm measured at the rf connector.
> Second byte is unsigned value for DIGITAL gain.
> Third byte is unsigned value for PA gain, 2 bits only.
> Fourth byte is unsigned value for DAC gain, 2 bits only.
> Fifth byte is unsigned value for MIXER gain, 4 bits only.
>
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
>  .../bindings/net/lora/semtech,sx130x.yaml           | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> index 24fad1218735..187fa2090a0b 100644
> --- a/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx130x.yaml
> @@ -37,6 +37,15 @@ properties:
>      maxItems: 1
>      description: A connection of the reset gpio line.
>
> +  power-lut:
> +    description: Power lookup table for the concentrator.
> +      Consisting of maximum 16 entries, each entry having the following format;
> +      First byte is signed power in dBm measured at the rf connector.
> +      Second byte is unsigned value for DIGITAL gain.
> +      Third byte is unsigned value for PA gain, 2 bits only.
> +      Fourth byte is unsigned value for DAC gain, 2 bits only.
> +      Fifth byte is unsigned value for MIXER gain, 4 bits only.

Would you expect this to be a common lora property? If not it should
have a vendor prefix.

Either way, non-standard properties need to reference a type. That
would be 'uint8-matrix' in this case. See the '$ref' in the examples.
Though, I guess I need to add a signed type.

We can write all the free form text above as a schema:

minItems: 1
maxItems: 16
items:
  items:
    - description: ...
      range??
    - description: ...
      range??
    - description: ...
      maximum: 3
    - description: ...
      maximum: 3
    - description: ...
      maximum: 15

> +
>    radio-spi:
>      type: object
>      description: The concentrator can have two radios connected which are
> @@ -83,6 +92,10 @@ examples:
>          reset-gpios = <&pioB 27 GPIO_ACTIVE_HIGH>;
>          spi-max-frequency = <8000000>;
>
> +       power-lut =   [ 00 00 00 03 09
> +                       03 00 00 03 0C
> +                       04 00 00 03 0D ];

You may need to write this with '/bits/ 8' syntax so you can bracket
each 5 byte entry. I don't think we can do that with [] notation.

Rob
