From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v8 0/2] mtd: hisilicon: add a new driver for NAND controller
 of hisilicon hip04 Soc
Date: Sat, 28 Feb 2015 14:01:51 +0800
Message-ID: <54F159CF.9090208@hisilicon.com>
References: <1422183194-10148-1-git-send-email-wangzhou1@hisilicon.com> <20150208083514.GD3670@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150208083514.GD3670@norris-Latitude-E6410>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015/2/8 16:35, Brian Norris wrote:
> On Sun, Jan 25, 2015 at 06:53:12PM +0800, Zhou Wang wrote:
>> This patchset adds the support for NAND controller of hisilicon hip04 Soc.
>> The NAND controller IP was developed by hisilicon and needs a new driver to
>> support it. This patchset is based on l2-mtd/master.
>>
>> I have tested this NAND flash controller driver in Hip04 D01 board using MTD
>> test modules. All testes passed except mtd_nandbiterrs. The reason is that this
>> NAND controller doesn't support to write raw page in ECC mode. In the test of
>> mtd_nandbiterrs, when rewriting raw page(with some bits changed) back, this NAND
>> controller will also produce ECC codes and write into NAND flash OOB area. As
>> ECC codes in OOB area have been broken, read error comes out as follow.
>>
>> Hi Brian,
>>
>> As the patch have been reviewed for some time, could you consider to take this
>> driver for v3.20? If there is something still not good, please let me know.
> 
> It's all looking good. Pushed to l2-mtd.git, probably for 3.20. I have
> one or two small comments that may be worth thinking about though.
> 
> Brian
> 
> .
>
Hi Brian,

Thanks a lot.

Zhou Wang

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
