From: Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: dts: sun7i: Enable HDMI support on the
 Olimex EVB
Date: Thu, 1 Feb 2018 08:25:37 +0100
Message-ID: <CAEKpxBnv3K-56n2z2gbmc9zif9d3QLQ4DPtvLY-5rj0E7cpjMA@mail.gmail.com>
References: <20180130075054.6256-1-codekipper@gmail.com> <20180131153431.ctpx2ea6wplw4anb@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180131153431.ctpx2ea6wplw4anb-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31 January 2018 at 16:34, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Jan 30, 2018 at 08:50:54AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Enable the display pipeline and HDMI output on the Olimex
>> A20-SOM-EVB.
>>
>> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
>> index 64c8ef9a2756..07906d4f8758 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
>> @@ -61,6 +61,17 @@
>>               stdout-path = "serial0:115200n8";
>>       };
>>
>> +     hdmi-connector {
>> +             compatible = "hdmi-connector";
>> +             type = "a";
>> +
>> +             port {
>> +                     hdmi_con_in: endpoint {
>> +                             remote-endpoint = <&hdmi_out_con>;
>> +                     };
>> +             };
>> +     };
>> +
>>       leds {
>>               compatible = "gpio-leds";
>>               pinctrl-names = "default";
>> @@ -79,6 +90,10 @@
>>       status = "okay";
>>  };
>>
>> +&de {
>> +     status = "okay";
>> +};
>> +
>>  &ehci0 {
>>       status = "okay";
>>  };
>> @@ -107,6 +122,16 @@
>>       };
>>  };
>>
>> +&hdmi {
>> +     status = "okay";
>> +};
>> +
>> +&hdmi_out {
>> +     hdmi_out_con: endpoint {
>> +     remote-endpoint = <&hdmi_con_in>;
>> +     };
>> +};
>> +
>
> The indentation is not correct here.
ACK
>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
