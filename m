From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] drivers: of/base: move of_init to driver_init
Date: Tue, 19 May 2015 10:17:32 -0700
Message-ID: <20150519171732.GD9213@kroah.com>
References: <1431595695-17103-1-git-send-email-sudeep.holla@arm.com>
 <1431613704-30801-1-git-send-email-sudeep.holla@arm.com>
 <555B2C9C.1000709@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <555B2C9C.1000709@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Rob Herring <robherring2@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 01:29:16PM +0100, Sudeep Holla wrote:
> Hi Rob/Greg,
> 
> On 14/05/15 15:28, Sudeep Holla wrote:
> >Commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> >devices with an OF node") adds the symlink `of_node` for each device
> >pointing to it's device tree node while creating/initialising it.
> >
> >However the devicetree sysfs is created and setup in of_init which is
> >executed at core_initcall level. For all the devices created before
> >of_init, the following error is thrown:
> >	"Error -2(-ENOENT) creating of_node link"
> >
> >Like many other components in driver model, initialize the sysfs support
> >for OF/devicetree from driver_init so that it's ready before any devices
> >are created.
> >
> >Fixes: 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> >	devices with an OF node")
> >Suggested-by: Rob Herring <robh+dt@kernel.org>
> >Cc: Grant Likely <grant.likely@linaro.org>
> >Cc: Rob Herring <robh+dt@kernel.org>
> >Cc: Pawel Moll <pawel.moll@arm.com>
> >Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> I assume one of you will pick this up if there are no further comments ?

I will once things settle down...
