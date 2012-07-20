From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V2 0/2] video: drm: Add Device tree support to DRM-FIMD
Date: Fri, 20 Jul 2012 16:00:32 +0900
Message-ID: <50090210.8080609@samsung.com>
References: <1341996287-14666-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-reply-to: <1341996287-14666-1-git-send-email-l.krishna@samsung.com>
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

Hi,

On 07/11/2012 05:44 PM, Leela Krishna Amudala wrote:
> This patch set adds device tree support for DRM-FIMD for Samsung's Exynos5250.
> It includes parsing platform data from dts file.
>
> This patchset is based and tested on top of v3.5-rc6
>
> Changes since V1:
> 	- Corrected typo errors and changed compatibility string
>
> Leela Krishna Amudala (1):
>    video: drm: exynos: Add device tree support
>
> Prathyush K (1):
>    drm/exynos: Modifying exynos drm fimd to support exynos5

This patch is not related with device tree. Please send a patch without
dependency with "video: drm: exynos: Add device tree support".

Thanks.

>
>   Documentation/devicetree/bindings/fb/drm-fimd.txt |   73 +++++++++++++++
>   drivers/gpu/drm/exynos/exynos_drm_fimd.c          |  101 ++++++++++++++++++++-
>   2 files changed, 171 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
