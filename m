From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: A potential broken at platform driver?
Date: Tue, 4 Jun 2019 16:28:37 +0200
Message-ID: <20190604142837.GB28355@kroah.com>
References: <1559074833-1325-1-git-send-email-richard.gong@linux.intel.com>
 <1559074833-1325-3-git-send-email-richard.gong@linux.intel.com>
 <20190528232224.GA29225@kroah.com>
 <1e3b5447-b776-f929-bca6-306f90ac0856@linux.intel.com>
 <b608d657-9d8c-9307-9290-2f6b052a71a9@linux.intel.com>
 <20190603180255.GA18054@kroah.com>
 <b3dd022b-b585-3dfb-5fe6-9c9f5498bc77@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3dd022b-b585-3dfb-5fe6-9c9f5498bc77@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Gong <richard.gong@linux.intel.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, sen.li@intel.com, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 03, 2019 at 06:08:37PM -0500, Richard Gong wrote:
> Hi Greg,
> 
> On 6/3/19 1:02 PM, Greg KH wrote:
> > On Mon, Jun 03, 2019 at 10:57:18AM -0500, Richard Gong wrote:
> > > 
> > > Hi Greg,
> > > 
> > > Following your suggestion, I replaced devm_device_add_groups() with .group =
> > > rus_groups in my version #4 submission. But I found out that RSU driver
> > > outputs the garbage data if I use .group = rsu_groups.
> > 
> > What is "garbage"?
> I mean incorrect status info.
> 
> > 
> > > To make RSU driver work properly, I have to revert the change at version #4
> > > and use devm_device_add_groups() again. Sorry, I didn't catch this problem
> > > early.
> > > 
> > > I did some debug & below are captured log, you can see priv pointer get
> > > messed at current_image_show(). I am not sure if something related to
> > > platform driver work properly. I attach my debug patch in this mail.
> > > 
> > > 1. Using .groups = rsu_groups,
> > > 
> > > [    1.191115] *** rsu_status_callback:
> > > [    1.194782] res->a1=2000000
> > > [    1.197588] res->a1=0
> > > [    1.199865] res->a2=0
> > > [    1.202150] res->a3=0
> > > [    1.204433] priv=0xffff80007aa28e80
> > > [    1.207933] version=0, state=0, current_image=2000000, fail_image=0,
> > > error_location=0, error_details=0
> > > [    1.217249] *** stratix10_rsu_probe: priv=0xffff80007aa28e80
> > > root@stratix10:/sys/bus/platform/drivers/stratix10-rsu# cat current_image
> > > [   38.849341] *** current_image_show: priv=0xffff80007aa28d00
> > > ... output garbage data
> > > priv pointer got changed
> > 
> > I don't understand this, sorry.  Are you sure you are actually using the
> > correct pointer to your device?
> > 
> I think so.
> 
> The dev pointer at current_image_show() should points to RSU device, but it
> seems point to driver_private if I use .group = rsU_groups. As a result I
> can't get the priv pointer properly at current_image_show().

It points to the driver kobject, not the device kobject.  So that's the
issue here.  See the patch that I just posted for a potential fix for
this.

thanks,

greg k-h
