From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of/platform: add initcall_debug logs for device creates
Date: Tue, 19 Jun 2018 08:33:46 -0600
Message-ID: <CAL_JsqLZXwD7SEmJYPZpRXZcdmS6XwPOdVY_M22Q+cV0xX7E9Q@mail.gmail.com>
References: <20180619014608.92061-1-toddpoynor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619014608.92061-1-toddpoynor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Todd Poynor <toddpoynor@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Android Kernel Team <kernel-team@android.com>, Todd Poynor <toddpoynor@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 7:46 PM, Todd Poynor <toddpoynor@gmail.com> wrote:
> From: Todd Poynor <toddpoynor@google.com>
>
> Add initcall_debug logs for the amount of time taken by each OF platform
> bus device create call.  For example:
>
>    of platform device create /reserved-memory/ramoops@a3800000 took
>    3255 usecs
>
> initcall_debug already reports the total of all such device creates
> as a single entry for function of_platform_default_populate_init (or
> similar, depending on the board).  The new logs help identify which of
> the potentially hundreds of device inits take significant amounts of
> time.

It's really the probe time that matters here. Outside of that,
creating the devices should be fairly constant time. So why not add
timing around non bus specific probe code (driver_probe_device)
instead of adding this in multiple places. Then you can remove the
timing from deferred probe code.

Rob
