From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add basic DT for Linksys EA9500
Date: Fri, 24 Feb 2017 07:10:53 +0100
Message-ID: <CACna6rzn3YDBqwReEikqjfhpMk-uQj0cuNaay2HyK0kLc_xuJg@mail.gmail.com>
References: <20170223104025.5755-1-zajec5@gmail.com> <bd36df47-cefe-5736-e02c-621a21ae1b7a@openwrt.org>
 <CACna6rzN-OQv4UJoRso_Kyf1rCEtuU5Lu9LDjvTTt011UgrA=Q@mail.gmail.com>
 <5c57772b-71fd-d9e2-efe6-1175cf048e0b@openwrt.org> <CACna6ryFQHGN6xYiLcp9-v7f+55-4hoq+6kXCjiT6LJOS70sQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6ryFQHGN6xYiLcp9-v7f+55-4hoq+6kXCjiT6LJOS70sQQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24 February 2017 at 07:02, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> On 23 February 2017 at 13:44, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>> On 2017-02-23 13:29, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>
>>> On 23 February 2017 at 13:27, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>>>>
>>>> As discussed for other platforms as well, please use the board's name =
as
>>>> the
>>>> same board can end up being sold under multiple model numbers.
>>>>
>>>> So please rename the file to bcm47094-linksys-panamera.dts
>>>
>>> Huh? Where did you get panamera name from?!
>>
>> Your manners shine on these dark days of winter. For about a decade now,
>> http://192.168.1.1/sysinfo.cgi will show you quite a bit of information =
if
>> you are too lazy to look into the GPL tarball or at the original bootlog=
s.
>
> Today I decided to do my homework & check GPL sources of EA9500 fw.
>
> (...)
>
> Will you be so generous to tell us how did you get EA9500 board name
> by just looking at GPL sources?

I also tried find with -name "*panamera*". One way of guessing board
name seems to be checking names of patches in ./src/linux/patches/.
Any other, more reliable method?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
