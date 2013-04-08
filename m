From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 0/7] i.MX53 IPU + TVE patches
Date: Mon, 8 Apr 2013 10:40:16 -0700
Message-ID: <20130408174016.GB30036@kroah.com>
References: <1365437078-22579-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1365437078-22579-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2013 at 06:04:31PM +0200, Philipp Zabel wrote:
> Hi,
> 
> the following patches allow to use the integrated Television Encoder
> (TVEv2) on the i.MX53 SoC as VGA output encoder for the IPU. This is
> useful for the Freescale i.MX53-QSB and TQ MBa53 boards, which have
> VGA and DVI-I connectors, respectively.
> 
> regards
> Philipp
> 
> ---
>  drivers/staging/imx-drm/Kconfig             |   7 +
>  drivers/staging/imx-drm/Makefile            |   1 +
>  drivers/staging/imx-drm/imx-drm-core.c      |  15 +-
>  drivers/staging/imx-drm/imx-drm.h           |  14 +-
>  drivers/staging/imx-drm/imx-tve.c           | 755 ++++++++++++++++++++++++++++
>  drivers/staging/imx-drm/ipu-v3/imx-ipu-v3.h |   3 +
>  drivers/staging/imx-drm/ipu-v3/ipu-dc.c     |  55 +-
>  drivers/staging/imx-drm/ipu-v3/ipu-di.c     | 100 +++-
>  drivers/staging/imx-drm/ipuv3-crtc.c        |  11 +-
>  9 files changed, 932 insertions(+), 29 deletions(-)

That's a lot of new features being added here, yet no work seems to be
happening to move this out of the staging tree.  What is left to do
here, and why isn't that being worked on first, before stuff like this?

thanks,

greg k-h
