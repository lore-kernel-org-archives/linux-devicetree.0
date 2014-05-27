From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: handle NULL node in of_get_next_available_child
Date: Tue, 27 May 2014 21:17:11 +0100
Message-ID: <20140527201711.553B8C40BD2@trevor.secretlab.ca>
References: <1400874192-29400-1-git-send-email-f.fainelli@gmail.com>
	<20140527111930.696AAC4156C@trevor.secretlab.ca>
	<CAGVrzcYKCGXbOR1FRaOLxjPeaFEq6skgUvG_i4nqGSdJBUZRqQ@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGVrzcYKCGXbOR1FRaOLxjPeaFEq6skgUvG_i4nqGSdJBUZRqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 27 May 2014 10:36:10 -0700, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Grant,
> 
> 2014-05-27 4:19 GMT-07:00 Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > On Fri, 23 May 2014 12:43:11 -0700, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> Add an early check for the node argument in
> >> of_get_next_available_child() to avoid dereferencing a NULL node pointer
> >> a few lines after.
> >>
> >> CC: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > Is there a bug that exposed this path?
> 
> Daniel sent a patch recently [1] which makes us call
> for_each_available_child_of_node() on a potentially NULL node
> argument.

And yet in your reply to that patch you argued that the NULL check
should be in the caller!

Anyway, this isn't a big deal. Post a patch fixing both and I'll apply
it.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
