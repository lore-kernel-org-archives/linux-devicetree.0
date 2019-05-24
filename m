From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv3 3/4] firmware: rsu: document sysfs interface
Date: Fri, 24 May 2019 20:56:35 +0200
Message-ID: <20190524185635.GA13200@kroah.com>
References: <1558616610-499-1-git-send-email-richard.gong@linux.intel.com>
 <1558616610-499-4-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558616610-499-4-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 08:03:29AM -0500, richard.gong@linux.intel.com wrote:
> From: Richard Gong <richard.gong@intel.com>
> 
> Describe Intel Stratix10 Remote System Update (RSU) device attributes
> 
> Signed-off-by: Richard Gong <richard.gong@intel.com>
> Reviewed-by: Alan Tull <atull@kernel.org>
> ---
> v2: changed to use tab everywhere and wrap lines at 72 colums
>     s/soc:firmware:svc:rsu/stratix10-rsu.0
>     added for watchdog
> v3: s/KernelVersion:5.2/KernelVersion:5.3
> ---
>  .../testing/sysfs-devices-platform-stratix10-rsu   | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
> new file mode 100644
> index 0000000..73ebaf2
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
> @@ -0,0 +1,100 @@
> +		Intel Stratix10 Remote System Update (RSU) device attributes
> +
> +What:		/sys/devices/platform/stratix10-rsu.0/current_image
> +Date:		May 2019
> +KernelVersion:	5.3
> +Contact:	Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the address of image currently running in flash.
> +
> +What:		/sys/devices/platform/stratix10-rsu.0/fail_image
> +Date:		May 2019
> +KernelVersion:	5.3
> +Contact:	Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the address of failed image in flash.
> +
> +What:		/sys/devices/platform/stratix10-rsu.0/state
> +Date:		May 2019
> +KernelVersion:	5.3
> +Contact:	Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the state of RSU system.
> +		The state field has two parts: major error code in upper 16 bits and
> +		minor error code in lower 16 bits.
> +
> +		Major error code:
> +			0xF001	bitstream error
> +			0xF002	hardware access failure
> +			0xF003	bitstream corruption
> +			0xF004	internal error
> +			0xF005	device error
> +			0xF006	CPU watchdog timeout
> +			0xF007	internal unknown error
> +		Minor error code:
> +			Currently used only when major error is 0xF006
> +			(CPU watchdog timeout), in which case the minor
> +			error code is the value reported by CPU to
> +			firmware through the RSU notify command before
> +			the watchdog timeout occurs.
> +
> +What:		/sys/devices/platform/stratix10-rsu.0/fail_image
> +Date:           May 2019
> +KernelVersion:  5.3
> +Contact:        Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the version number of RSU firmware.
> +
> +What:		/sys/devices/platform/stratix10-rsu.0/error_location
> +Date:           May 2019
> +KernelVersion:  5.3
> +Contact:        Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the error offset inside the image that failed.
> +

You are mixing tabs and spaces in this file.  Please always just use
tabs.

thanks,

greg k-h
