From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RESEND PATCH v1 0/5] Solve postboot supplier cleanup and
 optimize probe ordering
Date: Tue, 25 Jun 2019 11:53:13 +0800
Message-ID: <20190625035313.GA13239@kroah.com>
References: <20190604003218.241354-1-saravanak@google.com>
 <20190624223707.GH203031@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190624223707.GH203031@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sandeep Patil <sspatil@android.com>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

On Mon, Jun 24, 2019 at 03:37:07PM -0700, Sandeep Patil wrote:
> We are trying to make sure that all (most) drivers in an Aarch64 system can
> be kernel modules for Android, like any other desktop system for
> example. There are a number of problems we need to fix before that happens
> ofcourse.

I will argue that this is NOT an android-specific issue.  If the goal of
creating an arm64 kernel that will "just work" for a wide range of
hardware configurations without rebuilding is going to happen, we need
to solve this problem with DT.  This goal was one of the original wishes
of the arm64 development effort, let's not loose sight of it as
obviously, this is not working properly just yet.

It just seems that Android is the first one to actually try and
implement that goal :)

thanks,

greg k-h
