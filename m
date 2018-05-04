From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v2 1/6] drm/tegra: Fix a device_node leak when the DRM
 panel is not found
Date: Fri, 4 May 2018 11:54:46 +0200
Message-ID: <20180504115446.45d3d4db@bbrezillon>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
        <20180503164009.14395-2-boris.brezillon@bootlin.com>
        <20180504095016.GE13459@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180504095016.GE13459@ulmo>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 4 May 2018 11:50:16 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> On Thu, May 03, 2018 at 06:40:04PM +0200, Boris Brezillon wrote:
> > of_node_put(panel) is not called when of_drm_find_panel(panel) returns
> > NULL, thus leaking the reference we hold on panel.
> > 
> > Fixes: 9be7d864cf07 ("drm/tegra: Implement panel support")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/gpu/drm/tegra/output.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)  
> 
> I'm not sure this warrants a backport, it's a very minor reference leak
> so doesn't really have an impact on system stability or functionality.
> 
> Since this patch is unrelated from the rest of the series, do you mind
> if I pick this up into the drm/tegra tree?

Sure, and feel free to remove the Cc-stable and Fixes tag if you think
they are not necessary.
