From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Mon, 08 Dec 2014 18:25:31 +0000
Message-ID: <20141208182531.41BD6C40D73@trevor.secretlab.ca>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20141204103104.7D8E0C40992@trevor.secretlab.ca>
	<8795CB40-87D6-4683-8396-987A49E94574@konsulko.com>
	<20141205164450.A9294C40B61@trevor.secretlab.ca>
	<E64BA68B-A339-4BB2-B453-B8A9165CB9B7@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E64BA68B-A339-4BB2-B453-B8A9165CB9B7-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 5 Dec 2014 19:58:27 +0200
, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
 wrote:
> Hi Grant,
> 
> > On Dec 5, 2014, at 18:44 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> >> 
> [snip]
> 
> >> For instance, if the user issued a load request for a path in a container
> >> which is the namespace under which the firmware file is located? Is it the
> >> non-container filesystem, or is it under the container filesystem that
> >> issued the request. The firmware layer does not have an API to discern.
> > 
> > Wait, what? Why on earth would you want to expose this interface in a container?
> > 
> 
> It was a complaint raised. 
> 
> Look at this thread.
> 
> http://permalink.gmane.org/gmane.linux.documentation/27655

I've replied on that thread. I don't think the issues raised there
warrent two completely separate methods for loading the data into the
kernel. I want to see one method only.

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
