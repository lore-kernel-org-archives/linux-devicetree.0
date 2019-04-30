From: guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: pinctrl: meson: Add drive-strength-uA
 property
Date: Tue, 30 Apr 2019 08:38:04 +0200
Message-ID: <7608f385-d412-f8be-d11b-9023f9702ec3@baylibre.com>
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-4-glaroque@baylibre.com>
 <CAFBinCD_qJw6-_zsnKFhsVHUHd2K2wJ3S9EsXGrPPxZ1SWn=uA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCD_qJw6-_zsnKFhsVHUHd2K2wJ3S9EsXGrPPxZ1SWn=uA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

On 4/27/19 9:21 PM, Martin Blumenstingl wrote:
> Hi Guillaume,
>
> On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> Add optional drive-strength-uA property
>>
>> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> index a47dd990a8d3..b3e4be696ddc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>> @@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
>>  "bias-pull-up" and "bias-pull-down", described in file
>>  pinctrl-bindings.txt
>>
>> +Optional properties :
>> + - drive-strength-uA: Drive strength for the specified pins in uA.
> if you have to re-send this series for whatever reason then please
> mention that drive-strength-uA is only valid for G12A and newer

thanks for your review, i will do if i send new series.


> otherwise:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
