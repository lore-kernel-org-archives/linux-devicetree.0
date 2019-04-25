From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv1 5/6] firmware: rsu: document sysfs interface
Date: Thu, 25 Apr 2019 22:28:27 +0200
Message-ID: <20190425202827.GD22307@kroah.com>
References: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
 <1554835562-25056-6-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554835562-25056-6-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 01:46:01PM -0500, richard.gong@linux.intel.com wrote:
> From: Richard Gong <richard.gong@intel.com>
> 
> Describe Intel Stratix10 Remote System Update (RSU) device attributes
> 
> Signed-off-by: Richard Gong <richard.gong@intel.com>
> Reviewed-by: Alan Tull <atull@kernel.org>
> ---
>  .../testing/sysfs-devices-platform-stratix10-rsu   | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
> new file mode 100644
> index 0000000..cb461ee
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
> @@ -0,0 +1,78 @@
> +		Intel Stratix10 Remote System Update (RSU) device attributes
> +
> +What:		/sys/devices/platform/soc:firmware:svc/soc:firmware:svc:rsu/current_image
> +Date:		April 2019
> +KernelVersion:	5.2
> +Contact:	Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the address of image currently running in flash.
> +
> +What:           /sys/devices/platform/soc:firmware:svc/soc:firmware:svc:rsu/fail_image
> +Date:           April 2019
> +KernelVersion:  5.2
> +Contact:        Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the address of failed image in flash.
> +
> +What:           /sys/devices/platform/soc:firmware:svc/soc:firmware:svc:rsu/state
> +Date:           April 2019
> +KernelVersion:  5.2
> +Contact:        Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the state of RSU system.
> +		The state field has two parts: major error code in upper 16 bits and minor error code
> +		in lower 16 bits.
> +		1. Major error code
> +			0xF001 -- bitstream error
> +			0xF002 -- hardware access failure
> +			0xF003 -- bitstream corruption
> +			0xF004 -- internal error
> +			0xF005 -- device error
> +			0xF006 -- HPS watchdog timeout
> +			0xF007 -- internal unknown error
> +		2: Minor error code
> +			Currently used only when major error is 0xF006 (HPS watchdog timeout), in which
> +		case the minor error code is the value reported by HPS to firmware through the RSU notify
> +		command before the watchdog timeout occurs.

Properly wrap your lines at 72 colums.
