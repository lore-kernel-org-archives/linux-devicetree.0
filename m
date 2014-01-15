From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/3] power_supply: modelgauge_battery: Add Maxim ModelGauge
 ICs gauge
Date: Wed, 15 Jan 2014 14:16:24 +0400
Message-ID: <52D65FF8.2090901@cogentembedded.com>
References: <1389286145-15375-1-git-send-email-vladimir.barinov@cogentembedded.com> <52D565D5.4050704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52D565D5.4050704-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mk7.kang-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 01/14/2014 08:29 PM, Krzysztof Kozlowski wrote:
> On 01/09/2014 05:49 PM, Vladimir Barinov wrote:
>> Hello.
>>
>> This adds the folowing:
>> - Maxim ModelGauge ICs gauge driver for MAX17040/41/43/44/48/49/58/59 
>> chips
>> - Document DT bindings
>> - Remove superseded Maxim MAX17040 gauge driver
>>
>> Vladimir Barinov (3):
>>   [1/3] power_supply: modelgauge_battery: Maxim ModelGauge ICs gauge
>>   [2/3] dt: Document ModelGauge gauge bindings
>>   [3/3] power_supply: modelgauge_battery: Remove Maxim MAX17040 gauge
>
> On which tree your patchset is based on? I had conflicts when trying to
> apply this on 3.12 and 3.13.
Initially I've prepared them against 
git://git.infradead.org/battery-2.6.git master branch.
I've verified that it also applies against 
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git.

For the next try I will refresh patches against the latest version of 
above trees.

> Best regards,
> Krzysztof
>
Regards,
Vladimir

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
