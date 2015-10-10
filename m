From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio
 clocksource
Date: Fri, 9 Oct 2015 17:00:56 -0700
Message-ID: <20151010000047.GU26883@codeaurora.org>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
 <20151007154727.GC28981@leverpostej>
 <yw1xvbaik4mn.fsf@unicorn.mansr.com>
 <CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg@mail.gmail.com>
 <yw1xmvvtk906.fsf@unicorn.mansr.com>
 <yw1xy4fchv4z.fsf@unicorn.mansr.com>
 <CAL_JsqLSyCAFCHythKyyAXg_yEPLzdYA+tJq2cj_NnXL+Et5GQ@mail.gmail.com>
 <20151009184632.GR26883@codeaurora.org>
 <yw1xtwpzj01x.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <yw1xtwpzj01x.fsf-OEaqT8BN2ezZK2NkWkPsZwC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/09, M=E5ns Rullg=E5rd wrote:
> Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:
>=20
> > On 10/09, Rob Herring wrote:
> >>=20
> >> Adding a ptr to the callback seems fine to me.
> >>=20
> >
> > Does that mean a flag day? Urgh. Pain. I'm not opposed to adding
> > a pointer, in fact it might be better for performance so that we
> > don't take a cache miss in read() functions that need to load
> > some pointer. We were talking about that problem a few months
> > ago, but nothing came of it.
>=20
> Flag day in what sense?  There aren't all that many users of the
> interface (56, to be precise), and sched_clock_register() isn't
> exported.=20

That's exactly what a flag day is. Lots of coordination, lots of
acks, etc. Last time when I changed the registration API I made a
new registration API, moved every caller over one by one, and
then deleted the old registration API. That's how you manage a
flag day.

We could probably do the same thing again with two different
types of registration APIs so that we move over users one by one.
The old registration API would be wrapped with a sched_clock
local function that doesn't pass the pointer it gets called with,
while the new registration API would fill in the function pointer
that we call directly from the core code. The double function
call is probably bad for performance, so I guess we should get
rid of it and always pass the pointer to the callback. But this
is at least a method to convert everything gradually without
breaking users that may be going through different trees.

> Verifying the change will be a minor pain, but I don't see
> why it should have any major consequences.  Obviously I'd just set th=
e
> pointer to null for existing users and leave it for the respective
> maintainers to make proper use of it where sensible.
>=20

Sure.

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
