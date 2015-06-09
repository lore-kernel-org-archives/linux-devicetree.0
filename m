From: Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v9 5/6] arm64: dts: Add dts files for Hisilicon Hi6220
 SoC
Date: Tue, 9 Jun 2015 10:30:47 +0800
Message-ID: <55764FD7.2000805@huawei.com>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com> <1432950661-23060-6-git-send-email-bintian.wang@huawei.com> <20150609005521.GA21682@tiger> <557643EB.8000106@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <557643EB.8000106-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arnd, Hello Olof, Hello Kevin,

I checked the git log of Linux 4.1-rc7 from Linus, he says Linux 4.1
will have an rc8, so we may have time to review the following two pull
requests from Wei Xu?

[GIT PULL v2]Hisilicon 64-bit SoC changes for 4.2
[GIT PULL]Hisilicon 64-bit soc hi6220 DT changes for 4.2

Thanks for your time.

BR,

Bintian


On 2015/6/9 9:39, Bintian wrote:
> Hello Shawn,
>
> On 2015/6/9 8:55, Shawn Guo wrote:
>> A minor random comment below.
>>
>> On Sat, May 30, 2015 at 09:51:00AM +0800, Bintian Wang wrote:
>>> +        ao_ctrl: ao_ctrl {
>>> +            compatible = "hisilicon,hi6220-aoctrl", "syscon";
>>> +            reg = <0x0 0xf7800000 0x0 0x2000>;
>>> +            #clock-cells = <1>;
>>> +        };
>>> +
>>> +        sys_ctrl: sys_ctrl {
>>> +            compatible = "hisilicon,hi6220-sysctrl", "syscon";
>>> +            reg = <0x0 0xf7030000 0x0 0x2000>;
>>> +            #clock-cells = <1>;
>>> +        };
>>> +
>>> +        media_ctrl: media_ctrl {
>>> +            compatible = "hisilicon,hi6220-mediactrl", "syscon";
>>> +            reg = <0x0 0xf4410000 0x0 0x1000>;
>>> +            #clock-cells = <1>;
>>> +        };
>>> +
>>> +        pm_ctrl: pm_ctrl {
>>
>> An unit-address should be coded in the node name, when it has a 'reg'
>> property.
> Thanks for your suggestion, Rob also gives me the same suggestion :)
>
> In fact, I added the reg to node name in the "[GIT PULL]Hisilicon 64-bit
> soc hi6220 DT changes for 4.2", but it seems the pull is too late for
> kernel 4.2, I will prepare it for 4.3.
>
> Thanks,
>
> Bintian
>
>>
>> Shawn
>>
>>> +            compatible = "hisilicon,hi6220-pmctrl", "syscon";
>>> +            reg = <0x0 0xf7032000 0x0 0x1000>;
>>> +            #clock-cells = <1>;
>>> +        };
>>
>> .
>>
>
>
> .
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
