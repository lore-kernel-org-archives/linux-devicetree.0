From: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH] arm,
 davinci: configure davinci aemif chipselects through OF
Date: Mon, 05 Dec 2011 11:50:41 +0100
Message-ID: <4EDCA201.4080505@denx.de>
References: <1322991679-20947-1-git-send-email-hs@denx.de>
 <4EDB66C9.9050302@mvista.com>
Reply-To: hs@denx.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <4EDB66C9.9050302@mvista.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, davinci-linux-open-source@linux.davincidsp.com, Wolfgang Denk <wd@denx.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Sergei,

Sergei Shtylyov wrote:
> Hello.
> 
> On 04-12-2011 13:41, Heiko Schocher wrote:
> 
>> Signed-off-by: Heiko Schocher<hs@denx.de>
>> Cc: davinci-linux-open-source@linux.davincidsp.com
>> Cc: devicetree-discuss@lists.ozlabs.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: grant.likely@secretlab.ca
>> Cc: Sekhar Nori<nsekhar@ti.com>
>> Cc: Kevin Hilman<khilman@ti.com>
>> Cc: Wolfgang Denk<wd@denx.de>
> 
>> diff --git a/arch/arm/mach-davinci/aemif.c
>> b/arch/arm/mach-davinci/aemif.c
>> index 1ce70a9..12c559f 100644
>> --- a/arch/arm/mach-davinci/aemif.c
>> +++ b/arch/arm/mach-davinci/aemif.c
> [...]
>> @@ -131,3 +138,99 @@ int davinci_aemif_setup_timing(struct
>> davinci_aemif_timing *t,
>>       return 0;
>>   }
>>   EXPORT_SYMBOL(davinci_aemif_setup_timing);
>> +
>> +#if defined(CONFIG_OF)
>> +static int dv_get_value(struct device_node *np, const char *name)
>> +{
>> +    const u32 *data;
>> +    int len;
>> +
>> +    data = of_get_property(np, name,&len);
>> +    if (data)
>> +        return be32_to_cpu(readl(data));
> 
>    Why readl() here?! Device tree is not a peripheral device...
> 
>> +
>> +    return -EINVAL;
>> +}
> 
>    Isn't there already a standard helper for that, of_property_read_u32()?

Yep, fixed that.

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
