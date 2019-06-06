From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v5 2/3] media: uapi: Add MEDIA_BUS_FMT_RGB888_3X8 media
 bus format
Date: Thu, 6 Jun 2019 11:17:23 +0300
Message-ID: <20190606081723.p66cahzkqmwrpi7i@valkosipuli.retiisi.org.uk>
References: <20190605222247.25657-1-paul@crapouillou.net>
 <20190605222247.25657-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605222247.25657-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, od@zcrc.me
List-Id: devicetree@vger.kernel.org

On Thu, Jun 06, 2019 at 12:22:46AM +0200, Paul Cercueil wrote:
> This patch adds MEDIA_BUS_FMT_RGB888_3X8, used for the GiantPlus
> GPM940B0 24-bit TFT panel, where the RGB components are transferred
> sequentially on a 8-bit bus.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
