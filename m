From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: net: meson-dwmac: convert to yaml
Date: Tue, 6 Aug 2019 14:46:48 +0200
Message-ID: <ad40a14f-ea7a-69e5-e1ba-42e6e4ea61c4@baylibre.com>
References: <20190805122558.5130-1-narmstrong@baylibre.com>
 <CAL_Jsq+efvvb1UK-Nas0G5XefLWwN7ebnqoevi+W=jj4r3E2dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+efvvb1UK-Nas0G5XefLWwN7ebnqoevi+W=jj4r3E2dg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/08/2019 00:09, Rob Herring wrote:
> On Mon, Aug 5, 2019 at 6:26 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Now that we have the DT validation in place, let's convert the device tree
>> bindings for the Synopsys DWMAC Glue for Amlogic SoCs over to a YAML schemas.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>> Rob,
>>
>> I keep getting :
>> .../devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: reg: [[3376480256, 65536], [3364046144, 8]] is too long
> 
> Because snps,dwmac.yaml has:
> 
>   reg:
>     maxItems: 1
> 
> The schemas are applied separately and all have to be valid. You'll
> need to change snps,dwmac.yaml to:
> 
> reg:
>   minItems: 1
>   maxItems: 2
> 
> 
> The schema error messages leave something to be desired. I wish the
> error messages said which schema is throwing the error.

Indeed, it fixed it

> 
>> for the example DT
>>
>> and for the board DT :
>> ../amlogic/meson-gxl-s905x-libretech-cc.dt.yaml: ethernet@c9410000: reg: [[0, 3376480256, 0, 65536, 0, 3364046144, 0, 4]] is too short
>> ../amlogic/meson-gxl-s905x-nexbox-a95x.dt.yaml: soc: ethernet@c9410000:reg:0: [0, 3376480256, 0, 65536, 0, 3364046144, 0, 4] is too long
>>
>> and I don't know how to get rid of it.
> 
> The first issue is the same as the above. The 2nd issue is the use of
> <> in dts files becomes stricter with the schema. Each entry in an
> array needs to be bracketed:
> 
> reg = <0x0 0xc9410000 0x0 0x10000>,
>           <0x0 0xc8834540 0x0 0x4>;

I did it but somehow it was overrided (with the same content) in another .dtsi
included file...

Sorry for the noise !

Neil

> 
> Rob
> 
