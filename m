From: Amelie DELAUNAY <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCHv4 3/8] rtc: add STM32 RTC driver
Date: Wed, 11 Jan 2017 14:39:06 +0100
Message-ID: <b9ed4f2f-5d41-6041-0215-c3ff11843198@st.com>
References: <1484138905-5903-1-git-send-email-amelie.delaunay@st.com>
 <20170111130438.GA9327@Red>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <rtc-linux+bncBC2IT2GSZUDRBCXL3DBQKGQEVQ74XLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170111130438.GA9327@Red>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Corentin,

Thanks for reviewing,

On 01/11/2017 02:04 PM, Corentin Labbe wrote:
> On Wed, Jan 11, 2017 at 01:48:25PM +0100, Amelie Delaunay wrote:
>> This patch adds support for the STM32 RTC.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
>> ---
>>  drivers/rtc/Kconfig     |  11 +
>>  drivers/rtc/Makefile    |   1 +
>>  drivers/rtc/rtc-stm32.c | 727 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 739 insertions(+)
>>  create mode 100644 drivers/rtc/rtc-stm32.c
>
> [...]
>> +/* STM32_PWR_CR */
>> +#define PWR_CR				0x00
>> +/* STM32_PWR_CR bit field */
>> +#define PWR_CR_DBP			BIT(8)
>> +
>> +static struct regmap *dbp;
>
> Hello
>
> Why using a global static struct ?
> You could alloc a private structure in probe for storing it and use platform_set_drvdata()
>
This is to stay closer to how this backup domain protection is managed 
in clk-stm32f4 driver, but I realize that I haven't the same 
constraints. I'll move this struct in my stm32_rtc private structure.

> Regards
>

Regards

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
