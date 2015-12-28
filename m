From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [RESEND v4 0/6] remoteproc: Add driver for STMicroelectronics platforms
Date: Mon, 28 Dec 2015 10:41:37 -0800
Message-ID: <CAJAp7OgZwf-Cd+Drypqo92YNJBYtB-XCbW-noy-4BB5JZojRnw@mail.gmail.com>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
	<CAK=WgbZbiq_BAUEti9tWUtWqZPU_4gDJ5Mfqur=Ou2N4Ea+2GQ@mail.gmail.com>
	<20151126091043.GO12874@x1>
	<CAK=WgbbWTdDGMYOFjVO3s1bt1r5iou6Q-hHOh4SZG=rQuEa2eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK=WgbbWTdDGMYOFjVO3s1bt1r5iou6Q-hHOh4SZG=rQuEa2eQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, linux-arm <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ludovic.barre-qxv4g6HH51o@public.gmane.org, "Anna, Suman" <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 1:32 AM, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, Nov 26, 2015 at 11:10 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, 26 Nov 2015, Ohad Ben-Cohen wrote:
>>> On Tue, Nov 24, 2015 at 3:14 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> > ST's platforms often have multiple co-processors (usually ST40s or ST231s)
>>> > on-board.  This provides the Linux-side infrastructure to flash and boot
>>> > them successfully.
>>> >
>>> > This set has been tested on an STiH410-B2120.
>>>
>>> It would be nice if you could get at least one Reviewed-by tag coming
>>> outside of ST (e.g., Suman or Bjorn who are actively using and
>>> improving remoteproc).
>>
>> If you require reviews by these guys, shouldn't they be Maintainers?
>
> Additional review isn't a requirement, but it's a plus.
>
>> Please be aware that
>> the DTS(I) changes are applied to this set for your information only
>> and are not to be applied through the RemoteProc tree.  The usual
>> process to which we conform is that Maxime (the STi Maintainer) will
>> apply the DT changes *after* the main driver has been applied, in this
>> case by you.
>
> Ok, great, so I will not take patches 5 and 6.
>

I interpreted this as you picked patch 1-4 and didn't pay more
attention to them, but I can't find them in your kernel.org trees. So
I've looked through them again.

Please apply patch 1, 3 and 4 to your tree Ohad. I was unable to find
a v5 of patch 2, but it's unrelated so no need to wait for a new
version of that.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
