From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH] mfd: Add device tree bindings for Arizona class devices
Date: Mon, 8 Apr 2013 16:30:08 +0200
Message-ID: <20130408143008.GA21256@zurbaran>
References: <1364938728-7732-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1364938728-7732-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Tue, Apr 02, 2013 at 10:38:48PM +0100, Mark Brown wrote:
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt |   62 ++++++++++++++++++++
>  drivers/mfd/arizona-core.c                        |   64 +++++++++++++++++++++
>  drivers/mfd/arizona-i2c.c                         |   10 +++-
>  drivers/mfd/arizona-spi.c                         |   10 +++-
>  drivers/mfd/arizona.h                             |   12 ++++
>  5 files changed, 154 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/arizona.txt
This is the one that caused the build failure around missing
arizona_of_get_core_pdata() with !CONFIG_OF, so I'm leaving this one out for
now.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
