From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [RFC v7 0/5] pstore/block: new support logger for block devices
Date: Wed, 23 Jan 2019 20:26:38 +0200
Message-ID: <20190123182638.GD2792@darkstar.musicnaut.iki.fi>
References: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Cc: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jan 23, 2019 at 08:05:11PM +0800, liaoweixiong wrote:
> Why should we need pstore_block?
> 1. Most embedded intelligent equipment have no persistent ram, which
> increases costs. We perfer to cheaper solutions, like block devices.
> In fast, there is already a sample for block device logger in driver
> MTD (drivers/mtd/mtdoops.c).

I think you should add a patch for some actual block device using this
new framework to show that it can work. What HW you think would be
using things?

A.
