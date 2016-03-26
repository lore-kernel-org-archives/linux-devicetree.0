From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: ARC dw-mshc binding compat string
Date: Sat, 26 Mar 2016 18:30:03 +0100
Message-ID: <56F6C71B.6070002@denx.de>
References: <56F66121.8050507@denx.de> <56F6C639.5000301@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F6C639.5000301-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexey Brodkin <abrodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/26/2016 06:26 PM, Vladimir Zapolskiy wrote:
> On 26.03.2016 12:14, Marek Vasut wrote:
>> Hi!
>>
>> I noticed that arch/arc/boot/dts/axs10x_mb.dtsi uses "altr," prefix in
>> the DT compatible string:
>>
>> mmc@0x15000 {
>>         compatible = "altr,socfpga-dw-mshc";
>>         reg = < 0x15000 0x400 >;
>>         num-slots = < 1 >;
>>         fifo-depth = < 16 >;
>>         card-detect-delay = < 200 >;
>>         clocks = <&apbclk>, <&mmcclk>;
>>         clock-names = "biu", "ciu";
>>         interrupts = < 7 >;
>>         bus-width = < 4 >;
>> };
>>
>> I don't think this is OK, since ARC is unrelated to Altera, which is
>> what the "altr," prefix stands for. I think the socfpga-dw-mshc shim
>> should be extended with another compatibility string, something like
>> "snps,arc-dw-mshc" and the axs10x_mb.dtsi should be adjusted
>> accordingly. What do you think ?
>>
> 
> There is "snps,dw-mshc" described in
> Documentation/devicetree/bindings/mmc/synopsys-dw-mshc.txt and supported by
> dw_mmc host controller driver.

Thanks, that's even better.

btw what do you think of using altr, prefix on non-altera system, that
doesn't seem ok, right ?


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
