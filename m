From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/6] iio: light: Updated Vishay Capella cm32181 ambient
 light sensor driver.
Date: Thu, 21 May 2015 21:36:58 -0700
Message-ID: <1432269418.29657.5.camel@perches.com>
References: <1432268380-7302-1-git-send-email-ktsai@capellamicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432268380-7302-1-git-send-email-ktsai@capellamicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Tsai <ktsai@capellamicro.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Jingoo Han <jingoohan1@gmail.com>, Daniel Baluta <daniel.baluta@intel.com>, Roberta Dobrescu <roberta.dobrescu@gmail.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-21 at 21:19 -0700, Kevin Tsai wrote:
> - Renamed company name.
> - Removed cm32181_reg.
> - Removed white space.
> - Removed unused include files.
> - Updated macro definitions.
> - Renamed cm32181_chip pointer to chip.

Hi Kevin,

Please don't use the same title for multiple patches.

It'd be better if these 6 patches were titled something like

1/6	cm32181: Neatening
2/6	cm32181: Add cm32181_als_info
3/6:	cm32181: Add power management support
4/6:	cm32181: Add and use cm32181_als_it_scale
5/6:	cm32181: Add device tree support
6/6:	cm32181: Add interrupt suppor

It's
