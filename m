From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/4] lis3: lis3lv02d_i2c: Add device tree support
Date: Wed, 26 Sep 2012 13:24:00 -0700
Message-ID: <20120926202400.GA27830@kroah.com>
References: <1347866602-2088-1-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1347866602-2088-1-git-send-email-anilkumar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: AnilKumar Ch <anilkumar@ti.com>
Cc: arnd@arndb.de, eric.piel@tremplin-utc.net, jic23@cam.ac.uk, akpm@linux-foundation.org, broonie@opensource.wolfsonmicro.com, dmitry.torokhov@gmail.com, tony@atomide.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2012 at 12:53:18PM +0530, AnilKumar Ch wrote:
> Adds device tree support to lis3lv02d_i2c driver. Along with this
> DT init is moved from core driver to individual drivers, with the
> current implementation some pdata is missing in lis3lv02d_i2c driver.
> 
> Also adds platform data for lis331dlh driver to am335x-EVM. These
> patches were tested on AM335x-EVM.

None of these patches apply to any tree that I know of, what did you do
them against?  Please redo them against the char-next branch of
linux-next and resend them if you wish to see them applied.

thanks,

greg k-h
