From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: asoc: Add ADAU7118
	documentation
Date: Thu, 10 Oct 2019 16:08:50 -0500
Message-ID: <20191010210850.GA20184@bogus>
References: <20191010074234.7344-1-nuno.sa@analog.com>
 <20191010074234.7344-2-nuno.sa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20191010074234.7344-2-nuno.sa@analog.com>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 10, 2019 at 09:42:34AM +0200, Nuno S=E1 wrote:
> Document the ADAU7118 8 channel PDM to I2S/TDM converter devicetree
> bindings.
> =

> Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>
> ---
> Changes in v2:
>  * List regulators as required;
> =

> Changes in v3:
>  * Set the correct license for new bindings.
> =

>  .../bindings/sound/adi,adau7118.yaml          | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau7118.=
yaml
> =

> diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/=
Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> new file mode 100644
> index 000000000000..cfcef602b3d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/adi,adau7118.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +
> +title: Analog Devices ADAU7118 8 Channel PDM to I2S/TDM Converter
> +
> +maintainers:
> +  - Nuno S=E1 <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices ADAU7118 8 Channel PDM to I2S/TDM Converter over I2C or=
 HW
> +  standalone mode.
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD=
AU7118.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adau7118
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  IOVDD-supply:

Use lowercase please.

> +    description: Digital Input/Output Power Supply.
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

*-supply already has a type, so just a description is enough.

> +
> +  DVDD-supply:
> +    description: Internal Core Digital Power Supply.
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Same here.

> +
> +  adi,decimation-ratio:
> +    description: |
> +      This property set's the decimation ratio of PDM to PCM audio data.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [64, 32, 16]
> +        default: 64
> +
> +  adi,pdm-clk-map:
> +    description: |
> +      The ADAU7118 has two PDM clocks for the four Inputs. Each input mu=
st be
> +      assigned to one of these two clocks. This property set's the mappi=
ng
> +      between the clocks and the inputs.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - minItems: 4
> +        maxItems: 4
> +        items:
> +          maximum: 1
> +        default: [0, 0, 1, 1]
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - IOVDD-supply
> +  - DVDD-supply
> +
> +examples:
> +  - |
> +    i2c0 {

i2c {

> +        /* example with i2c support */
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        status =3D "okay";

Don't show status in examples.

> +        adau7118_codec: adau7118-codec@14 {

audio-codec@14

> +                compatible =3D "adi,adau7118";
> +                reg =3D <14>;
> +                #sound-dai-cells =3D <0>;
> +                status =3D "okay";
> +                IOVDD-supply =3D <&supply>;
> +                DVDD-supply =3D <&supply>;
> +                adi,pdm-clk-map =3D <1 1 0 0>;
> +                adi,decimation-ratio =3D <16>;
> +        };
> +    };
> +
> +    /* example with hw standalone mode */
> +    adau7118_codec_hw: adau7118-codec-hw {
> +            compatible =3D "adi,adau7118";
> +            #sound-dai-cells =3D <0>;
> +            status =3D "okay";
> +            IOVDD-supply =3D <&supply>;
> +            DVDD-supply =3D <&supply>;
> +    };
> -- =

> 2.23.0
> =
