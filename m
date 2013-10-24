From: "David Woodhouse" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 14:30:09 -0000
Message-ID: <465e75de15f7d79c3b57a3b88024e739.squirrel@twosheds.infradead.org>
References: <20131023174458.GC5208@netboy>
    <1382553982.31058.10.camel@sakura.staff.proxad.net>
    <20131024095232.27BBCC4039D@trevor.secretlab.ca>
    <1382614439.6040.16.camel@sakura.staff.proxad.net>
    <1382615278.8522.72.camel@shinybook.infradead.org>
    <20131024122346.GD11296@ulmo.nvidia.com>
    <1382619655.6040.52.camel@sakura.staff.proxad.net>
    <516bfc7f9366ff3ef9187c36dd160888.squirrel@twosheds.infradead.org>
    <1382621431.6040.66.camel@sakura.staff.proxad.net>
    <af289ef3cc80be8de26274ba1f598d54.squirrel@twosheds.infradead.org>
    <20131024141955.GB25061@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131024141955.GB25061-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> On Thu, Oct 24, 2013 at 02:05:58PM -0000, David Woodhouse wrote:
>>
>> >
>> > On Thu, 2013-10-24 at 13:10 +0000, David Woodhouse wrote:
>> >
>> >> Note that you are not describing a normal "DT scenario" here. You are
>> >> describing a case in which we screwed up
>> >
>> > AKA "real world"
>>
>> No. Absolutely not. That was a screwup, and it needs to be *rare*. The
>> excuses you present for it are crappy and uunacceptable.
>
> That's not helping. The fact is that is has happened.

It has happened, yes. But we're describing how things *shall* work going
forward. Coping with existing mistakes is a slightly separate issue.
(Albeit only slightly since mistakes *will* continue to happen, but
hopefully more rarely so our defined processes for coping are based on the
assumption that it should be rare)


-- 
dwmw2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
