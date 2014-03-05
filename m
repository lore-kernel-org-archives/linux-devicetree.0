From: Andreas Oberritter <obi@saftware.de>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Map SYSRAM address through DT
Date: Wed, 05 Mar 2014 14:26:01 +0100
Message-ID: <531725E9.5010307@saftware.de>
References: <1392876308-4748-1-git-send-email-sachin.kamat@linaro.org> <CAK9yfHz6wJPdC=DjgaiNOsPHY8k9zaB+p3-ahpwOOcPQtoWEHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <CAK9yfHz6wJPdC=DjgaiNOsPHY8k9zaB+p3-ahpwOOcPQtoWEHw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On 05.03.2014 09:23, Sachin Kamat wrote:
>> diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> index d2e3f5f5916d..3ca3fb6aa5f4 100644
>> --- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> +++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
>> @@ -28,6 +28,11 @@
>>                 bootargs = "console=ttySAC2,115200N8 root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1";
>>         };
>>
>> +       sysram@02020000 {
                  ^
>> +               compatible = "samsung,exynos4210-sysram";
>> +               reg = <0x02025000 0x1000>;
                          ^
>> +       };
>> +

Shouldn't these two addresses match?

Regards,
Andreas
