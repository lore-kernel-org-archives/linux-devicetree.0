From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: zynq: Remove bogus value from 'bias-disable'
 property
Date: Thu, 29 Jan 2015 15:35:14 +0100
Message-ID: <4cef3a322a8543cdb8f9f57eafd7a09b@BL2FFO11FD014.protection.gbl>
References: <1422301796-22888-1-git-send-email-soren.brinkmann@xilinx.com>
 <54C6DDE8.3000905@suse.de>
 <ce6e56872ab744a49612ef9bca07c73d@BN1AFFO11FD005.protection.gbl>
 <20150128154139.GK13057@xsjandreislx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150128154139.GK13057@xsjandreislx>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/28/2015 04:41 PM, S=C3=B6ren Brinkmann wrote:
> On Wed, 2015-01-28 at 03:21PM +0100, Michal Simek wrote:
>> On 01/27/2015 01:38 AM, Andreas F=C3=A4rber wrote:
>>> Am 26.01.2015 um 20:49 schrieb Soren Brinkmann:
>>>> In one pinctrl node, a 'bias-disable' property is erroneously assi=
gned a
>>>> value.
>>>>
>>>> Fixes: ARM: zynq: DT: Add pinctrl information
>>>> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>
>>> Reviewed-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>>
>>> Andreas
>>>
>>
>> Applied both.
>=20
> Thanks. Given how the branch looks now, you could squash 'ARM: zynq: =
DT:
> Remove bogus value from 'bias-disable' property' and 'ARM: zynq: DT: =
Add
> pinctrl information to USB nodes' into 'ARM: zynq: DT: Add pinctrl
> information'. Then we have it all in one patch and spare everybody th=
e
> intermittent, partly broken commits.

That's not a problem. I have sent pull request with current state.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
