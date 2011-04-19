From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 17:07:40 +0200
Message-ID: <201104191707.40456.arnd@arndb.de>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu> <BANLkTin0krYi+MqngSQ5n-752vDa_a8ZtA@mail.gmail.com> <BANLkTin-qL3ppG1jRjBu3S16SWcNjD=3kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BANLkTin-qL3ppG1jRjBu3S16SWcNjD=3kA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: John Williams <john.williams@petalogix.com>, Wolfram Sang <w.sang@pengutronix.de>, Michal Simek <monstr@monstr.eu>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, hjk@hansjkoch.de
List-Id: devicetree@vger.kernel.org

On Tuesday 19 April 2011, Grant Likely wrote:
> > or whatever, as this would bind all instances matching vendor,device.
> >
> > So, the question I have is, how to handle bind per-instance?
> 
> By manipulating a property on the device instance of course!  :-)
> 
> Something like:  echo "generic-uio" >>
> /sys/devices/path/to/device/a-property-that-changes-the-driver-it-will-bind-to.
> 

But what code would create that in sysfs, and based on what properties
of the device? Should we do that for every platform device, or perhaps
for every one that has any resources?

	Arnd
