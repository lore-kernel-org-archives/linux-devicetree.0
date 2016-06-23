From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/4] uio: introduce devicetree bindings for uio_dmem_genirq
Date: Thu, 23 Jun 2016 14:01:00 +0530
Message-ID: <CAALAos_9F3o=xKVCc-X786eQMozBH9yg-EN2XMP3icaQ+_2u_Q@mail.gmail.com>
References: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
 <1463476940-26791-4-git-send-email-viktorin@rehivetech.com>
 <20160518170105.GA4897@rob-hp-laptop> <20160519104556.739c3f68@pcviktorin.fit.vutbr.cz>
 <20160523203622.GA11818@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160523203622.GA11818@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sorry for jumping-in late ...

On Tue, May 24, 2016 at 2:06 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, May 19, 2016 at 10:45:56AM +0200, Jan Viktorin wrote:
>> Hello Rob,
>>
>> thank you for your opinion...
>>
>> On Wed, 18 May 2016 12:01:05 -0500
>> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>> > On Tue, May 17, 2016 at 11:22:19AM +0200, Jan Viktorin wrote:
>> > > Signed-off-by: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
>> > > ---
>> > >  .../devicetree/bindings/uio/uio_dmem_genirq.txt          | 16 ++++++++++++++++
>> > >  1 file changed, 16 insertions(+)
>> > >  create mode 100644 Documentation/devicetree/bindings/uio/uio_dmem_genirq.txt
>> >
>> > DT describes h/w. UIO is not a h/w block, so this does not belong in DT.
>> > A UIO vs. kernel driver is purely a kernel decision which shouldn't
>> > require a DT change.
>>
>> I mostly agree and I don't say this is the very best solution... however,
>> it is quite a straightforward one.
>>
>> >
>> > The properties should be part of match data for a compatible string that
>>
>> True. But in case of probing from DT, where can I obtain those match data
>> from? I have to patch the kernel... and that is what I tried to avoid.
>
> spi-dev is a similar situation and we put compatible strings (and
> therefore potentially match data) in the kernel.
>
>> With this patch set, you only modify your current device-tree (extend the
>> appropriate devices by "uio,...") and reboot with this new one.
>
> Generally speaking changing your kernel is as easy or easier than
> changing the DT.
>
> Rebooting is not a very good choice either when it could easily be a
> module unload/reload instead.

We can pass name of the DT attributes as kernel parameters. This will
not require any DT bindings change.

The main advantage in having DT attributes for UIO dmem is that we can
have two different UIO dmem DT nodes with different number of dynamic
regions.

In fact, we can pass UIO dmem compatible string also as kernel parameter
just like UIO pdrv driver but this feature is missing current UIO dmem driver.

>
>> > needs them set. Or if they can be defined in a way that is actually a
>> > property of the h/w, then it would be acceptible. You'd still need to
>> > define compatible strings that the properties apply to.
>>
>> If you look at uio_pdrv_genirq you can see that it has already been extended by
>> the module param "of_id". I.e. it is possible to specify the compatible property
>> it would match when doing insmod. So, it is possible to bind it to any platform
>> device described by the device tree. And thus, there is no way how to define a
>> list of compatible strings for it... (quite a long list, isn't it?)
>>
>> The same (of_id) can be done for uio_dmem_genirq, however, there is no way how to
>> specify the amount of dynamic memory to be used for a specific device. For me, it
>> makes sense to use DT to obtain those two properties saying "those devices would
>> use this amount of memory and not more".
>>
>> Perhaps, another module param is a way to go here. Something like of_dmem_count=2,
>> of_dmem_sizes=32k. Less flexible solution, however, if it is acceptable I'll rewrite
>> the current one.
>
> No issue with doing that, though they are not OF parameters at that
> point.
>
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Regards,
Anup
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
