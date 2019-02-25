From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Samsung S6E63M0 panel
Date: Mon, 25 Feb 2019 10:41:16 +0100
Message-ID: <20190225094116.GA19587@ravnborg.org>
References: <20190222175153.20567-1-pawel.mikolaj.chmiel@gmail.com>
 <20190222175153.20567-2-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222175153.20567-2-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Cc: thierry.reding@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Paweł, Thierry

On Fri, Feb 22, 2019 at 06:51:53PM +0100, Paweł Chmiel wrote:
> This patch adds Samsung S6E63M0 AMOLED LCD panel driver, connected over
> spi. It's based on already removed, non dt s6e63m0 driver and
> panel-samsung-ld9040. It can be found for example in some of Samsung
> Aries based phones.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

I took a last look at the driver.
Everything looks good to me now, and I consider this driver ready to be applied.

	Sam
