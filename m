From: Sandeep Patil <sspatil@android.com>
Subject: Re: [RESEND PATCH v1 0/5] Solve postboot supplier cleanup and
 optimize probe ordering
Date: Tue, 25 Jun 2019 21:30:52 -0700
Message-ID: <20190626043052.GF212690@google.com>
References: <20190604003218.241354-1-saravanak@google.com>
 <20190624223707.GH203031@google.com>
 <20190625035313.GA13239@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625035313.GA13239@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 11:53:13AM +0800, Greg Kroah-Hartman wrote:
> On Mon, Jun 24, 2019 at 03:37:07PM -0700, Sandeep Patil wrote:
> > We are trying to make sure that all (most) drivers in an Aarch64 system can
> > be kernel modules for Android, like any other desktop system for
> > example. There are a number of problems we need to fix before that happens
> > ofcourse.
> 
> I will argue that this is NOT an android-specific issue.  If the goal of
> creating an arm64 kernel that will "just work" for a wide range of
> hardware configurations without rebuilding is going to happen, we need
> to solve this problem with DT.  This goal was one of the original wishes
> of the arm64 development effort, let's not loose sight of it as
> obviously, this is not working properly just yet.

I believe the proposed solution in this patch series is just that. I am not
sure what the alternatives are. The alternative suggested was to reuse
pre-existing dt-bindings for dependency based probe re-ordering and resolution.

However, it seems we had no way to *really* check if these dependencies are
the real. So, a device may or may not actually depend on the other device for
probe / initialization when the dependency is mentioned in it's dt node. From
DT's point of view, there is no way to tell this ..

I don't know how this is handled in x86. With DT, I don't see how we can do
this unless DT dependencies are _really_ tied with runtime dependencies (The
cycles would have been apparent if that was the case.

Honestly, the "depends-on" property suggested here just piles on to the
existing state. So, it is somewhat doubling the exiting bindings. It says,
you must use depends-on property to define probe / initialization dependency.
The existing bindings like 'clock', 'interrupt', '*-supply' do not enforce
that right now, so you will have device nodes that have these bindings right
now but don't necessarily need them for successful probe for example.

> 
> It just seems that Android is the first one to actually try and
> implement that goal :)

I guess :)

- ssp

> 
> thanks,
> 
> greg k-h
