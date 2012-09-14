From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/4] lis3: lis3lv02d_i2c: Add device tree support
Date: Fri, 14 Sep 2012 15:31:36 +0000
Message-ID: <201209141531.36734.arnd@arndb.de>
References: <1347610016-10123-1-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1347610016-10123-1-git-send-email-anilkumar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: AnilKumar Ch <anilkumar@ti.com>
Cc: gregkh@linuxfoundation.org, eric.piel@tremplin-utc.net, jic23@cam.ac.uk, greg@kroah.com, akpm@linux-foundation.org, broonie@opensource.wolfsonmicro.com, dmitry.torokhov@gmail.com, tony@atomide.com, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org

On Friday 14 September 2012, AnilKumar Ch wrote:
> Adds device tree support to lis3lv02d_i2c driver. Along with this
> DT init is moved from core driver to individual drivers, with the
> current implementation some pdata is missing in lis3lv02d_i2c driver.
> 
> Also adds platform data for lis331dlh driver to am335x-EVM. These
> patches were tested on AM335x-EVM.
> 

No further comments on this version besides the ones I already gave
on v1.

	Arnd
