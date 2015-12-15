From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: mvebu: add kirkwood compatibles for cloudengine boards
Date: Tue, 15 Dec 2015 17:20:52 +0100
Message-ID: <87mvtbvg2j.fsf@free-electrons.com>
References: <1448578854-6256-1-git-send-email-linus.walleij@linaro.org>
	<20151127201702.GA32398@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151127201702.GA32398@rob-hp-laptop> (Rob Herring's message of
	"Fri, 27 Nov 2015 14:17:02 -0600")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,
 
 On ven., nov. 27 2015, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Fri, Nov 27, 2015 at 12:00:54AM +0100, Linus Walleij wrote:
>> This adds the compatible strings for Cloudengine PogoPlug E02 and
>> series 4. The former already has a devicetree in the kernel.
>> 
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied on mvebu/dt

Thanks,

Gregory

>
>> ---
>>  Documentation/devicetree/bindings/arm/marvell,kirkwood.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt b/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt
>> index 5171ad8f48ff..ab0c9cdf388e 100644
>> --- a/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt
>> +++ b/Documentation/devicetree/bindings/arm/marvell,kirkwood.txt
>> @@ -24,6 +24,8 @@ board. Currently known boards are:
>>  "buffalo,lswxl"
>>  "buffalo,lsxhl"
>>  "buffalo,lsxl"
>> +"cloudengines,pogo02"
>> +"cloudengines,pogoplugv4"
>>  "dlink,dns-320"
>>  "dlink,dns-320-a1"
>>  "dlink,dns-325"
>> -- 
>> 2.4.3
>> 
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
