From: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v1 0/5] Solve postboot supplier cleanup and optimize probe ordering
Date: Fri, 24 May 2019 19:08:56 -0700
Message-ID: <CAGETcx-bNhnfaThygrSbnbAmQ8PqEGHj8eVO3OvhJAomJ936Eg@mail.gmail.com>
References: <20190524010117.225219-1-saravanak@google.com> <06b479e2-e8a0-b3e8-567c-7fa0f1c5bdf6@gmail.com>
 <CAGETcx-21GEoBKhpzcsrDt3sEo-vUpwqnr3To7VbSPd8aW86Nw@mail.gmail.com>
 <6d3995c1-e1e7-35ff-d091-501822c97ecd@gmail.com> <0634ea45-2941-73fb-f8d8-b536e929a4a8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0634ea45-2941-73fb-f8d8-b536e929a4a8@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

Ugh... mobile app is sending HTML emails. Replying again.

On Fri, May 24, 2019 at 5:25 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 5/24/19 5:22 PM, Frank Rowand wrote:
> > On 5/24/19 2:53 PM, Saravana Kannan wrote:
> >> On Fri, May 24, 2019 at 10:49 AM Frank Rowand <frowand.list@gmail.com> wrote:
> >>>
> >>> On 5/23/19 6:01 PM, Saravana Kannan wrote:
> >
> > < snip >
> >
> >>> Another flaw with this method is that existing device trees
> >>> will be broken after the kernel is modified, because existing
> >>> device trees do not have the depends-on property.  This breaks
> >>> the devicetree compatibility rules.
> >>
> >> This is 100% not true with the current implementation. I actually
> >> tested this. This is fully backwards compatible. That's another reason
> >> for adding depends-on and going by just what it says. The existing
> >> bindings were never meant to describe only mandatory dependencies. So
> >> using them as such is what would break backwards compatibility.
> >
> > Are you saying that an existing, already compiled, devicetree (an FDT)
> > can be used to boot a new kernel that has implemented this patch set?
> >
> > The new kernel will boot with the existing FDT that does not have
> > any depends-on properties?

You sent out a lot of emails on this topic. But to answer them all.
The existing implementation is 100% backwards compatible.

> I overlooked something you said in the email I replied to.  You said:
>
>    "that depends-on becomes the source of truth if it exists and falls
>    back to existing common bindings if "depends-on" isn't present"

This is referring to an alternate implementation where implicit
dependencies are used by the kernel but new "depends-on" property
would allow overriding in cases where the implicit dependencies are
wrong. But this will need a kernel command line flag to enable this
feature so that we can be backwards compatible. Otherwise it won't be.

> Let me go back to look at the patch series to see how it falls back
> to the existing bindings.

Current patch series doesn't really "fallback" but rather it only acts
on this new property. Existing FDT binaries simply don't have this. So
it won't have any impact on the kernel behavior. But yes, looking at
the patches again will help :)

-Saravana
