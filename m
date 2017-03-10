From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 1/3] usb: orion-echi: Add support for the Armada 3700
Date: Fri, 10 Mar 2017 15:50:30 +0100
Message-ID: <20170310145030.GA3731@kroah.com>
References: <Pine.LNX.4.44L0.1703091318010.1560-100000@iolanthe.rowland.org>
 <87o9x9jw1g.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87o9x9jw1g.fsf@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 10, 2017 at 10:55:23AM +0100, Gregory CLEMENT wrote:
> Hi Alan,
>  
>  On jeu., mars 09 2017, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > On Thu, 9 Mar 2017, Gregory CLEMENT wrote:
> >
> >> From: Hua Jing <jinghua@marvell.com>
> >> 
> >> - Add a new compatible string for the Armada 3700 SoCs
> >> 
> >> - add sbuscfg support for orion usb controller driver. For the SoCs
> >>   without hlock, need to program BAWR/BARD/AHBBRST fields in the sbuscfg
> >>   register to guarantee the AHB master's burst would not overrun or
> >>   underrun the FIFO.
> >> 
> >> - the sbuscfg register has to be set after the usb controller reset,
> >>   otherwise the value would be overridden to 0. In order to do this, the
> >>   reset callback is registered.
> >> 
> >> [gregory.clement@free-electrons.com: - reword commit and comments
> >> 				     - fix error path in ehci_orion_drv_reset()
> >> 				     - fix checkpatch warning]
> >> Signed-off-by: Hua Jing <jinghua@marvell.com>
> >> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> >> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> >
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Thanks!
> 
> And what about the second patch "usb: host: Allow to build ehci orion
> with mvebu SoCs " ?
> 
> I don't remember what is the workflow for the usb subsystem. Will you do
> a pull request to GKH? Or maybe he collects himself the patch once you
> give your acked-by.
> 
> I will take care of the third patch and apply on the mvebu/dt64 branch
> now that you agree the extension for the driver.

I'll take all of these once they look "good enough".  Give me a week or
so to get to all of the pending patches in my queue...

thanks,

greg k-h
