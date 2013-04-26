From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] drm/exynos: fix multiple definition build error
Date: Fri, 26 Apr 2013 21:42:06 +0200
Message-ID: <4121004.exzbXa8F0p@flatron>
References: <1366952590-11652-1-git-send-email-inki.dae@samsung.com> <CAAQKjZPQ4LWTka0rfgPypsh+a-B5gzBv5hEbRYdkrry_C5J6Hg@mail.gmail.com> <517A4D82.8010306@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <517A4D82.8010306@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Friday 26 of April 2013 11:48:50 Sylwester Nawrocki wrote:
> On 04/26/2013 10:20 AM, Inki Dae wrote:
> > Exactly right. it's my mistake. But now it seems that
> > __mode_of_device_table is multi defined at fimd and g2d side so there
> > still is module build error. :(
> Since all drivers seem to be linked into single a single module, you
> likely need to create a separate table of struct of_device_id just for
> the purpose of MODULE_DEVICE_TABLE(of, ...). This table would contain
> 'compatible' strings for all devices. Or choose of_device_id for just
> one device and define MODULE_DEVICE_TABLE() for it in some common place,
> e.g. exynos_drm_drv.c. I believe all devices should be listed though.

IMHO, the most proper solution would be to split the module into parent 
exynos_drm module and per-device submodules, which would depend on the 
parent module.

This way you would be able to load dynamically any submodule you want, 
without recompiling the modules.

Best regards,
Tomasz
