From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v4 1/7] ARM: davinci, intc: Add irq domain support
Date: Tue, 29 May 2012 15:11:09 +0200
Message-ID: <4FC4CAED.70105@denx.de>
References: <1337694920-8925-1-git-send-email-hs@denx.de>
 <1337694920-8925-2-git-send-email-hs@denx.de>
 <20120526060312.815A13E2578@localhost>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20120526060312.815A13E2578@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Grant,

Am 26.05.2012 08:03, Grant Likely wrote:
> On Tue, 22 May 2012 15:55:14 +0200, Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>  wrote:
>> Signed-off-by: Heiko Schocher<hs-ynQEQJNshbs@public.gmane.org>
>> Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Cc: Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> Cc: Sekhar Nori<nsekhar-l0cyMroinI0@public.gmane.org>
>> Cc: Wolfgang Denk<wd-ynQEQJNshbs@public.gmane.org>
>> Cc: Sergei Shtylyov<sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
>
> Hi Heiko,
>
> Earlier today I commented (again) on the previous version of this
> patch.  Sorry about that.  I'm happy with the direction this series is

No problem!

> going.  Here's one more comments.

Thanks!

>> diff --git a/arch/arm/mach-davinci/cp_intc.c b/arch/arm/mach-davinci/cp_intc.c
>> index f83152d..bb52807 100644
>> --- a/arch/arm/mach-davinci/cp_intc.c
>> +++ b/arch/arm/mach-davinci/cp_intc.c
>> @@ -9,8 +9,10 @@
>>    * kind, whether express or implied.
>>    */
>>
>> +#include<linux/export.h>
>>   #include<linux/init.h>
>>   #include<linux/irq.h>
>> +#include<linux/irqdomain.h>
>>   #include<linux/io.h>
>>
>>   #include<mach/common.h>
>> @@ -99,18 +101,37 @@ static struct irq_chip cp_intc_irq_chip = {
>>   	.irq_set_wake	= cp_intc_set_wake,
>>   };
>
> All of the irq_chip hooks need to be switched from using d->irq to
> d->hwirq for the hardware irq number.  That sets up to driver to
> switch to using dynamic allocation of irq_descs.

Ok, try to work this in...

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
