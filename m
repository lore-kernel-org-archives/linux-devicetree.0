From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v5 00/14] ARM: samsung-time: Prepare for multiplatform
 support
Date: Tue, 23 Apr 2013 02:37:33 +0900
Message-ID: <5175755D.20305@samsung.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com> <201304122251.41393.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <201304122251.41393.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Tomasz Figa <t.figa@samsung.com>, mark.rutland@arm.com, heiko@sntech.de, tomasz.figa@gmail.com, buserror@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, christer@weinigel.se, sylvester.nawrocki@gmail.com, m.szyprowski@samsung.com, kgene.kim@samsung.com, linux@arm.linux.org.uk, kwangwoo.lee@gmail.com, mcuelenaere@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, john.stultz@linaro.org, ghcstop@gmail.com, linux@simtec.co.uk, linux-arm-kernel@lists.infradead.org, broonie@opensource.wolfsonmicro.com, jekhor@gmail.com, kyungmin.park@samsung.com, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On 04/13/13 05:51, Arnd Bergmann wrote:
> On Friday 12 April 2013, Tomasz Figa wrote:
>> This series is an attempt to make the samsung-time clocksource driver ready
>> for multiplatform kernels. It moves the driver to drivers/clocksource, cleans
>> it up from uses of static platform-specific definitions, simplifies timer
>> interrupt handling and adds Device Tree support.
>>
>> The samsung_pwm clocksource driver is made the master driver, which
>> exposes a single function to the PWM driver to get required data. Only
>> samsung-time driver is reworked to use the master driver at this time,
>> since the PWM driver can be already considered broken at the moment and
>> needs separate series of several patches to fix and clean it up, which
>> I am already working on.
>>
>> Tested on Universal C210 board with Device Tree. Not tested without
>> Device Tree, since it has been already broken before this series.
>> Compile tested for other related SoCs.
>
> Acked-by: Arnd Bergmann<arnd@arndb.de>

Applied, this whole series.

Thanks.

- Kukjin
