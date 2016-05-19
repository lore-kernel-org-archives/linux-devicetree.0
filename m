From: Richard Weinberger <richard.weinberger-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: get_maintainer.pl and MAINTAINERS file
Date: Thu, 19 May 2016 16:25:45 +0200
Message-ID: <CAFLxGvwU-2aE7_0Suht--DvWby3RT=mdkpRomHz25MgicRfC3w@mail.gmail.com>
References: <1463574199-21077-1-git-send-email-robin@protonic.nl>
	<20160518150924.GA3871@kroah.com>
	<20160519105418.5df3c8f7@erd979>
	<871t4yfbmy.fsf_-_@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <871t4yfbmy.fsf_-_-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 19, 2016 at 2:57 PM, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> (Changed the subject from "Re: [PATCH v6 0/3] auxdisplay: Introduce ht16k33 driver")
>
> Robin van der Gracht <robin-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org> writes:
>
>>> And 4th, what is with the insane number of people on cc:?  Use
>>> get_maintainer.pl correctly please, and don't just hit everyone you
>>> can possibly think of with a cc: for no good reason.
>>
>> I did use the get_maintainer script. I solely passed the patch set as
>> command line argument.
>
> I think get_maintainer script should ignore MAINTAINERS file altogether.
> After I did drivers/net/wireless reorganisation, and had to make
> numerous changes to MAINTAINERS in the process, I have been CCed to all
> sorts of patchsets to which I have nothing to do with (this one
> included). I suspect get_maintainer.pl is to blame here.

Are you sure it is because you are listed as maintainer for specific files?
If you are maintain something you have to be CC'ed.
It is rather because get_maintainer.pl tries to be smart and uses git to
find people who have touched a file...

I guess instead you want something like:
http://permalink.gmane.org/gmane.linux.kernel.commits.head/538561

-- 
Thanks,
//richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
