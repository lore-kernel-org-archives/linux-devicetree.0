From: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] dt-bindings: Document the Rockchip RGA bindings
Date: Sat, 15 Jul 2017 12:38:11 +0800
Message-ID: <CAFLEztRaatd3Amx7o7WbYoL=FoN=HZFN94ufqpcjHC0wWcE5eg@mail.gmail.com>
References: <1498488802-1439-1-git-send-email-jacob-chen@iotwrt.com> <20170628222937.jscrixi5uo2vasnk@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170628222937.jscrixi5uo2vasnk@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi rob,

2017-06-29 6:29 GMT+08:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Jun 26, 2017 at 10:53:22PM +0800, Jacob Chen wrote:
>> Add DT bindings documentation for Rockchip RGA
>>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/media/rockchip-rga.txt     | 36 ++++++++++++++++++++++
>
> Should be under bindings/gpu/
>
>>  1 file changed, 36 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.txt b/Documentation/devicetree/bindings/media/rockchip-rga.txt
>> new file mode 100644
>> index 0000000..48a260e5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/rockchip-rga.txt
>> @@ -0,0 +1,36 @@
>> +device-tree bindings for rockchip 2D raster graphic acceleration controller (RGA)
>> +
>> +RGA is a separate 2D raster graphic acceleration unit. It accelerates 2D
>> +graphics operations, such as point/line drawing, image scaling, rotation,
>> +BitBLT, alpha blending and image blur/sharpness.
>> +
>> +Required properties:
>> +- compatible: value should be one of the following
>> +             "rockchip,rk3228-rga";
>> +             "rockchip,rk3288-rga";
>> +             "rockchip,rk3399-rga";
>> +
>> +- interrupts: RGA interrupt number.
>> +
>> +- clocks: phandle to RGA sclk/hclk/aclk clocks
>> +
>> +- clock-names: should be "aclk" "hclk" and "sclk"
>> +
>> +- resets: Must contain an entry for each entry in reset-names.
>> +  See ../reset/reset.txt for details.
>> +- reset-names: should be "core" "axi" and "ahb"
>> +
>> +Example:
>> +SoC specific DT entry:
>> +     rga: rga@ff680000 {
>
> gpu@...
>

It's used for v4l2 drvier, should i move it bindings/gpu/?

>> +             compatible = "rockchip,rk3399-rga";
>> +             reg = <0xff680000 0x10000>;
>> +             interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
>> +             interrupt-names = "rga";
>> +             clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
>> +             clock-names = "aclk", "hclk", "sclk";
>> +
>> +             resets = <&cru SRST_RGA_CORE>, <&cru SRST_A_RGA>, <&cru SRST_H_RGA>;
>> +             reset-names = "core, "axi", "ahb";
>> +             status = "disabled";
>
> Don't show status in examples.
>
>> +     };
>> --
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
