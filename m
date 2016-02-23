From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: Mediatek: mt8173-evb: fix access MMC fail issue
Date: Tue, 23 Feb 2016 10:32:04 -0800
Message-ID: <7hlh6bth0b.fsf@baylibre.com>
References: <1455861643-24307-1-git-send-email-eddie.huang@mediatek.com>
	<7h37skw9jd.fsf@baylibre.com> <56CC1E0E.4050400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56CC1E0E.4050400-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Matthias Brugger's message of "Tue,
	23 Feb 2016 09:53:34 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 23/02/16 01:32, Kevin Hilman wrote:
>> Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
>>
>>> MT8173 E1 chip has one bug that if turn off USB power domain, vcore
>>> power will also be off, thus cause modules using vcore power domain
>>> fail, like MMC. The E1 chip only found on MT8173-evb board and this
>>> board only has E1 chip, so implement this as a board specific
>>> workaround.
>>>
>>> Pwrapper use vcore power, so add pwrapper using USB power domain to
>>> keep USB power domain not to zero and disabled.
>>>
>>> Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>
>> Tested-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>
>
> I send the patch in a pull request yesterday, so I won't be able to
> add your tag.

No worries.  Was on vacation, so couldn't test sooner.

> Thanks for testing and reporting this issue!

You're welcome,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
