MIME-Version: 1.0
Date: Wed, 17 Jul 2019 09:01:05 -0600
References: <20190712235245.202558-1-saravanak@google.com>
	<20190712235245.202558-4-saravanak@google.com>
In-Reply-To: <20190712235245.202558-4-saravanak@google.com>
Message-ID: <CAL_JsqJMUgY_23+CKkBo1Oq==io_0FivebJVxhUXySXJm3SBuA@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] driver core: Add sync_state driver/bus callback
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Saravana Kannan <saravanak@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 12, 2019 at 5:52 PM Saravana Kannan <saravanak@google.com> wrote:
>
> This sync_state driver/bus callback is called once all the consumers
> of a supplier have probed successfully.
>
> This allows the supplier device's driver/bus to sync the supplier
> device's state to the software state with the guarantee that all the
> consumers are actively managing the resources provided by the supplier
> device.
>
> To maintain backwards compatibility and ease transition from existing
> frameworks and resource cleanup schemes, late_initcall_sync is the
> earliest when the sync_state callback might be called.
>
> There is no upper bound on the time by which the sync_state callback
> has to be called. This is because if a consumer device never probes,
> the supplier has to maintain its resources in the state left by the
> bootloader. For example, if the bootloader leaves the display
> backlight at a fixed voltage and the backlight driver is never probed,
> you don't want the backlight to ever be turned off after boot up.

Doesn't putting the regulator in the simple-framebuffer node solve this problem in particular? 

I think this suffers from the same problem we have today, but makes it per driver rather than global. We still have side effects of the h/w state being out of sync with the ref count. We really need to get rid of 
