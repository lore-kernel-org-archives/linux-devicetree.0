From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Submit of a driver for Pi433 - a radio module for Raspberry Pi
Date: Sun, 16 Jul 2017 08:45:46 +0200
Message-ID: <20170716064546.GA11484@kroah.com>
References: <20170712074305.GA20198@kroah.com>
 <197075499.65628.1500117344413@ox.hosteurope.de>
 <20170715112454.GB1753@kroah.com>
 <89433969.66090.1500123565835@ox.hosteurope.de>
 <20170715130220.GA22977@kroah.com>
 <826180465.66159.1500124248340@ox.hosteurope.de>
 <20170715131628.GA29222@kroah.com>
 <1152815224.66246.1500126030682@ox.hosteurope.de>
 <20170715134739.GA20360@kroah.com>
 <8d152de9387d8ebae5b3cd11277e8ada-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheXH4CVVE=-webmailer1@server05.webmailer.hosteurope.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8d152de9387d8ebae5b3cd11277e8ada-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheXH4CVVE=-webmailer1@server05.webmailer.hosteurope.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolf Entwicklungen <Marcus.Wolf@Wolf-Entwicklungen.de>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, grant.likely@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 15, 2017 at 07:05:04PM +0200, Wolf Entwicklungen wrote:
> Am Sa, 15.07.2017, 15:47 schrieb Greg KH:
> > On Sat, Jul 15, 2017 at 03:40:30PM +0200, Marcus Wolf wrote:
> >> Hi Greg,
> >>
> 
> Hi Greg,
> 
> now I added a TODO file and did a manual patchwork with lines of the old patch
> (git format-patch master --stdout -p > pi433_patch) and the newer patch (git
> diff master > pi433_patch). Stil don't know how to retreive multiple commits
> in one single patch directly from git :-/
> I did my best to meet a lot of rules of the link, you send me.If
> there is stil something essential wrong or missing, please excuse and let me know.
> 
> Especially I was in doubt about the verbosity of the change log. If you'd like
> to see the list of features of the driver over there (please see my first mail),
> let me know and I'll add.


Can you resend it without all of this stuff here, a patch email should just
contain the patch itself, look at all of the examples on the mailing
lists for how they look.

> From: Marcus Wolf <linux@Wolf-Entwicklungen.de>
> Date: Tue,15 Jul 2017 17:52:06 +0100
> Subject: [PATCH 1/1] drivers/staging/pi433: New driver
> 
> Added a driver for the pi433 radio module
> (see https://www.pi433.de/en.html for details).
> Signed-off-by: Marcus Wolf <linux@Wolf-Entwicklungen.de>

Need a blank line before signed-off-by.

> Tested-by: Marcus Wolf <linux@Wolf-Entwicklungen.de> on Raspbian, running Kernel v4.12

No need for a tested-by from something that wrote, that is implied :)

Almost there...

thanks,

greg k-h
