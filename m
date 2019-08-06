From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: amlogic,meson-vpu: convert to
 yaml
Date: Tue, 6 Aug 2019 09:59:14 +0200
Message-ID: <a887183e-01d5-f4fc-7d12-eeda9c7e278f@baylibre.com>
References: <20190805134319.737-1-narmstrong@baylibre.com>
 <20190805134319.737-3-narmstrong@baylibre.com>
 <CAL_JsqLMS2y5ZR4SH6TVwnaTDhnGwk2_C_81DTz9J=ypDdBd4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLMS2y5ZR4SH6TVwnaTDhnGwk2_C_81DTz9J=ypDdBd4w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/08/2019 00:19, Rob Herring wrote:
> On Mon, Aug 5, 2019 at 7:43 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Now that we have the DT validation in place, let's convert the device tree
>> bindings for the Amlogic Display Controller over to YAML schemas.
>>
>> The original example has a leftover "dmc" memory cell, that has been
>> removed in the yaml rewrite.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../bindings/display/amlogic,meson-vpu.txt    | 121 --------------
>>  .../bindings/display/amlogic,meson-vpu.yaml   | 153 ++++++++++++++++++
>>  2 files changed, 153 insertions(+), 121 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
>>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
> 
> 
>> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
>> new file mode 100644
>> index 000000000000..9eba13031998
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
>> @@ -0,0 +1,153 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2019 BayLibre, SAS
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/display/amlogic,meson-vpu.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Amlogic Meson Display Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <narmstrong@baylibre.com>
>> +
>> +description: |
>> +  The Amlogic Meson Display controller is composed of several components
>> +  that are going to be documented below
>> +
>> +  DMC|---------------VPU (Video Processing Unit)----------------|------HHI------|
>> +     | vd1   _______     _____________    _________________     |               |
>> +  D  |-------|      |----|            |   |                |    |   HDMI PLL    |
>> +  D  | vd2   | VIU  |    | Video Post |   | Video Encoders |<---|-----VCLK      |
>> +  R  |-------|      |----| Processing |   |                |    |               |
>> +     | osd2  |      |    |            |---| Enci ----------|----|-----VDAC------|
>> +  R  |-------| CSC  |----| Scalers    |   | Encp ----------|----|----HDMI-TX----|
>> +  A  | osd1  |      |    | Blenders   |   | Encl ----------|----|---------------|
>> +  M  |-------|______|----|____________|   |________________|    |               |
>> +  ___|__________________________________________________________|_______________|
>> +
>> +
>> +  VIU: Video Input Unit
>> +  ---------------------
>> +
>> +  The Video Input Unit is in charge of the pixel scanout from the DDR memory.
>> +  It fetches the frames addresses, stride and parameters from the "Canvas" memory.
>> +  This part is also in charge of the CSC (Colorspace Conversion).
>> +  It can handle 2 OSD Planes and 2 Video Planes.
>> +
>> +  VPP: Video Post Processing
>> +  --------------------------
>> +
>> +  The Video Post Processing is in charge of the scaling and blending of the
>> +  various planes into a single pixel stream.
>> +  There is a special "pre-blending" used by the video planes with a dedicated
>> +  scaler and a "post-blending" to merge with the OSD Planes.
>> +  The OSD planes also have a dedicated scaler for one of the OSD.
>> +
>> +  VENC: Video Encoders
>> +  --------------------
>> +
>> +  The VENC is composed of the multiple pixel encoders
>> +   - ENCI : Interlace Video encoder for CVBS and Interlace HDMI
>> +   - ENCP : Progressive Video Encoder for HDMI
>> +   - ENCL : LCD LVDS Encoder
>> +  The VENC Unit gets a Pixel Clocks (VCLK) from a dedicated HDMI PLL and clock
>> +  tree and provides the scanout clock to the VPP and VIU.
>> +  The ENCI is connected to a single VDAC for Composite Output.
>> +  The ENCI and ENCP are connected to an on-chip HDMI Transceiver.
>> +
>> +  The following table lists for each supported model the port number
>> +  corresponding to each VPU output.
>> +
>> +                  Port 0       Port 1
>> +  -----------------------------------------
>> +   S905 (GXBB)   CVBS VDAC        HDMI-TX
>> +   S905X (GXL)   CVBS VDAC        HDMI-TX
>> +   S905D (GXL)   CVBS VDAC        HDMI-TX
>> +   S912 (GXM)      CVBS VDAC      HDMI-TX
>> +   S905X2 (G12A)       CVBS VDAC          HDMI-TX
>> +   S905Y2 (G12A)       CVBS VDAC          HDMI-TX
>> +   S905D2 (G12A)       CVBS VDAC          HDMI-TX
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - amlogic,meson-gxbb-vpu # GXBB (S905)
>> +              - amlogic,meson-gxl-vpu # GXL (S905X, S905D)
>> +              - amlogic,meson-gxm-vpu # GXM (S912)
>> +          - const: amlogic,meson-gx-vpu
>> +      - enum:
>> +          - amlogic,meson-g12a-vpu # G12A (S905X2, S905Y2, S905D2)
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +   items:
>> +     - const: vpu
>> +     - const: hhi
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    description: phandle to the associated power domain
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/phandle
> 
> Common properties don't need a type definition. As this can be an
> array, you just need 'maxItems: 1'.

Ok

> 
> Same comments on patch 1 apply here too.

OK

> 
> Rob
> 
