From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch v3 6/8] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Date: Wed, 25 Sep 2019 09:37:41 -0500
Message-ID: <20190925143741.25qn2wuyiwapsehr@ti.com>
References: <20190924164414.21897-1-bparrot@ti.com>
 <20190924164414.21897-7-bparrot@ti.com>
 <20190925095154.GL9467@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190925095154.GL9467@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Wed [2019-Sep-25 12:51:54 +0300]:
> Hi Benoit,
> 
> On Tue, Sep 24, 2019 at 11:44:12AM -0500, Benoit Parrot wrote:
> > On some board it is possible that the sensor 'powerdown' and or 'reset'
> > pin might be controlled by gpio instead of being tied.
> > 
> > To implement we add pm_runtime support which will handle the power
> > up/down sequence when it is available otherwise the sensor will be
> > powered on at module insertion/probe and powered off at module removal.
> > 
> > Now originally the driver assumed that the sensor would always stay
> > powered and keep its register setting. We cannot assume this anymore, so
> > every time we "power up" we need to re-program the initial registers
> > configuration first. This was previously done only at probe time.
> > 
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> 
> Thanks for the update.
> 
> I missed the control interface is accessible also when the device is not
> streaming, and the driver doesn't appear to power on the sensor for that,
> leading to a failing I²C write.
> 
> Could you address that as well, either here or as a separate patch? E.g.
> the smiapp driver does this.

Yes, I missed that also.
I'll add a check in .s_ctrl().

Benoit

> 
> -- 
> Kind regards,
> 
> Sakari Ailus
> sakari.ailus@linux.intel.com
