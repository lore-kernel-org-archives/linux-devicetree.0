From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v3 7/7] drm/i2c: tda998x: register as a drm bridge
Date: Fri, 20 Apr 2018 12:49:42 +0200
Message-ID: <4e9bd91c-6b29-cdd2-9e1d-1728311ddb81@axentia.se>
References: <20180419162751.25223-8-peda@axentia.se>
 <201804201731.D3OnDg0p%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201804201731.D3OnDg0p%fengguang.wu@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, Russell King <linux@armlinux.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2018-04-20 12:41, kbuild test robot wrote:
> Hi Peter,
> 
> I love your patch! Yet something to improve:

Yup, right you are!

> [auto build test ERROR on drm/drm-next]
> [also build test ERROR on v4.17-rc1 next-20180420]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Peter-Rosin/Add-tda998x-HDMI-support-to-atmel-hlcdc/20180420-160131
> base:   git://people.freedesktop.org/~airlied/linux.git drm-next
> config: i386-randconfig-a0-201815 (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/gpu/drm/i2c/tda998x_drv.c: In function 'tda998x_probe':
>>> drivers/gpu/drm/i2c/tda998x_drv.c:1859:16: error: 'struct drm_bridge' has no member named 'of_node'
>      bridge->bridge.of_node = dev->of_node;
>                    ^

Anybody got a better fix than this?

#ifdef CONFIG_OF
	bridge->bridge.of_node = dev->of_node;
#endif

Cheers,
Peter
