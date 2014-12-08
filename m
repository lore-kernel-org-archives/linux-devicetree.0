From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Mon, 08 Dec 2014 17:39:05 +0000
Message-ID: <20141208173905.C4A48C40D73@trevor.secretlab.ca>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20141204103104.7D8E0C40992@trevor.secretlab.ca>
	<CAGXu5jKZYrGpSwdpG8Pk=0N87Z1yT3S=utzCnQgvZ+4YeA2hKg@mail.gmail.com>
	<0CD21000-1C09-47D7-AE3B-3DAE942CB861@antoniou-consulting.com>
	<CAGXu5j+txFEtMSXab9LjcbvL5rhbPc94wimBMOyQj_Fcf3QZjw@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5j+txFEtMSXab9LjcbvL5rhbPc94wimBMOyQj_Fcf3QZjw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 5 Dec 2014 14:01:44 -0800
, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 wrote:
> On Fri, Dec 5, 2014 at 1:27 PM, Pantelis Antoniou
> <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> >
> > Devices will be created potentially; those have a probe method, which can
> > can make anything happen.
> >
> > This is exactly like from a security point of view as loading modules.
> 
> Just a random idea, but would it make sense to just tie the logic to
> the modules_disabled flag? Probably not, but thought I'd throw it out
> there.

I think it might. This opens a whole new window for manipulating the
kernel state. If existing userspace disables modules, but is booted on a
new kernel, then there is suddenly a new window for affecting change on
the kernel that it didn't know about.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
