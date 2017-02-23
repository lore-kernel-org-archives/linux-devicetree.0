From: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add basic DT for Linksys EA9500
Date: Thu, 23 Feb 2017 13:59:18 +0100
Message-ID: <e756072c-f633-2507-ec58-7dfbf037f582@openwrt.org>
References: <20170223104025.5755-1-zajec5@gmail.com>
 <bd36df47-cefe-5736-e02c-621a21ae1b7a@openwrt.org>
 <CACna6rzN-OQv4UJoRso_Kyf1rCEtuU5Lu9LDjvTTt011UgrA=Q@mail.gmail.com>
 <5c57772b-71fd-d9e2-efe6-1175cf048e0b@openwrt.org>
 <CACna6rzeuy+-0cQCUCrXYBnLv-twrzVvd65L6LANPPejarWAWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rzeuy+-0cQCUCrXYBnLv-twrzVvd65L6LANPPejarWAWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Rafal,

On 2017-02-23 13:51, Rafał Miłecki wrote:
> On 23 February 2017 at 13:44, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>> On 2017-02-23 13:29, Rafał Miłecki wrote:
>>> On 23 February 2017 at 13:27, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>>>> As discussed for other platforms as well, please use the board's name as
>>>> the
>>>> same board can end up being sold under multiple model numbers.
>>>>
>>>> So please rename the file to bcm47094-linksys-panamera.dts
>>> Huh? Where did you get panamera name from?!
>> Your manners shine on these dark days of winter. For about a decade now,
>> http://192.168.1.1/sysinfo.cgi will show you quite a bit of information if
>> you are too lazy to look into the GPL tarball or at the original bootlogs.
> Sadly Linksys doesn't sponsor me or provide me any hardware. The
> bootlogs I found:
> https://www.snbforums.com/threads/ea9500-serial-console-to-cfe.35228/
> http://www.dd-wrt.com/phpBB2/viewtopic.php?t=288470&start=30
> didn't include board name. As you probably can guess
> http://192.168.1.1/ was useful in my case as well.
>

I've guessed you have the hardware - so you're submitting dts files 
without testing it? I know they don't do much, but still, this is an 
interesting concept.

Anyways, if you are just adding support for hardware blindly, the dd-wrt 
forum you've mentioned has other posts that might help you [1].


Best,

Imre

[1] http://www.dd-wrt.com/phpBB2/viewtopic.php?p=1062050
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
