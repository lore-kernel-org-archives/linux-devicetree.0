From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/1] drm/panel: Add support for Olimex LCD-OLinuXino
 panel
Date: Mon, 25 Jun 2018 14:41:19 -0600
Message-ID: <20180625204119.GA10101@rob-hp-laptop>
References: <1529909093-17021-1-git-send-email-stefan@olimex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1529909093-17021-1-git-send-email-stefan@olimex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Mavrodiev <stefan@olimex.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 25, 2018 at 09:44:35AM +0300, Stefan Mavrodiev wrote:
> This patch adds Olimex Ltd. LCD-OLinuXino bridge panel driver. The
> panel is used with different LCDs (currently from 480x272 to 1280x800).
> Small EEPROM chip is used for identification, which holds some
> factory data and timing requirements.
> 
> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
> ---
> Changes for v2:
>     - Changed lcd_olinuxino_funcs to static const
> 
>  .../display/panel/olimex,lcd-olinuxino.txt         |  42 +++

If there are further changes, please split to a separate patch. 
Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

>  MAINTAINERS                                        |   6 +
>  drivers/gpu/drm/panel/Kconfig                      |  10 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 360 +++++++++++++++++++++
>  5 files changed, 419 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
