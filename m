From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] USB: move usb debugfs directory creation to the usb
 common core
Date: Thu, 6 Jun 2019 08:58:22 +0200
Message-ID: <20190606065822.GA29436@kroah.com>
References: <20190605092816.GA23758@kroah.com>
 <20190605124440.GD17558@kroah.com>
 <1559788368.8487.109.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559788368.8487.109.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 10:32:48AM +0800, Chunfeng Yun wrote:
> On Wed, 2019-06-05 at 14:44 +0200, Greg Kroah-Hartman wrote:
> > The USB gadget subsystem wants to use the USB debugfs root directory, so
> > move it to the common "core" USB code so that it is properly initialized
> > and removed as needed.
> > 
> > In order to properly do this, we need to load the common code before the
> > usb core code, when everything is linked into the kernel, so reorder the
> > link order of the code.
> > 
> > Also as the usb common code has the possibility of the led trigger logic
> > to be merged into it, handle the build option properly by only having
> > one module init/exit function and have the common code initialize the
> > led trigger if needed.
> > 
> > Reported-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > Chunfeng, can you try testing this again?
> 
> Tested-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Thank you, Greg, Felipe

Thanks for the review, and all of the different iterations for this.
For something so "simple" it sure took us all a number of tries :)

I'll go queue it up now so that your future work can rely on it.

thanks,

greg k-h
