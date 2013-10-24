From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 14:15:48 -0400
Message-ID: <CAKON4OwwY9vi65kErcKasndcvxN_ndbk=Jq9ka2n6jNHaibtOg@mail.gmail.com>
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
	<465e75de15f7d79c3b57a3b88024e739.squirrel@twosheds.infradead.org>
	<alpine.LFD.2.03.1310241143240.1951@syhkavp.arg>
	<93d9a5ce228d03c4a183b06b00bd0442.squirrel@twosheds.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <93d9a5ce228d03c4a183b06b00bd0442.squirrel-fWAbwA/6YHlc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 24, 2013 at 12:45 PM, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
>
>> So it is time IMHO that the description of how things *shall* work be
>> itself revised.
>
> It *is* being revised, with an explicit explicit understanding that things
> will have to change and a defined process for how to cope with that.
>
> That was discussed yesterday and we will be finishing the write-up to be
> presented at the Kernel Summit tomorrow.

Did the concept of vertical and horizontal schemas make it in?

Horizontal schema - generic class descriptions for subsystems (spi,
alsa, uart, usb, etc). All specific DTS instantiations of the
subsystem would have to validate against the subsystem schema. And
conversely this schema would contain all of the weird chip specific
attributes that can't be handled generically.  These schemas serve two
purposes - they provide a generic skeleton for someone implementing a
new instance of the subsystem to start from and they allow the
subsystem maintainer to control the proliferation of similarly named
attributes (nscs, numcs, cs, ti,cs, chipsel, etc all describing the
same thing - the number of chip selects).  These schemas would be
highly documented and discussed on device-tree list.

The subsystem schemas would be included by higher level generic schema
files. So starting at the root of this tree all DTS files in the
kernel should validate against the tree. Anything that doesn't
validate should produce a warning or error. Can't get your DTS
mainlined until it can be validated without errors.

Vertical schema - the main goal of these schemas is error checking.
For example there may be an iMX6 or OMAP schema. These schemas would
check the device trees validated against them for as many errors as
possible. Like attribute names that are from the wrong chip or invalid
gpio or interrupt numbers, etc. These would be maintained by the SOC
vendors and not subject to intense review on the device-tree list.


>
>
> --
> dwmw2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
