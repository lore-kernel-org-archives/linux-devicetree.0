From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v11 4/7] dt-bindings: sun6i-dsi: Add VCC-DSI supply property
Date: Thu, 03 Oct 2019 21:04:03 +0800
Message-ID: <0086CD40-F161-4B33-8D76-8DCA20E7DB07@aosc.io>
References: <20191003064527.15128-1-jagan@amarulasolutions.com> <20191003064527.15128-5-jagan@amarulasolutions.com> <20191003114733.56mlar666l76uoyb@gilmour>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003114733.56mlar666l76uoyb@gilmour>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>, michael@amarulasolutions.com
List-Id: devicetree@vger.kernel.org



于 2019年10月3日 GMT+08:00 下午7:47:33, Maxime Ripard <mripard@kernel.org> 写到:
>On Thu, Oct 03, 2019 at 12:15:24PM +0530, Jagan Teki wrote:
>> Allwinner MIPI DSI controllers are supplied with SoC DSI
>> power rails via VCC-DSI pin.
>>
>> Some board still work without supplying this but give more
>> faith on datasheet and hardware schematics and document this
>> supply property in required property list.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Tested-by: Merlijn Wajer <merlijn@wizzup.org>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>>  .../bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml         | 3
>+++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git
>a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
>b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
>> index 47950fced28d..9d4c25b104f6 100644
>> ---
>a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
>> +++
>b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
>> @@ -36,6 +36,9 @@ properties:
>>    resets:
>>      maxItems: 1
>>
>> +  vcc-dsi-supply:
>> +    description: VCC-DSI power supply of the DSI encoder
>> +
>
>The driver treats it as mandatory, so I've added it to the binding, as
>suggested by the commit log.

No. The regulator_get function will return dummy regulator, rather than
fail, if the regulator is not specified.

>
>Maxime

-- 
使用 K-9 Mail 发送自我的Android设备。
