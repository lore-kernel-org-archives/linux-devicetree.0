Return-Path: <SRS0=v6u/=KF=linuxfoundation.org=gregkh@kernel.org>
Date: Sat, 21 Jul 2018 08:36:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCHv4 1/4] tty: serial: uartlite: Add structure for private
 data
Message-ID: <20180721063629.GA30240@kroah.com>
References: <1531892462-11085-1-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531892462-11085-1-git-send-email-shubhrajyoti.datta@xilinx.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, shubhrajyoti.datta@gmail.com, robh+dt@kernel.org, Tanvi Desai <tanvi.desai@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 18, 2018 at 11:10:59AM +0530, Shubhrajyoti Datta wrote:
> Add struct uartlite_data, to store the private data of the Uartlite
> driver.
> 
> Signed-off-by: Tanvi Desai <tanvi.desai@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  drivers/tty/serial/uartlite.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)

You have a bunch of patches here, all mis-marked with v3 and v4 in the
same series.  and as a stand-alone series.  and as an individual patch.

I have no idea what is going on here at all, so I'm deleting them all
from my queue.  Please be more careful and properly version the whole
series when resending things.

Also, you need to document what changed in each version, I don't see
that here either :(

thanks,

greg k-h
