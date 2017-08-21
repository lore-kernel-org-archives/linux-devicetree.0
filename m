From: wlf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: add usb3 controller node for
 RK3328 SoCs
Date: Mon, 21 Aug 2017 19:35:00 +0800
Message-ID: <372dfa18-48a8-c104-03e8-b922304b8c02@rock-chips.com>
References: <1502956490-23087-1-git-send-email-william.wu@rock-chips.com>
 <1502956490-23087-2-git-send-email-william.wu@rock-chips.com>
 <7917076.Ei9Henru6l@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7917076.Ei9Henru6l@phil>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Heiko,

在 2017年08月18日 17:24, Heiko Stuebner 写道:
> Hi William,
>
> Am Donnerstag, 17. August 2017, 15:54:49 CEST schrieb William Wu:
>> RK3328 has one USB 3.0 OTG controller which uses DWC_USB3
>> core's general architecture. It can act as static xHCI host
>> controller, static device controller, USB 3.0/2.0 OTG basing
>> on ID of USB3.0 PHY.
>>
>> Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>> Changes in v2:
>> - Modify the dwc3 quirk "snps,tx-ipgap-linecheck-dis-quirk" to
>>    "snps,dis-tx-ipgap-linecheck-quirk"
>>
>>   .../devicetree/bindings/usb/rockchip,dwc3.txt      |  4 +++-
>>   arch/arm64/boot/dts/rockchip/rk3328.dtsi           | 27 ++++++++++++++++++++++
>>   2 files changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>> index 0536a93..d6b2e47 100644
>> --- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
>> @@ -1,7 +1,9 @@
>>   Rockchip SuperSpeed DWC3 USB SoC controller
>>   
>>   Required properties:
>> -- compatible:	should contain "rockchip,rk3399-dwc3" for rk3399 SoC
>> +- compatible:	should be one of the following:
>> +  - "rockchip,rk3399-dwc3": for rk3399 SoC
>> +  - "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3": for rk3328 SoC
>>   - clocks:	A list of phandle + clock-specifier pairs for the
>>   		clocks listed in clock-names
>>   - clock-names:	Should contain the following:
> This probably shouldn't be part of the patch adding the dts node, but
> instead should be a separate patch and should either go through some
> usb tree or at least get an Ack from usb maintainers (Felipe Balbi and/or
> Greg Kroah Hartman), so you should definitly include them into your
> recipient list.
Thanks for your  suggestion. I will submit two patches separately, and 
add usb maintainers in
the recipient list.
>
>
> Heiko
>
>
>
>

-- 
吴良峰 William.Wu
福建省福州市铜盘路软件大道89号软件园A区21号楼
No.21 Building, A District, No.89,software Boulevard Fuzhou,Fujian, PRC
手机: 13685012275
座机: 0591-83991906-8520
邮件:wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
