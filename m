From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/4] mailbox: Hi6220: add mailbox driver
Date: Fri, 16 Oct 2015 11:17:32 +0530
Message-ID: <CABb+yY1ArXRz+jznuPj-BOQR18EijTD=czkHJ2BMSh5mNFikow@mail.gmail.com>
References: <1444667535-16948-1-git-send-email-leo.yan@linaro.org>
	<1444667535-16948-3-git-send-email-leo.yan@linaro.org>
	<CABb+yY2uJZFgDeviRzz8ghVhNzy5d6jf+=fpTAUez01m+O0ttw@mail.gmail.com>
	<20151016052910.GB3226@leoy-linaro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151016052910.GB3226@leoy-linaro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 16, 2015 at 10:59 AM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Oct 16, 2015 at 10:43:00AM +0530, Jassi Brar wrote:
>> On Mon, Oct 12, 2015 at 10:02 PM, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> > +
>> > +#define MBOX_CHAN_MAX                  32
>> > +#define MBOX_CHAN_NUM                  2
>> > +
>> You mean the hardware has 32 channels but this driver can not manage
>> more than 2 ?
>>
>> OR, there are 32 interfaces but only 2 physical 'floating' links, so
>> no more than 2 interfaces can be active at any time?
>
> For the later case.
Former is a s/w limitation and latter is h/w limitation. From what you
write below, it seems former to be the case.

> Mailbox also can be used by other modules, such
> like audio hifi; later need add links for them if want to enable
> audio. But so far only uses first 2 channels.
>
You mean every time your platform needs another channel, you'll update
the driver? Not sure about that. It should be simpler to assign which
ever and as many channels as the client asks via DT.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
