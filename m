From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v6 2/2] media:imx274 V4l2 driver for Sony imx274 CMOS
 sensor
Date: Thu, 28 Sep 2017 11:10:41 +0300
Message-ID: <20170928081041.vygfd5l2igz5ewhe@valkosipuli.retiisi.org.uk>
References: <20170924075329.9927-1-leonl@leopardimaging.com>
 <20170924075329.9927-2-leonl@leopardimaging.com>
 <20170927214005.adcj4jrw74abt2j6@valkosipuli.retiisi.org.uk>
 <CADu3m9zgmdP+hP_Es5gEbNyais-aBS+i-_EZdaZ-B1FKEGY92Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADu3m9zgmdP+hP_Es5gEbNyais-aBS+i-_EZdaZ-B1FKEGY92Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Luo <leonl@leopardimaging.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Leon,

On Wed, Sep 27, 2017 at 11:48:21PM -0700, Leon Luo wrote:
> Hi Sakari,
> 
> Thanks for your comments.
> 
> Regarding imx274_tp_regs[], the first value is the test pattern mode, which
> will be updated according to the input value before writing the register.
> So it can't be a const.

In that case you'll need to explicitly write that register; this is
specific to a device whereas the static variable is the same for all
devices.

> 
> I will use __v4l2_ctrl_s_ctrl instead of v4l2_ctrl_s_ctrl to keep the
> lock/unlock mutex clean. I am traveling right now, will test it and send a
> new patch this weekend.

Ack.

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
