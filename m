From: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: Document Hisilicon hix5hd2 sata PHY
Date: Fri, 20 Jun 2014 13:45:58 +0800
Message-ID: <53A3CA96.9040708@linaro.org>
References: <1402991881-27676-1-git-send-email-zhangfei.gao@linaro.org> <1402991881-27676-2-git-send-email-zhangfei.gao@linaro.org> <20140617171357.GH8930@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140617171357.GH8930@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Mark

On 06/18/2014 01:13 AM, Mark Rutland wrote:
> On Tue, Jun 17, 2014 at 08:58:00AM +0100, Zhangfei Gao wrote:
>> From: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> Add necessary binding documentation SATA PHY on Hisilicon hix5hd2 soc.
>>
>> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   .../devicetree/bindings/phy/hix5hd2-sata-phy.txt   |   26 ++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt b/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt
>> new file mode 100644
>> index 0000000..ed15123
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/hix5hd2-sata-phy.txt
>> @@ -0,0 +1,26 @@
>> +Hisilicon hix5hd2 SATA PHY
>> +-----------------------
>> +
>> +Required properties:
>> +- compatible: should be "hisilicon,hix5hd2-sata-phy"
>> +- reg: offset and length of the PHY registers
>> +- #phy-cells: must be 0
>> +Refer to phy/phy-bindings.txt for the generic PHY binding properties
>> +
>> +Optional Properties:
>> +- hisilicon,peri-syscon: phandle of syscon used to control peripheral.
>
> "peri" is a rather strange contraction of "peripheral".
Will use hisilicon,peripheral-syscon instead, just thought it is too long.
>
>> +- hisilicon,power-reg: offset and bit number of the sata power supply register.
>> +  Only effective when hisilicon,peri-syscon is supplied.
>
> This is the offset within the system controller? It would be good to
> state that.
Change to
- hisilicon,power-reg: offset and bit number within peripheral-syscon,
         register of controlling sata power supply.

>
>> +- hisilicon,reg-init: one of more sets of 4 cells.  The first cell
>> +  is the register offset address, the second cell is the start bit in register,
>> +  the third cell means the bit width, and the fourth cell is the value to set.
>
> Which registers is this meant to be initialising?
>
> Why does this need to be in the DT? How much is this expected to vary?

Double checked with hardware guy, the registers required to be set are 
same in different board, the value maybe different.
Will move to phy-hix5hd2-sata.c directly and remove hisilicon,reg-init.

Thanks for the suggestions.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
