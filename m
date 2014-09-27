From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 6/7] devicetree: bindings: Document supported Allwinner
 sunxi SoCs
Date: Sat, 27 Sep 2014 21:08:46 +0800
Message-ID: <CAGb2v65pKo=6BC-HaMsEMq-bcQcoHZNc9GiX+kfTBgP1PE5wMg@mail.gmail.com>
References: <1411570141-29960-1-git-send-email-wens@csie.org>
 <1411570141-29960-7-git-send-email-wens@csie.org> <20140925133609.GK15315@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140925133609.GK15315@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, ctl <ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 25, 2014 at 9:36 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Sep 24, 2014 at 10:49:00PM +0800, Chen-Yu Tsai wrote:
>> This adds a list of supported Allwinner SoC bindings.
>>
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/sunxi.txt | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/sunxi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
>> new file mode 100644
>> index 0000000..d7d1039
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
>> @@ -0,0 +1,12 @@
>> +Allwinner sunXi Platforms Device Tree Bindings
>> +
>> +Each device tree must specify which Allwinner SoC it uses,
>> +using one of the following compatible stirngs:
>                                          ^ strings

Will fix.

>> +
>> +  allwinner,sun4i-a10
>> +  allwinner,sun5i-a10s
>> +  allwinner,sun5i-a13
>> +  allwinner,sun6i-a31
>> +  allwinner,sun7i-a20
>> +  allwinner,sun8i-a23
>> +  allwinner,sun9i-a80
>
> Maybe you can just add this info to the already existing README?

AFAIK the bindings are where they're supposed to be.

Putting the bindings outside of devicetree/bindings is unexpected
and confusing.


Cheers
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
