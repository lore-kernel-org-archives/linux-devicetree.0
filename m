From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio
 clocksource
Date: Fri, 9 Oct 2015 11:46:32 -0700
Message-ID: <20151009184632.GR26883@codeaurora.org>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
 <20151007154727.GC28981@leverpostej>
 <yw1xvbaik4mn.fsf@unicorn.mansr.com>
 <CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg@mail.gmail.com>
 <yw1xmvvtk906.fsf@unicorn.mansr.com>
 <yw1xy4fchv4z.fsf@unicorn.mansr.com>
 <CAL_JsqLSyCAFCHythKyyAXg_yEPLzdYA+tJq2cj_NnXL+Et5GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLSyCAFCHythKyyAXg_yEPLzdYA+tJq2cj_NnXL+Et5GQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/09, Rob Herring wrote:
> +Stephen who has worked on this code.
>=20
> On Fri, Oct 9, 2015 at 11:19 AM, M=E5ns Rullg=E5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> w=
rote:
> > M=E5ns Rullg=E5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> writes:
> >
> >> Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
> >>
> >>> On Wed, Oct 7, 2015 at 11:47 AM, M=E5ns Rullg=E5rd <mans-2StjZFpD7Gc@public.gmane.org=
m> wrote:
> >>>> What would be a proper way to select a sched_clock source?  I re=
alise
> >>>> it's a Linux-specific thing and DT is supposed to be generic, bu=
t the
> >>>> information must be provided somehow.
> >>>
> >>> The kernel already has some logic to do this. Most number of bits
> >>> followed by highest frequency will be the winning sched_clock. Yo=
u
> >>> might also want to look at things like always on or not.
> >>
> >> The problem is that sched_clock_register() doesn't take a pointer =
to be
> >> passed back to the read_sched_clock callback like most interfaces =
of
> >> this type do.  This means the callback must use global variables s=
et up
> >> before the register call, but at that time there's no way of knowi=
ng
> >> which one will be used.  If there were a way of getting a pointer =
to the
> >> callback, it would be a simple matter of registering all instances=
 and
> >> letting the kernel choose which to use.
> >
> > Anyone got a comment on this?  Do I have to send a patch adding thi=
s
> > before anyone will tell me why it's a bad idea?  (That method almos=
t
> > always works.)
>=20
> Adding a ptr to the callback seems fine to me.
>=20

Does that mean a flag day? Urgh. Pain. I'm not opposed to adding
a pointer, in fact it might be better for performance so that we
don't take a cache miss in read() functions that need to load
some pointer. We were talking about that problem a few months
ago, but nothing came of it.

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
