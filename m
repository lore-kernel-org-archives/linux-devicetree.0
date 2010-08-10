From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 7/9] [Xilinx] xilinx_hwicap: use linux/io.h instead of
	asm/io.h
Date: Tue, 10 Aug 2010 12:16:56 -0600
Message-ID: <AANLkTinxwcEFX6kDcrDO7HZ+h1=3UvFprjBBEQ_UdXQR@mail.gmail.com>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-6-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-7-git-send-email-stephen.neuendorffer@xilinx.com>
	<bd5961af-2af1-4f6d-a220-a03fdbb19453@VA3EHSMHS017.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <bd5961af-2af1-4f6d-a220-a03fdbb19453-+Ck8Kgl/v0+44QFJ4H5SYbjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 23, 2010 at 2:57 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Better style, and it gives access to the asm-generic/iomap.h
> accessors in all architectures.
>
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Looks good, but isn't a device-tree specific thing.  Should at least
go to linux-kernel before I pick it up to avoid troding on toes.

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

g.

> ---
> =A0drivers/char/xilinx_hwicap/buffer_icap.h =A0 | =A0 =A03 +--
> =A0drivers/char/xilinx_hwicap/fifo_icap.h =A0 =A0 | =A0 =A03 +--
> =A0drivers/char/xilinx_hwicap/xilinx_hwicap.c | =A0 =A03 +--
> =A0drivers/char/xilinx_hwicap/xilinx_hwicap.h | =A0 =A03 +--
> =A04 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/char/xilinx_hwicap/buffer_icap.h b/drivers/char/xili=
nx_hwicap/buffer_icap.h
> index d4f419e..aa859b0 100644
> --- a/drivers/char/xilinx_hwicap/buffer_icap.h
> +++ b/drivers/char/xilinx_hwicap/buffer_icap.h
> @@ -36,8 +36,7 @@
> =A0#include <linux/types.h>
> =A0#include <linux/cdev.h>
> =A0#include <linux/platform_device.h>
> -
> -#include <asm/io.h>
> +#include <linux/io.h>
> =A0#include "xilinx_hwicap.h"
>
> =A0/* Loads a partial bitstream from system memory. */
> diff --git a/drivers/char/xilinx_hwicap/fifo_icap.h b/drivers/char/xilinx=
_hwicap/fifo_icap.h
> index 4c9dd9a..b266c40 100644
> --- a/drivers/char/xilinx_hwicap/fifo_icap.h
> +++ b/drivers/char/xilinx_hwicap/fifo_icap.h
> @@ -36,8 +36,7 @@
> =A0#include <linux/types.h>
> =A0#include <linux/cdev.h>
> =A0#include <linux/platform_device.h>
> -
> -#include <asm/io.h>
> +#include <linux/io.h>
> =A0#include "xilinx_hwicap.h"
>
> =A0/* Reads integers from the device into the storage buffer. */
> diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xi=
linx_hwicap/xilinx_hwicap.c
> index ed8a9ce..6172689 100644
> --- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> +++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> @@ -87,8 +87,7 @@
> =A0#include <linux/cdev.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/slab.h>
> -
> -#include <asm/io.h>
> +#include <linux/io.h>
> =A0#include <asm/uaccess.h>
> =A0#include <asm/system.h>
>
> diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.h b/drivers/char/xi=
linx_hwicap/xilinx_hwicap.h
> index 8cca119..e0a6857 100644
> --- a/drivers/char/xilinx_hwicap/xilinx_hwicap.h
> +++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.h
> @@ -36,8 +36,7 @@
> =A0#include <linux/types.h>
> =A0#include <linux/cdev.h>
> =A0#include <linux/platform_device.h>
> -
> -#include <asm/io.h>
> +#include <linux/io.h>
>
> =A0struct hwicap_drvdata {
> =A0 =A0 =A0 =A0u32 write_buffer_in_use; =A0/* Always in [0,3] */
> --
> 1.5.6.6
>
>
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
