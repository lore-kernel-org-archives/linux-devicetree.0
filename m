From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 5/5] driver core: Add sync_state driver/bus callback
Date: Fri, 24 May 2019 07:48:40 +0200
Message-ID: <20190524054840.GB31664@kroah.com>
References: <20190524010117.225219-1-saravanak@google.com>
 <20190524010117.225219-6-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524010117.225219-6-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 06:01:16PM -0700, Saravana Kannan wrote:
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
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/base/core.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/of/platform.c  |  9 +++++++++
>  include/linux/device.h | 19 +++++++++++++++++++
>  3 files changed, 67 insertions(+)

Also:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

thanks,

greg k-h
