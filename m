From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio clocksource
Date: Fri, 09 Oct 2015 20:48:10 +0100
Message-ID: <yw1xtwpzj01x.fsf@unicorn.mansr.com>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
	<20151007154727.GC28981@leverpostej>
	<yw1xvbaik4mn.fsf@unicorn.mansr.com>
	<CAL_JsqJDZKTB8xowVdGK=9=4omp_wHdwqYP_Ln3-QdknjAwxSg@mail.gmail.com>
	<yw1xmvvtk906.fsf@unicorn.mansr.com>
	<yw1xy4fchv4z.fsf@unicorn.mansr.com>
	<CAL_JsqLSyCAFCHythKyyAXg_yEPLzdYA+tJq2cj_NnXL+Et5GQ@mail.gmail.com>
	<20151009184632.GR26883@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151009184632.GR26883-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (Stephen Boyd's message
	of "Fri, 9 Oct 2015 11:46:32 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> writes:

> On 10/09, Rob Herring wrote:
>> +Stephen who has worked on this code.
>>=20
>> On Fri, Oct 9, 2015 at 11:19 AM, M=E5ns Rullg=E5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> =
wrote:
>> > M=E5ns Rullg=E5rd <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org> writes:
>> >
>> >> Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>> >>
>> >>> On Wed, Oct 7, 2015 at 11:47 AM, M=E5ns Rullg=E5rd <mans@mansr.c=
om> wrote:
>> >>>> What would be a proper way to select a sched_clock source?  I r=
ealise
>> >>>> it's a Linux-specific thing and DT is supposed to be generic, b=
ut the
>> >>>> information must be provided somehow.
>> >>>
>> >>> The kernel already has some logic to do this. Most number of bit=
s
>> >>> followed by highest frequency will be the winning sched_clock. Y=
ou
>> >>> might also want to look at things like always on or not.
>> >>
>> >> The problem is that sched_clock_register() doesn't take a pointer=
 to be
>> >> passed back to the read_sched_clock callback like most interfaces=
 of
>> >> this type do.  This means the callback must use global variables =
set up
>> >> before the register call, but at that time there's no way of know=
ing
>> >> which one will be used.  If there were a way of getting a pointer=
 to the
>> >> callback, it would be a simple matter of registering all instance=
s and
>> >> letting the kernel choose which to use.
>> >
>> > Anyone got a comment on this?  Do I have to send a patch adding th=
is
>> > before anyone will tell me why it's a bad idea?  (That method almo=
st
>> > always works.)
>>=20
>> Adding a ptr to the callback seems fine to me.
>>=20
>
> Does that mean a flag day? Urgh. Pain. I'm not opposed to adding
> a pointer, in fact it might be better for performance so that we
> don't take a cache miss in read() functions that need to load
> some pointer. We were talking about that problem a few months
> ago, but nothing came of it.

=46lag day in what sense?  There aren't all that many users of the
interface (56, to be precise), and sched_clock_register() isn't
exported.  Verifying the change will be a minor pain, but I don't see
why it should have any major consequences.  Obviously I'd just set the
pointer to null for existing users and leave it for the respective
maintainers to make proper use of it where sensible.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
