From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: exynos: added mailbox node
Date: Mon, 17 Mar 2014 20:28:07 +0530
Message-ID: <CABb+yY0XXMQaEuDV0FeURjOijYEUKyqU9Dr6XTDRcxc1qaBu9g@mail.gmail.com>
References: <1395057839-23871-1-git-send-email-ks.giri@samsung.com>
	<1395057839-23871-3-git-send-email-ks.giri@samsung.com>
	<5346848.pBsh8NcQja@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5346848.pBsh8NcQja@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Girish K S <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Ilho Lee <ilho215.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 17, 2014 at 5:45 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday 17 March 2014 17:33:59 Girish K S wrote:
>> +Samsung Mailbox Driver
>> +
>> +Required properties:
>> +- compatible:          Should be one of the following,
>> +                           "samsung,gh7-mailbox" for
>> +                               Samsung GH7 SoC series
>> +                           "samsung,exynos-mailbox" for
>> +                               exynosx SoC series
>> +- reg:                 Contains the mailbox register address range (base address
>> +                       and length)
>> +- interrupts:          Contains the interrupt information for the mailbox
>> +                       device.
>> +- samsung,mbox-names:  Array of the names of the mailboxes
>>
>
> I think we should not allow new mailbox drivers that don't conform to
> the framework that is currently under discussion. In particular, this
> means don't do a "samsung,mbox-names" property. The current consensus
> seems to be to have a #mbox-cells" property that allows to pass extra
> parameters from the client driver, and uses an "mboxes" property
> to reference the mailbox provided.
>
> It would be good if you follow up for the subsystem discussion and
> ensure it gets merged in time, and supports all the use cases you are
> interested in. The interface is not entirely nailed down yet, so
> it's a good time to contribute. However, I can already promise that
> it won't use matching by strings.
>
I was just about to submit next revision of framework that this
Samsung driver conforms to. Now I think I need some expert opinion ...
(sorry if following is repetition)

  As Kumar Gala pointed out in the other thread, the mailbox/ipc chain
is going to be _very_ platform specific so much so that one rethinks
if a common api is even warranted : because the client driver will be
different even if just the remote api(which is going to be
proprietary) changes, keeping everything else same. For example, a
client driver for Highbank is highly unlikely to be reusable on
Exynos, even if both used the same mailbox controller. By my limited
foresight, mailbox assignment via DT doesn't bring us much benefit but
only ritual code.

  Perhaps the mailbox controller driver should name its links as it
wants. By how the remote works with the mailbox links, the client
driver asks for a specific mailbox link (which maybe a hardcoded
string in the driver or be gotten alongside other data via client's
DT) ?

  IOW we can't have a generic API/DT-bindings that could get us
reusable client drivers. But only common framework/code that would
otherwise be duplicated by every platform.

Thanks
Jassi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
