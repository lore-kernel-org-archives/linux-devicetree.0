From: Rob Herring <robh+dt@kernel.org>
Subject: Re: Adding depends-on DT binding to break cyclic dependencies
Date: Thu, 29 Aug 2019 11:28:16 -0500
Message-ID: <CAL_JsqKWcGSzCF_ZyEo6bbuayoYks51A-JAMp_oLR1RyTUzNUA@mail.gmail.com>
References: <CAGETcx_pSnC_2D7ufLRyfE3b8uRc814XEf8zu+SpNtT7_Z8NLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGETcx_pSnC_2D7ufLRyfE3b8uRc814XEf8zu+SpNtT7_Z8NLg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 1:55 AM Saravana Kannan <saravanak@google.com> wrote:
>
> Hi Rob,
>
> Frank, Greg and I got together during ELC and had an extensive and
> very productive discussion about my "postboot supplier state cleanup"
> patch series [1]. The three of us are on the same page now -- the
> series as it stands is the direction we want to go in, with some minor
> refactoring, documentation and naming changes.
>
> However, one of the things Frank is concerned about (and Greg and I
> agree) in the current patch series is that the "cyclic dependency
> breaking" logic has been pushed off to individual drivers using the
> edit_links() callback.

I would think the core can detect this condition. There's nothing
device specific once you have the dependency tree. You still need to
know what device needs to probe first and the drivers are going to
have that knowledge anyways. So wouldn't it be enough to allow probe
to proceed for devices in the loop. Once 1 driver succeeds, then you
can enforce the dependencies on the rest.

> The concern being, there are going to be multiple device specific ad
> hoc implementations to break a cyclic dependency. Also, if a device
> can be part of a cyclic dependency, the driver for that device has to
> check for specific system/products in which the device is part of a
> cyclic dependency (because it might not always be part of a cycle),
> and then potentially have cycle/product specific code to break the
> cycle (since the cycle can be different on each system/product).
>
> One way to avoid all of the device/driver specific code and simplify
> my patch series by a non-trivial amount would be by adding a
> "depends-on" DT binding that can ONLY be used to break cycles. We can
> document it as such and reject any attempts to use it for other
> purposes. When a depends-on property is present in a device node, that
> specific device's supplier list will be parsed ONLY from the
> depends-on property and the other properties won't be parsed for
> deriving dependency information for that device.

Seems like only ignoring the dependencies with a cycle would be
sufficient. For example, consider a clock controller which has 2 clock
inputs from other clock controllers where one has a cycle and one
doesn't. Also consider it has a regulator dependency. We only need to
ignore the dependency for 1 of the clock inputs. The rest of the
dependencies should be honored.

> Frank, Greg and I like this usage model for a new depends-on DT
> binding. Is this something you'd be willing to accept?

To do the above, it needs to be inverted.

Convince me that cycles are really a problem anywhere besides clocks.
I'd be more comfortable with a clock specific property if we only need
it for clocks and I'm having a hard time imagining cycles for other
dependencies.

Rob
