From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH 9/9] ARM: dts: exynos: add needs-hpd to &hdmicec for
 Odroid-U3
Date: Wed, 7 Jun 2017 20:59:29 +0200
Message-ID: <9963f9b7-f315-efd3-39cf-faf19c374869@xs4all.nl>
References: <20170607144616.15247-1-hverkuil@xs4all.nl>
 <20170607144616.15247-10-hverkuil@xs4all.nl>
 <20170607183645.tsjj3mb2k6fdnoei@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607183645.tsjj3mb2k6fdnoei@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/06/17 20:36, Krzysztof Kozlowski wrote:
> On Wed, Jun 07, 2017 at 04:46:16PM +0200, Hans Verkuil wrote:
>> From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>>
>> The Odroid-U3 board has an IP4791CZ12 level shifter that is
>> disabled if the HPD is low, which means that the CEC pin is
>> disabled as well.
>>
>> Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
>> Cc: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>  arch/arm/boot/dts/exynos4412-odroidu3.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
>> index 7504a5aa538e..7209cb48fc2a 100644
>> --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
>> +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
>> @@ -131,3 +131,7 @@
>>  	cs-gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
>>  	status = "okay";
>>  };
>> +
>> +&hdmicec {
>> +	needs-hpd;
>> +};
> 
> All good, except we try to keep them sorted alphabetically (helps
> avoiding conflicts and makes things easier to find)... which for this
> particular file will be difficult as it is semi-sorted. :)
> Anyway, how about putting this new node after &buck?

Done!

	Hans

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
