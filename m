From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv4 2/4] firmware: add Intel Stratix10 remote system update
 driver
Date: Tue, 28 May 2019 16:15:57 -0700
Message-ID: <20190528231557.GA28886@kroah.com>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 03:20:31PM -0500, richard.gong@linux.intel.com wrote:
> From: Richard Gong <richard.gong@intel.com>
> 
> The Intel Remote System Update (RSU) driver exposes interfaces access
> through the Intel Service Layer to user space via sysfs interface.
> The RSU interfaces report and control some of the optional RSU features
> on Intel Stratix 10 SoC.
> 
> The RSU feature provides a way for customers to update the boot
> configuration of a Intel Stratix 10 SoC device with significantly reduced
> risk of corrupting the bitstream storage and bricking the system.
> 
> Signed-off-by: Richard Gong <richard.gong@intel.com>
> Reviewed-by: Alan Tull <atull@kernel.org>

Is Alan reviewing all of these new versions before you post them
publicly?  If so, great, if not, don't add tags to new versions when you
change things around...

thanks,

greg k-h
