From: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [RFC v7 0/5] pstore/block: new support logger for block devices
Date: Thu, 24 Jan 2019 20:16:30 +0800
Message-ID: <5f243418-c6bd-061e-1161-1c0139ad84bf@allwinnertech.com>
References: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190123182638.GD2792@darkstar.musicnaut.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123182638.GD2792@darkstar.musicnaut.iki.fi>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-01-24 02:26, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Jan 23, 2019 at 08:05:11PM +0800, liaoweixiong wrote:
>> Why should we need pstore_block?
>> 1. Most embedded intelligent equipment have no persistent ram, which
>> increases costs. We perfer to cheaper solutions, like block devices.
>> In fast, there is already a sample for block device logger in driver
>> MTD (drivers/mtd/mtdoops.c).
> 
> I think you should add a patch for some actual block device using this
> new framework to show that it can work. What HW you think would be
> using things?
> 

I will try to add a patch. Actually, I have implemented it on allwinner
platform, but unfortunately these codes are unsuitable to submit to
upper stream.

In addition, there is already a sample for pstore/blk on patch 3 of
version 7. It names
blkoops. Blkoops is suitable for most block device as what it need is
just a path of a partition. We can use it to test most of features but
panic.

> A.
> 

-- 
liaoweixiong
