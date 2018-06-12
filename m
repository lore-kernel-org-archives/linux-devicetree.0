Return-Path: <robherring2@gmail.com>
Date: Tue, 12 Jun 2018 14:09:07 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: Add vddl regulator control
Message-ID: <20180612200907.GA24462@rob-hp-laptop>
References: <20180531204250.209216-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180531204250.209216-1-swboyd@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dtor@chromium.org>, Doug Anderson <dianders@chromium.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, May 31, 2018 at 01:42:50PM -0700, Stephen Boyd wrote:
> Some wacom w9013 devices have a vddl supply for "low voltage"
> requirements. Add support in this driver to turn on this low voltage
> supply.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Dmitry Torokhov <dtor@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/input/hid-over-i2c.txt           |  3 ++-

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/hid/i2c-hid/i2c-hid.c                 | 19 +++++++++++++++++++
>  include/linux/platform_data/i2c-hid.h         |  2 ++
>  3 files changed, 23 insertions(+), 1 deletion(-)
