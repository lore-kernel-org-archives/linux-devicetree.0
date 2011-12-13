From: Rob Herring <robherring2@gmail.com>
Subject: Re: [REPOST RFC PATCH 0/3] New "gpio-poweroff" driver to turn off
 platform devices with GPIOs
Date: Tue, 13 Dec 2011 13:10:22 -0600
Message-ID: <4EE7A31E.7080301@gmail.com>
References: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kyle Moffett <Kyle.D.Moffett@boeing.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Liam Girdwood <lrg@ti.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On 12/13/2011 12:23 PM, Kyle Moffett wrote:
> Hello again,
> 
> I posted this patch series a few weeks ago and saw no responses, so I
> tweaked the CC list and am reposting it again for review.
> 
> I'm working on support for some custom hardware of ours, and part of
> the support code is the ability for the software to shutdown the power
> supply using GPIOs (via an I2C GPIO controller).
> 
> I previously had this in my platform code, but it seemed generically
> useful, so I split it out into a separate module for others to use.
> 
> The first two patches are generic of_gpio enhancements, providing some
> new library functions for requesting lots of GPIOs at once.
> 
> The third patch is the actual driver itself.  The driver can be used to
> instantiate a platform device as a whole-machine-poweroff device as we
> use it on our hardware.  Alternatively it can instantiate multiple
> platform devs at specific locations on the device tree which trigger
> from the platform_driver->shutdown() callback.
> 
> For architectures which are still stuck in the dark ages, this driver
> also supports being instantiated via legacy platform_data.

Leave them there... :)

> The OpenFirmware binding documentation is added in the third patch.
> Since this is my first cut, it's a little rough, so please be gentle.
> 
> I'm interested to know what you all think.

Does the regulator framework gpio-regulator not work for this?

The DT gpio patches look useful on their own.

Rob
