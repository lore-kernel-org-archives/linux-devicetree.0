From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] mtd: m25p80: fix some module and documentation issues
Date: Thu, 19 Nov 2015 16:48:17 -0800
Message-ID: <20151120004817.GR64635@google.com>
References: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 02:34:49PM -0800, Brian Norris wrote:
> Hi,
> 
> There were a few mistakes and improvements pointed out at various points in
> this thread, subject:
> 
>     spi: OF module autoloading is still broken
>     (was: Re: m25p80: Commit "allow arbitrary OF matching for "jedec,spi-nor""
>     breaks module autoloading)
> 
>     http://lists.infradead.org/pipermail/linux-mtd/2015-October/062369.html
>     https://lkml.org/lkml/2015/11/12/574
> 
> That thread covers some other interesting issues that are still not solved, but
> let's fix the ones we can here in MTD right now.
> 
> Regards,
> Brian

Pushed all to l2-mtd.git
