From: Sandeep Patil <sspatil@android.com>
Subject: Re: [RESEND PATCH v1 1/5] of/platform: Speed up
 of_find_device_by_node()
Date: Tue, 11 Jun 2019 14:52:42 -0700
Message-ID: <20190611215242.GE212690@google.com>
References: <20190604003218.241354-1-saravanak@google.com>
 <20190604003218.241354-2-saravanak@google.com>
 <CAL_JsqLWfNUJm23x+doJDwyuMLOvqWAnLKGQYcgVct-AyWb9LQ@mail.gmail.com>
 <570474f4-8749-50fd-5f72-36648ed44653@gmail.com>
 <CAGETcx8M3YkUBZ-e2LLfrbWgnMKMMNG5cv=p8MMmBe7ZyPJ7xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGETcx8M3YkUBZ-e2LLfrbWgnMKMMNG5cv=p8MMmBe7ZyPJ7xw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 11, 2019 at 01:56:25PM -0700, 'Saravana Kannan' via kernel-team wrote:
> On Tue, Jun 11, 2019 at 8:18 AM Frank Rowand <frowand.list@gmail.com> wrote:
> >
> > Hi Saravana,
> >
> > On 6/10/19 10:36 AM, Rob Herring wrote:
> > > Why are you resending this rather than replying to Frank's last
> > > comments on the original?
> >
> > Adding on a different aspect...  The independent replies from three different
> > maintainers (Rob, Mark, myself) pointed out architectural issues with the
> > patch series.  There were also some implementation issues brought out.
> > (Although I refrained from bringing up most of my implementation issues
> > as they are not relevant until architecture issues are resolved.)
> 
> Right, I'm not too worried about the implementation issues before we
> settle on the architectural issues. Those are easy to fix.
> 
> Honestly, the main points that the maintainers raised are:
> 1) This is a configuration property and not describing the device.
> Just use the implicit dependencies coming from existing bindings.
> 
> I gave a bunch of reasons for why I think it isn't an OS configuration
> property. But even if that's not something the maintainers can agree
> to, I gave a concrete example (cyclic dependencies between clock
> provider hardware) where the implicit dependencies would prevent one
> of the devices from probing till the end of time. So even if the
> maintainers don't agree we should always look at "depends-on" to
> decide the dependencies, we still need some means to override the
> implicit dependencies where they don't match the real dependency. Can
> we use depends-on as an override when the implicit dependencies aren't
> correct?
> 
> 2) This doesn't need to be solved because this is just optimizing
> probing or saving power ("we should get rid of this auto disabling"):
> 
> I explained why this patch series is not just about optimizing probe
> ordering or saving power. And why we can't ignore auto disabling
> (because it's more than just auto disabling). The kernel is currently
> broken when trying to use modules in ARM SoCs (probably in other
> systems/archs too, but I can't speak for those).
> 
> 3) Concerns about backwards compatibility
> 
> I pointed out why the current scheme (depends-on being the only source
> of dependency) doesn't break compatibility. And if we go with
> "depends-on" as an override what we could do to keep backwards
> compatibility. Happy to hear more thoughts or discuss options.
> 
> 4) How the "sync_state" would work for a device that supplies multiple
> functionalities but a limited driver.

<snip>
To be clear, all of above are _real_ problems that stops us from efficiently
load device drivers as modules for Android.

So, if 'depends-on' doesn't seem like the right approach and "going back to
the drawing board" is the ask, could you please point us in the right
direction?

- ssp
