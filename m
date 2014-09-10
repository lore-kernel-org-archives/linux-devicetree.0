From: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] usb: gadget: Add xilinx usb2 device support
Date: Wed, 10 Sep 2014 19:25:11 +0530
Message-ID: <CALHRZuqt-XJ5mPczzGJtSN=iq7TPut0=54r90QHWR+w-Lwwtyg@mail.gmail.com>
References: <1406020130-20467-1-git-send-email-sbhatta@xilinx.com>
	<31c3ad1a-370a-4d0d-b392-8e7bb292f6aa@BN1AFFO11FD050.protection.gbl>
	<53F31F52.8060904@zonque.org>
	<CALHRZur5BC8Q2WFghU8jAtXzt1=tm=8swxp2xEz3MV4z5CCE9A@mail.gmail.com>
	<20140821140040.GE9608@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140821140040.GE9608-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>
Cc: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, svemula-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, anirudh-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Thu, Aug 21, 2014 at 7:30 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> On Thu, Aug 21, 2014 at 12:19:03PM +0530, sundeep subbaraya wrote:
>> Hi Daniel,
>>
>> On Tue, Aug 19, 2014 at 3:26 PM, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org> wrote:
>> > Hi,
>> >
>> > On 07/22/2014 11:08 AM, Subbaraya Sundeep Bhatta wrote:
>> >> This patch adds xilinx usb2 device driver support
>> >
>> > Add some more information here, please. Copying the text from the
>> > Kconfig option is already a good start.
>> >
>> >>  drivers/usb/gadget/Kconfig      |   14 +
>> >>  drivers/usb/gadget/Makefile     |    1 +
>> >>  drivers/usb/gadget/udc-xilinx.c | 2261 +++++++++++++++++++++++++++++++++++++++
>> >>  3 files changed, 2276 insertions(+), 0 deletions(-)
>> >>  create mode 100644 drivers/usb/gadget/udc-xilinx.c
>> >
>> > As your driver has a DT binding, you have to describe it in
>> > Documentation/devicetree/bindings.
>> >
>> >> --- a/drivers/usb/gadget/Kconfig
>> >> +++ b/drivers/usb/gadget/Kconfig
>> >> @@ -459,6 +459,20 @@ config USB_EG20T
>> >>         ML7213/ML7831 is companion chip for Intel Atom E6xx series.
>> >>         ML7213/ML7831 is completely compatible for Intel EG20T PCH.
>> >>
>> >> +config USB_GADGET_XILINX
>> >> +     tristate "Xilinx USB Driver"
>> >> +     depends on COMPILE_TEST
>> >
>> > Why would you depend on that?
>>
>> Felipe asked to make this since this is USB soft IP driver and its
>> dependencies have tendency to grow.
>
> that's not exactly what I asked :-) Usually you only add COMPILE_TEST
> when you have an ARCH dependency. So something like:
>
>         depends on ARCH_ARM || COMPILE_TEST
>
> would make it clear that this driver is only available on ARM, but when
> doing my build tests, I'd still be able to compile it on x86.

Ok got it :)
>
>> > Also, your code uses device tree functions unconditionally, which is
>> > fine, but it must hence depend on 'OF'.
>>
>> Ok will add OF along with COMPILE_TEST
>
> so this would be:
>
>         depends on OF || COMPILE_TEST
Ok

Thanks,
Sundeep

>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
