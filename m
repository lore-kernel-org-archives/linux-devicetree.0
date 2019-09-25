From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH 2/2] misc: xilinx_flex: Add support for the flex noc
 Performance Monitor
Date: Wed, 25 Sep 2019 13:29:58 +0200
Message-ID: <20190925112958.GB1490631@kroah.com>
References: <2de75a74ef4086090c532d3b80b7d6dcd115e45e.1569410216.git.shubhrajyoti.datta@xilinx.com>
 <5694e92158ce93f774fc804c069b465b3dc1f62a.1569410216.git.shubhrajyoti.datta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5694e92158ce93f774fc804c069b465b3dc1f62a.1569410216.git.shubhrajyoti.datta@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, arnd@arndb.de, michal.simek@xilinx.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 25, 2019 at 04:53:07PM +0530, Shubhrajyoti Datta wrote:
> Add support for the FlexNoc Performance Monitor.
> Adds support for various port setting and monitoring
> the packets transactions. It supports LPD and FPD monitoring
> counters for read and write transaction requests and responses.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/misc/Kconfig          |   9 +
>  drivers/misc/Makefile         |   1 +
>  drivers/misc/xilinx_flex_pm.c | 644 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 654 insertions(+)
>  create mode 100644 drivers/misc/xilinx_flex_pm.c

You are creating new sysfs files (in a buggy and racy way), and not
documenting them in Documentation/ABI/ which is not allowed.

Please fix up both issues before resending.

thanks,

greg k-h
