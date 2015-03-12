From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 2/2] drm/bridge: Add IT6151 bridge driver
Date: Thu, 12 Mar 2015 10:00:47 +0100
Message-ID: <1426150847.5304.22.camel@x220>
References: <1426054733-54378-1-git-send-email-ck.hu@mediatek.com>
	 <1426054733-54378-2-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426054733-54378-2-git-send-email-ck.hu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Jitao Shi <jitao.shi@mediatek.com>
List-Id: devicetree@vger.kernel.org

Just a few nits, I'm afraid.

On Wed, 2015-03-11 at 14:18 +0800, CK Hu wrote:
>  drivers/gpu/drm/bridge/Kconfig  |  10 +
>  drivers/gpu/drm/bridge/Makefile |   1 +

I applied 1/2 and 2/2 on top of next-20150312 to check a trivial issue.
The chunks for these two files needed context changes to git this patch
applied.

>  drivers/gpu/drm/bridge/it6151.c | 601 ++++++++++++++++++++++++++++++++++++++++
>  include/drm/bridge/it6151.h     |  34 +++
>  4 files changed, 646 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/it6151.c
>  create mode 100644 include/drm/bridge/it6151.h

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index f38bbcd..2b3a78e 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -11,3 +11,13 @@ config DRM_PTN3460
>  	select DRM_PANEL
>  	---help---
>  	  ptn3460 eDP-LVDS bridge chip driver.
> +
> +config DRM_IT6151
> +	bool "Enable IT6151FN : MIPI to eDP Converter"
> +	depends on DRM
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this option if you have IT6151 for display
> +	  The IT6151 is a high-performance and low-power
> +	  MIPI to eDP converter
> +

(This empty line makes git am whine: "new blank line at EOF.".)

> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/it6151.c

> +#include <linux/module.h>

This file can only be built-in. So I couldn't help but notice this
include. And if I remove it
    make drivers/gpu/drm/bridge/it6151.o

still runs without warning or errors. Unless I've missed something
non-obvious I'd say it is not needed.

> +

(Empty line at end of file.)

> --- /dev/null
> +++ b/include/drm/bridge/it6151.h

> +

(Another empty line at end of file.)


Paul Bolle
