From: Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v9 2/6] arm64: hi6220: Document devicetree bindings for
 Hisilicon hi6220 SoC
Date: Thu, 4 Jun 2015 15:23:43 +0800
Message-ID: <556FFCFF.8040003@huawei.com>
References: <1432950661-23060-1-git-send-email-bintian.wang@huawei.com> <1432950661-23060-3-git-send-email-bintian.wang@huawei.com> <CAL_JsqKhoDe-Z700RnmZXUtFLS_Kpn1wsE2JVo-pu6UGHBJsAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKhoDe-Z700RnmZXUtFLS_Kpn1wsE2JVo-pu6UGHBJsAw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li91hl2p70BpVqQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015/6/4 12:36, Rob Herring wrote:
> On Fri, May 29, 2015 at 8:50 PM, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> This patch adds documentation for the devicetree bindings used by the
>> DT files of Hisilicon hi6220 SoC mobile platform.
>>
>> Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> Suggested-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Acked-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Acked-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> One minor comment below.
Thank you Rob, I will fix in version 10.

BR,

Bintian

>> ---
>>   .../bindings/arm/hisilicon/hisilicon.txt           |   87 ++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> index 35b1bd4..f67d0f3 100644
>> --- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> +++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
>> @@ -1,5 +1,8 @@
>>   Hisilicon Platforms Device Tree Bindings
>>   ----------------------------------------------------
>> +Hi6220 SoC
>> +Required root node properties:
>> +       - compatible = "hisilicon,hi6220";
>>
>>   Hi4511 Board
>>   Required root node properties:
>> @@ -13,6 +16,9 @@ HiP01 ca9x2 Board
>>   Required root node properties:
>>          - compatible = "hisilicon,hip01-ca9x2";
>>
>> +HiKey Board
>> +Required root node properties:
>> +       - compatible = "hisilicon,hi6220-hikey", "hisilicon,hi6220";
>>
>>   Hisilicon system controller
>>
>> @@ -41,6 +47,87 @@ Example:
>>          };
>>
>>   -----------------------------------------------------------------------
>> +Hisilicon Hi6220 system controller
>> +
>> +Required properties:
>> +- compatible : "hisilicon,hi6220-sysctrl"
>> +- reg : Register address and size
>> +- #clock-cells: should be set to 1, many clock registers are defined
>> +  under this controller and this property must be present.
>> +
>> +Hisilicon designs this controller as one of the system controllers,
>> +its main functions are the same as Hisilicon system controller, but
>> +the register offset of some core modules are different.
>> +
>> +Example:
>> +       /*for Hi6220*/
>> +       sys_ctrl: sys_ctrl {
>
> You should have the unit address in the name here. Same with the
> follow examples.
>
>> +               compatible = "hisilicon,hi6220-sysctrl", "syscon";
>> +               reg = <0x0 0xf7030000 0x0 0x2000>;
>> +               #clock-cells = <1>;
>> +       };
>> +
>> +
>> +Hisilicon Hi6220 Power Always ON domain controller
>> +
>> +Required properties:
>> +- compatible : "hisilicon,hi6220-aoctrl"
>> +- reg : Register address and size
>> +- #clock-cells: should be set to 1, many clock registers are defined
>> +  under this controller and this property must be present.
>> +
>> +Hisilicon designs this system controller to control the power always
>> +on domain for mobile platform.
>> +
>> +Example:
>> +       /*for Hi6220*/
>> +       ao_ctrl: ao_ctrl {
>> +               compatible = "hisilicon,hi6220-aoctrl", "syscon";
>> +               reg = <0x0 0xf7800000 0x0 0x2000>;
>> +               #clock-cells = <1>;
>> +       };
>> +
>> +
>> +Hisilicon Hi6220 Media domain controller
>> +
>> +Required properties:
>> +- compatible : "hisilicon,hi6220-mediactrl"
>> +- reg : Register address and size
>> +- #clock-cells: should be set to 1, many clock registers are defined
>> +  under this controller and this property must be present.
>> +
>> +Hisilicon designs this system controller to control the multimedia
>> +domain(e.g. codec, G3D ...) for mobile platform.
>> +
>> +Example:
>> +       /*for Hi6220*/
>> +       media_ctrl: media_ctrl {
>> +               compatible = "hisilicon,hi6220-mediactrl", "syscon";
>> +               reg = <0x0 0xf4410000 0x0 0x1000>;
>> +               #clock-cells = <1>;
>> +       };
>> +
>> +
>> +Hisilicon Hi6220 Power Management domain controller
>> +
>> +Required properties:
>> +- compatible : "hisilicon,hi6220-pmctrl"
>> +- reg : Register address and size
>> +- #clock-cells: should be set to 1, some clock registers are define
>> +  under this controller and this property must be present.
>> +
>> +Hisilicon designs this system controller to control the power management
>> +domain for mobile platform.
>> +
>> +Example:
>> +       /*for Hi6220*/
>> +       pm_ctrl: pm_ctrl {
>> +               compatible = "hisilicon,hi6220-pmctrl", "syscon";
>> +               reg = <0x0 0xf7032000 0x0 0x1000>;
>> +               #clock-cells = <1>;
>> +       };
>> +
>> +-----------------------------------------------------------------------
>>   Hisilicon HiP01 system controller
>>
>>   Required properties:
>> --
>> 1.7.9.5
>>
>
> .
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
