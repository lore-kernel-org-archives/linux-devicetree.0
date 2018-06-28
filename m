Return-Path: <SRS0=MKI6=JO=linuxfoundation.org=gregkh@kernel.org>
Date: Thu, 28 Jun 2018 21:12:12 +0900
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/4] tty: serial: uartlite: Add clock adaptation
Message-ID: <20180628121212.GA22500@kroah.com>
References: <1530102225-6459-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1530102225-6459-2-git-send-email-shubhrajyoti.datta@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530102225-6459-2-git-send-email-shubhrajyoti.datta@xilinx.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, shubhrajyoti.datta@gmail.com, Tanvi Desai <tanvi.desai@xilinx.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 27, 2018 at 05:53:43PM +0530, Shubhrajyoti Datta wrote:
>  - Add support of Common Clock Framework for Uartlite driver
>  - Add support for suspend and resume operations
> 

When you have to list multiple things that a single patch does, that's a
huge hint that it should be broken up into smaller pieces.  Can you
split this up into two patches please?

thanks,

greg k-h
