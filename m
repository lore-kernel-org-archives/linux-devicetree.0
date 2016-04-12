From: Guodong Xu <guodong.xu@linaro.org>
Subject: Re: [PATCH v3 04/16] arm64: dts: Add Hi6220 gpio configuration nodes
Date: Tue, 12 Apr 2016 17:43:23 +0800
Message-ID: <CAFGCpxz+ZZE-NT11+2GEoKX4dhmju+4zxG04Nt-gPGqR8kwy7w@mail.gmail.com>
References: <1459862860-9775-1-git-send-email-guodong.xu@linaro.org>
	<1459862860-9775-5-git-send-email-guodong.xu@linaro.org>
	<CACRpkdZNTJB_Jn01AwhwHf77yk-Cb_yzj4ty6N1b6wbHmfoevA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZNTJB_Jn01AwhwHf77yk-Cb_yzj4ty6N1b6wbHmfoevA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Xu Wei <xuwei5@hisilicon.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Arnd Bergmann <arnd.bergmann@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, XinWei Kong <kong.kongxinwei@hisilicon.com>, Zhong Kaihua <zhongkaihua@huawei.com>
List-Id: devicetree@vger.kernel.org

On 8 April 2016 at 20:19, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Apr 5, 2016 at 3:27 PM, Guodong Xu <guodong.xu@linaro.org> wrote:
>
>> From: Zhong Kaihua <zhongkaihua@huawei.com>
>>
>> Add Hi6220 gpio configuration nodes
>>
>> Signed-off-by: Zhong Kaihua <zhongkaihua@huawei.com>
>> Signed-off-by: Kong Xinwei <kong.kongxinwei@hisilicon.com>
>>
>
> I asked you to remove this blank line.

will fix.

>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
>
> (...)
>> +++ b/arch/arm64/boot/dts/hisilicon/hikey-gpio.dtsi
>> @@ -0,0 +1,607 @@
>> +/ {
>> +       gpio_rstout_n:gpio_rstout_n {
>> +               gpios;
>> +       };
>
> I also asked about either explaining or removing this.
>
> Did my mail arrive?

It arrived. My mistake, sorry, i missed. I will remove this file. And
send a new version.

-Guodong

>
> Yours,
> Linus Walleij
