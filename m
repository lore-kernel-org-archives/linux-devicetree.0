From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/9] mfd: mt6397: clean up code
Date: Tue, 12 Mar 2019 15:49:12 +0100
Message-ID: <47b3a800-ff0b-bafe-6fca-fed1a18d5166@gmail.com>
References: <1552275991-34648-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1552275991-34648-2-git-send-email-hsin-hsiung.wang@mediatek.com>
 <CAGp9Lzo77XsggYZuhoTO20rh68PQrET1CSVB3GO4fpBzgWKPEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGp9Lzo77XsggYZuhoTO20rh68PQrET1CSVB3GO4fpBzgWKPEw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Wang <sean.wang@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Eddie Huang <eddie.huang@mediatek.com>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream <srv_heupstream@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Marc Zyngier <marc.zyngier@arm.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 11/03/2019 20:01, Sean Wang wrote:
> Hi,
> 
> On Sun, Mar 10, 2019 at 8:48 PM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
>>
>> clean up code
>>
>> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
>> ---
>>  drivers/mfd/mt6397-core.c | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
>> index 77b64bd..acb9812 100644
>> --- a/drivers/mfd/mt6397-core.c
>> +++ b/drivers/mfd/mt6397-core.c
>> @@ -18,17 +18,17 @@
>>  #include <linux/of_irq.h>
>>  #include <linux/regmap.h>
>>  #include <linux/mfd/core.h>
>> -#include <linux/mfd/mt6397/core.h>
>>  #include <linux/mfd/mt6323/core.h>
>> -#include <linux/mfd/mt6397/registers.h>
>> +#include <linux/mfd/mt6397/core.h>
>>  #include <linux/mfd/mt6323/registers.h>
>> +#include <linux/mfd/mt6397/registers.h>
>>
>>  #define MT6397_RTC_BASE                0xe000
>>  #define MT6397_RTC_SIZE                0x3e
>>
>> -#define MT6323_CID_CODE                0x23
>> -#define MT6391_CID_CODE                0x91
>> -#define MT6397_CID_CODE                0x97
>> +#define MT6323_CHIP_ID         0x23
>> +#define MT6391_CHIP_ID         0x91
>> +#define MT6397_CHIP_ID         0x97
>>
> 
> It would be not necessary to simply rename the definition or do you
> have a strong reason to do that?
> 

I agree, apart, please provide a sound commit message.
 "clean up code" is difficult to understand.

Regards,
Matthias

>>  static const struct resource mt6397_rtc_resources[] = {
>>         {
>> @@ -298,7 +298,7 @@ static int mt6397_probe(struct platform_device *pdev)
>>                 return pmic->irq;
>>
>>         switch (id & 0xff) {
>> -       case MT6323_CID_CODE:
>> +       case MT6323_CHIP_ID:
>>                 pmic->int_con[0] = MT6323_INT_CON0;
>>                 pmic->int_con[1] = MT6323_INT_CON1;
>>                 pmic->int_status[0] = MT6323_INT_STATUS0;
>> @@ -312,8 +312,8 @@ static int mt6397_probe(struct platform_device *pdev)
>>                                            0, pmic->irq_domain);
>>                 break;
>>
>> -       case MT6397_CID_CODE:
>> -       case MT6391_CID_CODE:
>> +       case MT6391_CHIP_ID:
>> +       case MT6397_CHIP_ID:
>>                 pmic->int_con[0] = MT6397_INT_CON0;
>>                 pmic->int_con[1] = MT6397_INT_CON1;
>>                 pmic->int_status[0] = MT6397_INT_STATUS0;
>> --
>> 1.9.1
>>
>>
>> _______________________________________________
>> Linux-mediatek mailing list
>> Linux-mediatek@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-mediatek
