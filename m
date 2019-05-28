From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv4 3/4] firmware: rsu: document sysfs interface
Date: Tue, 28 May 2019 16:19:08 -0700
Message-ID: <20190528231908.GB28886@kroah.com>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-4-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559074833-1325-4-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 03:20:32PM -0500, richard.gong@linux.intel.com wrote:
> +What:		/sys/devices/.../stratix10-rsu.0/driver/fail_image
> +Date:		May 2019
> +KernelVersion:	5.3
> +Contact:	Richard Gong <richard.gong@intel.com>
> +Description:
> +		(RO) the version number of RSU firmware.

"fail_image" is the version number?  That doesn't match up with what the
code says :(

What happened to the version sysfs file?

thanks,

greg k-h
