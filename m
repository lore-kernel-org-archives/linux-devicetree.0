From: Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/6] clk: hi6220: Document devicetree bindings for
 hi6220 clock
Date: Tue, 14 Apr 2015 11:35:26 +0800
Message-ID: <552C8AFE.9040907@huawei.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <1428916660-25910-4-git-send-email-bintian.wang@huawei.com> <7304398.GVjUsTVoce@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7304398.GVjUsTVoce@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao@hisilicon.c
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On 2015/4/13 23:32, Arnd Bergmann wrote:
> On Monday 13 April 2015 17:17:37 Bintian Wang wrote:
>> +- compatible: the compatible should be one of the following strings to
>> +       indicate the clock controller functionality.
>> +
>> +       - "hisilicon,aoctrl"
>> +       - "hisilicon,sysctrl"
>> +       - "hisilicon,mediactrl"
>> +       - "hisilicon,pmctrl"
>> +
>>
>
> These ones already have bindings, you can't reuse the strings.
> Please work with someone in hisilicon to set up a registry of
> device names so you can avoid conflicts in the future.
All the clock registers are under above four system controllers, 
discussed with Mark and Haojian two months ago, I think using above
same four binding strings is enough for clk module.
On second thoughts, there really some problems for future hisilicon
code upstream, how about change back to the first version of this
patch set, just like following:
+		sys_ctrl: sys_ctrl {
+			compatible = "hisilicon,sysctrl", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0xf7030000 0x0 0x2000>;
+			ranges = <0 0x0 0xf7030000 0x2000>;
+
+			clock_sys: clock1@0 {
+				compatible = "hisilicon,hi6220-clock-sys";
+				reg = <0 0x1000>;
+				#clock-cells = <1>;
+			};
+		};

Thanks,

Bintian
>
> 	Arnd
>
> .
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
