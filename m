From: InKi Dae <daeinki@gmail.com>
Subject: Re: [PATCH V2 0/2] video: drm: Add Device tree support to DRM-FIMD
Date: Tue, 17 Jul 2012 13:19:11 +0900
Message-ID: <CAAQKjZN0tE=Kfeco434JO3ynkap5d-W6et6VoZjD=eR3USGHGw@mail.gmail.com>
References: <1341996287-14666-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1341996287-14666-1-git-send-email-l.krishna@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: devicetree-discuss@lists.ozlabs.org, joshi@samsung.com, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, laurent.pinchart@ideasonboard.com, olofj@google.com
List-Id: devicetree@vger.kernel.org

2012/7/11, Leela Krishna Amudala <l.krishna@samsung.com>:
> This patch set adds device tree support for DRM-FIMD for Samsung's
> Exynos5250.
> It includes parsing platform data from dts file.
>
> This patchset is based and tested on top of v3.5-rc6
>
> Changes since V1:
> 	- Corrected typo errors and changed compatibility string
>
> Leela Krishna Amudala (1):
>   video: drm: exynos: Add device tree support
>
> Prathyush K (1):
>   drm/exynos: Modifying exynos drm fimd to support exynos5
>
>  Documentation/devicetree/bindings/fb/drm-fimd.txt |   73 +++++++++++++++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c          |  101
> ++++++++++++++++++++-
>  2 files changed, 171 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
>

I'm sorry for being late. I was so busy. your patch set should be
tested on our target(based on exynos5) and then it will be reviewed
and merged to exynos-drm-next soon if there is no any problem.

Thanks,
Inki Dae


> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
