From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/5] soc: bcm: bcm2835-pm: Add support for power
 domains under a new binding.
Date: Fri, 7 Dec 2018 17:49:33 -0600
Message-ID: <20181207234933.GA28189@bogus>
References: <20181130202743.20585-1-eric@anholt.net>
 <20181130202743.20585-4-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181130202743.20585-4-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Fri, Nov 30, 2018 at 12:27:41PM -0800, Eric Anholt wrote:
> This provides a free software alternative to raspberrypi-power.c's
> firmware calls to manage power domains.  It also exposes a reset line,
> where previously the vc4 driver had to try to force power off the
> domain in order to trigger a reset.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
>  drivers/mfd/bcm2835-pm.c             |  36 +-
>  drivers/soc/bcm/Kconfig              |  11 +
>  drivers/soc/bcm/Makefile             |   1 +
>  drivers/soc/bcm/bcm2835-power.c      | 661 +++++++++++++++++++++++++++
>  include/dt-bindings/soc/bcm2835-pm.h |  28 ++

Acked-by: Rob Herring <robh@kernel.org>

>  include/linux/mfd/bcm2835-pm.h       |   1 +
>  6 files changed, 734 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/soc/bcm/bcm2835-power.c
>  create mode 100644 include/dt-bindings/soc/bcm2835-pm.h
