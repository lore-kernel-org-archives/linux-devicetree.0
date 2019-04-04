From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Add ASPEED BMC GFX DRM driver entry
Date: Wed, 03 Apr 2019 21:04:44 -0400
Message-ID: <3c142c1e-e863-4f21-b313-3564e3a9d5d6@www.fastmail.com>
References: <20190403001909.31637-1-joel@jms.id.au>
 <20190403001909.31637-4-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190403001909.31637-4-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 3 Apr 2019, at 10:49, Joel Stanley wrote:
> This hardware is found inside ASPEED Baseboard Management Controller
> (BMC) system on chips. It is called the 'SOC Display Controller' or 'GFX'.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c18f5f10cf91..c3ad730e26f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4909,6 +4909,14 @@ M:	Dave Airlie <airlied@redhat.com>
>  S:	Odd Fixes
>  F:	drivers/gpu/drm/ast/
>  
> +DRM DRIVER FOR ASPEED BMC GFX
> +M: 	Joel Stanley <joel@jms.id.au>
> +L:	linux-aspeed@lists.ozlabs.org
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +S:	Supported
> +F:	drivers/gpu/drm/aspeed/
> +F:	Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> +
>  DRM DRIVER FOR BOCHS VIRTUAL GPU
>  M:	Gerd Hoffmann <kraxel@redhat.com>
>  L:	virtualization@lists.linux-foundation.org
> -- 
> 2.20.1
> 
>
