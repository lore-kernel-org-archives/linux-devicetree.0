From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: Add documentation for Milbeaut SoCs
Date: Thu, 21 Feb 2019 09:37:55 +0900
Message-ID: <f31aa3e4-9f86-124f-6636-d2c2b4763cca@socionext.com>
References: <1550648622-10541-1-git-send-email-sugaya.taichi@socionext.com>
 <CAL_JsqK-8iBaF92GpXdoZwBEaT_mQAjO_4URR9iPJqAiy=YW=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqK-8iBaF92GpXdoZwBEaT_mQAjO_4URR9iPJqAiy=YW=w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, soc@kernel.org, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 2019/02/20 22:33, Rob Herring wrote:
> On Wed, Feb 20, 2019 at 1:43 AM Sugaya Taichi
> <sugaya.taichi@socionext.com> wrote:
>>
>> This adds a DT binding documentation for the M10V and its evaluation
>> board.
>>
>> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
>> ---
>>   .../bindings/arm/socionext/milbeaut.yaml           | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
>> new file mode 100644
>> index 0000000..522396f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
>> @@ -0,0 +1,22 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/milbeaut.yaml#
>> +$schema: http://devicetree.org/meta-schemas/milbeaut.yaml#
> 
> This line is wrong. All DT schema should be:
> http://devicetree.org/meta-schemas/core.yaml#
> 

Ah, OK. Fix it soon.

Thanks,
Sugaya Taichi

>> +
>> +title: Milbeaut platforms device tree bindings
>> +
>> +maintainers:
>> +  - Taichi Sugaya <sugaya.taichi@socionext.com>
>> +  - Takao Orito <orito.takao@socionext.com>
>> +
>> +properties:
>> +  $nodename:
>> +    const: '/'
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - socionext,milbeaut-m10v-evb
>> +          - const: socionext,sc2000a
>> +...
>> --
>> 1.9.1
>>
