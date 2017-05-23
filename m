From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 10/12] arm64: dts: hi3660: add spi device nodes
Date: Tue, 23 May 2017 19:39:16 +0800
Message-ID: <CAFGCpxyy0vmGhEHEJ3inn98RsO3Fshkw=_RWr_9XQCXiS-C-1w@mail.gmail.com>
References: <20170517083745.24479-1-guodong.xu@linaro.org> <20170517083745.24479-11-guodong.xu@linaro.org>
 <20170523004627.caeoqezj3leydj2t@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170523004627.caeoqezj3leydj2t@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "Chenfeng (puck)" <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xuejiancheng <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 8:46 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, May 17, 2017 at 04:37:43PM +0800, Guodong Xu wrote:
>> From: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>>
>> Add spi2 and spi3 device nodes for hi3660, and enable them for hikey960.
>>
>> On HiKey960:
>>  - SPI2 is wired out through low speed expansion connector.
>>  - SPI3 is wired out through high speed expansion connector.
>>
>> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  8 ++++++
>>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 30 +++++++++++++++++++++++
>>  2 files changed, 38 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> index 69aa207..79735ee 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> @@ -69,3 +69,11 @@
>>  &uart6 {
>>       status = "okay";
>>  };
>> +
>> +&spi2 {
>> +     status = "okay";
>> +};
>> +
>> +&spi3 {
>> +     status = "okay";
>
> LS connector label?

Thanks Rob. I will fix that, adding label accordingly.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
