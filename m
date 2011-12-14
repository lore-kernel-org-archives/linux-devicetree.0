From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [REPOST RFC PATCH 0/3] New "gpio-poweroff" driver to turn off
 platform devices with GPIOs
Date: Wed, 14 Dec 2011 12:02:40 +0000
Message-ID: <20111214120240.GC25088@sirena.org.uk>
References: <1323800614-12642-1-git-send-email-Kyle.D.Moffett@boeing.com>
 <4EE7A31E.7080301@gmail.com>
 <895CF182-4BF7-4DF5-A467-944EC008DBC3@boeing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <895CF182-4BF7-4DF5-A467-944EC008DBC3@boeing.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Moffett, Kyle D" <Kyle.D.Moffett@boeing.com>
Cc: Rob Herring <robherring2@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Liam Girdwood <lrg@ti.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2011 at 02:44:48PM -0600, Moffett, Kyle D wrote:

> I looked at it a bit when I was generalizing my code, but it seemed
> dramatically more complicated than I needed, and I couldn't see any
> reasonable way to hook it from the machine_poweroff() code.

Some ST platform had to do odd stuff with regulators to power off, it
made a platform device representing the odd poweroff code.

> There's also the fact that I was looking for a pure-device-tree type
> of driver and the regulator framework does not seem to support the
> standard OF-platform probe system.

The regulator API in -next has DT bindings.
