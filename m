From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RESEND PATCH v1 0/5] Solve postboot supplier cleanup and
 optimize probe ordering
Date: Wed, 26 Jun 2019 15:30:57 -0600
Message-ID: <CAL_JsqJyO9Fpq+Lzrc9NdiFBZ_9M31_mjfRyKM=ENtW-zVa8VA@mail.gmail.com>
References: <20190604003218.241354-1-saravanak@google.com> <20190624223707.GH203031@google.com>
 <20190625035313.GA13239@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625035313.GA13239@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sandeep Patil <sspatil@android.com>, Saravana Kannan <saravanak@google.com>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 9:54 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
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

I fail to see how the different Linux behavior between drivers
built-in and as modules has anything whatsoever to do with DT. Fix the
problems in Linux and use the dependencies that are already expressed
in DT and *then* we can talk about using DT to provide *hints* for
solving any remaining problems.

Rob
