From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add CPU thermal sensor and zone
Date: Mon, 17 Apr 2017 18:14:48 +0200
Message-ID: <CACna6rwR__iyPO6NcO3STtKz+aXfNiZFsNXhYwTHs27pTrrU9Q@mail.gmail.com>
References: <20170414214228.32521-1-zajec5@gmail.com> <CAC3K-4pQNnezT7gk45DoyW5hmZ1Vqshcx-tx-bS6mOVRNUooog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAC3K-4pQNnezT7gk45DoyW5hmZ1Vqshcx-tx-bS6mOVRNUooog-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17 April 2017 at 16:54, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, Apr 14, 2017 at 5:42 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8@public.gmane.org=
m> wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
>>
>> This uses CPU thermal sensor available on every Northstar chipset to
>> monitor temperature. We don't have any cooling or throttling so only a
>> critical trip was added.
>
> Haha!  You beat me to it (as I had a similar patch queued).
>
> This looks good to me.
>
> Acked-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

:) Thanks

I'd appreciate adding thermal to NSP DT. I don't have any NSP unit to
try it on my own.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
