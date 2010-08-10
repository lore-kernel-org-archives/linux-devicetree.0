From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 8/9] [Xilinx] xilinx_hwicap: Update driver to use generic
	io accessors
Date: Tue, 10 Aug 2010 12:17:43 -0600
Message-ID: <AANLkTin+-qF2MqXOauJ4bBDuOT0W_XTxxG+b4-H+sO2Y@mail.gmail.com>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-6-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-7-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-8-git-send-email-stephen.neuendorffer@xilinx.com>
	<e8b3593c-3be3-4b4e-aabd-e3baeb4e792a@VA3EHSMHS026.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <e8b3593c-3be3-4b4e-aabd-e3baeb4e792a-+Ck8Kgl/v0/VOT3FKhN2rLjjLBE8jN/0@public.gmane.org>
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
> out_be32 and in_be32 are mainly powerpc-isms. =A0Switch
> to using ioread32be and iowrite32be instead. =A0This allows
> the code to be used on x86 or ARM, for instance.
>
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Ditto here; but please repost to linux-kernel

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
> =A0drivers/char/xilinx_hwicap/buffer_icap.c =A0 | =A0 16 +++++-----
> =A0drivers/char/xilinx_hwicap/fifo_icap.c =A0 =A0 | =A0 39 +++++++++++++-=
-------------
> =A0drivers/char/xilinx_hwicap/xilinx_hwicap.c | =A0 =A01 +
> =A03 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/char/xilinx_hwicap/buffer_icap.c b/drivers/char/xili=
nx_hwicap/buffer_icap.c
> index 05d8977..bc361fc 100644
> --- a/drivers/char/xilinx_hwicap/buffer_icap.c
> +++ b/drivers/char/xilinx_hwicap/buffer_icap.c
> @@ -87,7 +87,7 @@
> =A0**/
> =A0u32 buffer_icap_get_status(struct hwicap_drvdata *drvdata)
> =A0{
> - =A0 =A0 =A0 return in_be32(drvdata->base_address + XHI_STATUS_REG_OFFSE=
T);
> + =A0 =A0 =A0 return ioread32be(drvdata->base_address + XHI_STATUS_REG_OF=
FSET);
> =A0}
>
> =A0/**
> @@ -101,7 +101,7 @@ u32 buffer_icap_get_status(struct hwicap_drvdata *drv=
data)
> =A0static inline u32 buffer_icap_get_bram(void __iomem *base_address,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 offset)
> =A0{
> - =A0 =A0 =A0 return in_be32(base_address + (offset << 2));
> + =A0 =A0 =A0 return ioread32be(base_address + (offset << 2));
> =A0}
>
> =A0/**
> @@ -114,7 +114,7 @@ static inline u32 buffer_icap_get_bram(void __iomem *=
base_address,
> =A0**/
> =A0static inline bool buffer_icap_busy(void __iomem *base_address)
> =A0{
> - =A0 =A0 =A0 u32 status =3D in_be32(base_address + XHI_STATUS_REG_OFFSET=
);
> + =A0 =A0 =A0 u32 status =3D ioread32be(base_address + XHI_STATUS_REG_OFF=
SET);
> =A0 =A0 =A0 =A0return (status & 1) =3D=3D XHI_NOT_FINISHED;
> =A0}
>
> @@ -129,7 +129,7 @@ static inline bool buffer_icap_busy(void __iomem *bas=
e_address)
> =A0static inline void buffer_icap_set_size(void __iomem *base_address,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 data)
> =A0{
> - =A0 =A0 =A0 out_be32(base_address + XHI_SIZE_REG_OFFSET, data);
> + =A0 =A0 =A0 iowrite32be(data, base_address + XHI_SIZE_REG_OFFSET);
> =A0}
>
> =A0/**
> @@ -143,7 +143,7 @@ static inline void buffer_icap_set_size(void __iomem =
*base_address,
> =A0static inline void buffer_icap_set_offset(void __iomem *base_address,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 data)
> =A0{
> - =A0 =A0 =A0 out_be32(base_address + XHI_BRAM_OFFSET_REG_OFFSET, data);
> + =A0 =A0 =A0 iowrite32be(data, base_address + XHI_BRAM_OFFSET_REG_OFFSET=
);
> =A0}
>
> =A0/**
> @@ -159,7 +159,7 @@ static inline void buffer_icap_set_offset(void __iome=
m *base_address,
> =A0static inline void buffer_icap_set_rnc(void __iomem *base_address,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 data)
> =A0{
> - =A0 =A0 =A0 out_be32(base_address + XHI_RNC_REG_OFFSET, data);
> + =A0 =A0 =A0 iowrite32be(data, base_address + XHI_RNC_REG_OFFSET);
> =A0}
>
> =A0/**
> @@ -174,7 +174,7 @@ static inline void buffer_icap_set_rnc(void __iomem *=
base_address,
> =A0static inline void buffer_icap_set_bram(void __iomem *base_address,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 offset, u32 data)
> =A0{
> - =A0 =A0 =A0 out_be32(base_address + (offset << 2), data);
> + =A0 =A0 =A0 iowrite32be(data, base_address + (offset << 2));
> =A0}
>
> =A0/**
> @@ -255,7 +255,7 @@ static int buffer_icap_device_write(struct hwicap_drv=
data *drvdata,
> =A0**/
> =A0void buffer_icap_reset(struct hwicap_drvdata *drvdata)
> =A0{
> - =A0 =A0out_be32(drvdata->base_address + XHI_STATUS_REG_OFFSET, 0xFEFE);
> + =A0 =A0 =A0 iowrite32be(0xFEFE, drvdata->base_address + XHI_STATUS_REG_=
OFFSET);
> =A0}
>
> =A0/**
> diff --git a/drivers/char/xilinx_hwicap/fifo_icap.c b/drivers/char/xilinx=
_hwicap/fifo_icap.c
> index 02225eb..062df1d 100644
> --- a/drivers/char/xilinx_hwicap/fifo_icap.c
> +++ b/drivers/char/xilinx_hwicap/fifo_icap.c
> @@ -94,7 +94,7 @@ static inline void fifo_icap_fifo_write(struct hwicap_d=
rvdata *drvdata,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 data)
> =A0{
> =A0 =A0 =A0 =A0dev_dbg(drvdata->dev, "fifo_write: %x\n", data);
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_WF_OFFSET, data);
> + =A0 =A0 =A0 iowrite32be(data, drvdata->base_address + XHI_WF_OFFSET);
> =A0}
>
> =A0/**
> @@ -105,7 +105,7 @@ static inline void fifo_icap_fifo_write(struct hwicap=
_drvdata *drvdata,
> =A0**/
> =A0static inline u32 fifo_icap_fifo_read(struct hwicap_drvdata *drvdata)
> =A0{
> - =A0 =A0 =A0 u32 data =3D in_be32(drvdata->base_address + XHI_RF_OFFSET);
> + =A0 =A0 =A0 u32 data =3D ioread32be(drvdata->base_address + XHI_RF_OFFS=
ET);
> =A0 =A0 =A0 =A0dev_dbg(drvdata->dev, "fifo_read: %x\n", data);
> =A0 =A0 =A0 =A0return data;
> =A0}
> @@ -118,7 +118,7 @@ static inline u32 fifo_icap_fifo_read(struct hwicap_d=
rvdata *drvdata)
> =A0static inline void fifo_icap_set_read_size(struct hwicap_drvdata *drvd=
ata,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0u32 data)
> =A0{
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_SZ_OFFSET, data);
> + =A0 =A0 =A0 iowrite32be(data, drvdata->base_address + XHI_SZ_OFFSET);
> =A0}
>
> =A0/**
> @@ -127,7 +127,7 @@ static inline void fifo_icap_set_read_size(struct hwi=
cap_drvdata *drvdata,
> =A0**/
> =A0static inline void fifo_icap_start_config(struct hwicap_drvdata *drvda=
ta)
> =A0{
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_CR_OFFSET, XHI_CR_WRIT=
E_MASK);
> + =A0 =A0 =A0 iowrite32be(XHI_CR_WRITE_MASK, drvdata->base_address + XHI_=
CR_OFFSET);
> =A0 =A0 =A0 =A0dev_dbg(drvdata->dev, "configuration started\n");
> =A0}
>
> @@ -137,7 +137,7 @@ static inline void fifo_icap_start_config(struct hwic=
ap_drvdata *drvdata)
> =A0**/
> =A0static inline void fifo_icap_start_readback(struct hwicap_drvdata *drv=
data)
> =A0{
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_CR_OFFSET, XHI_CR_READ=
_MASK);
> + =A0 =A0 =A0 iowrite32be(XHI_CR_READ_MASK, drvdata->base_address + XHI_C=
R_OFFSET);
> =A0 =A0 =A0 =A0dev_dbg(drvdata->dev, "readback started\n");
> =A0}
>
> @@ -159,7 +159,7 @@ static inline void fifo_icap_start_readback(struct hw=
icap_drvdata *drvdata)
> =A0**/
> =A0u32 fifo_icap_get_status(struct hwicap_drvdata *drvdata)
> =A0{
> - =A0 =A0 =A0 u32 status =3D in_be32(drvdata->base_address + XHI_SR_OFFSE=
T);
> + =A0 =A0 =A0 u32 status =3D ioread32be(drvdata->base_address + XHI_SR_OF=
FSET);
> =A0 =A0 =A0 =A0dev_dbg(drvdata->dev, "Getting status =3D %x\n", status);
> =A0 =A0 =A0 =A0return status;
> =A0}
> @@ -170,7 +170,7 @@ u32 fifo_icap_get_status(struct hwicap_drvdata *drvda=
ta)
> =A0**/
> =A0static inline u32 fifo_icap_busy(struct hwicap_drvdata *drvdata)
> =A0{
> - =A0 =A0 =A0 u32 status =3D in_be32(drvdata->base_address + XHI_SR_OFFSE=
T);
> + =A0 =A0 =A0 u32 status =3D ioread32be(drvdata->base_address + XHI_SR_OF=
FSET);
> =A0 =A0 =A0 =A0return (status & XHI_SR_DONE_MASK) ? 0 : 1;
> =A0}
>
> @@ -183,7 +183,7 @@ static inline u32 fifo_icap_busy(struct hwicap_drvdat=
a *drvdata)
> =A0static inline u32 fifo_icap_write_fifo_vacancy(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct hwicap_drvdata *drvdata)
> =A0{
> - =A0 =A0 =A0 return in_be32(drvdata->base_address + XHI_WFV_OFFSET);
> + =A0 =A0 =A0 return ioread32be(drvdata->base_address + XHI_WFV_OFFSET);
> =A0}
>
> =A0/**
> @@ -195,7 +195,7 @@ static inline u32 fifo_icap_write_fifo_vacancy(
> =A0static inline u32 fifo_icap_read_fifo_occupancy(
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct hwicap_drvdata *drvdata)
> =A0{
> - =A0 =A0 =A0 return in_be32(drvdata->base_address + XHI_RFO_OFFSET);
> + =A0 =A0 =A0 return ioread32be(drvdata->base_address + XHI_RFO_OFFSET);
> =A0}
>
> =A0/**
> @@ -361,13 +361,12 @@ void fifo_icap_reset(struct hwicap_drvdata *drvdata)
> =A0 =A0 =A0 =A0 * Reset the device by setting/clearing the RESET bit in t=
he
> =A0 =A0 =A0 =A0 * Control Register.
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 reg_data =3D in_be32(drvdata->base_address + XHI_CR_OFFSET);
> + =A0 =A0 =A0 reg_data =3D ioread32be(drvdata->base_address + XHI_CR_OFFS=
ET);
>
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_CR_OFFSET,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg_data | =
XHI_CR_SW_RESET_MASK);
> -
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_CR_OFFSET,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg_data & =
(~XHI_CR_SW_RESET_MASK));
> + =A0 =A0 =A0 iowrite32be(reg_data | XHI_CR_SW_RESET_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drvdata->base_address + XHI_CR_OFFS=
ET);
> + =A0 =A0 =A0 iowrite32be(reg_data & (~XHI_CR_SW_RESET_MASK),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drvdata->base_address + XHI_CR_OFFS=
ET);
>
> =A0}
>
> @@ -382,12 +381,12 @@ void fifo_icap_flush_fifo(struct hwicap_drvdata *dr=
vdata)
> =A0 =A0 =A0 =A0 * Flush the FIFO by setting/clearing the FIFO Clear bit i=
n the
> =A0 =A0 =A0 =A0 * Control Register.
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 reg_data =3D in_be32(drvdata->base_address + XHI_CR_OFFSET);
> + =A0 =A0 =A0 reg_data =3D ioread32be(drvdata->base_address + XHI_CR_OFFS=
ET);
>
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_CR_OFFSET,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg_data | =
XHI_CR_FIFO_CLR_MASK);
> + =A0 =A0 =A0 iowrite32be(reg_data | XHI_CR_FIFO_CLR_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drvdata->base_address + XHI_CR_OFFS=
ET);
>
> - =A0 =A0 =A0 out_be32(drvdata->base_address + XHI_CR_OFFSET,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg_data & =
(~XHI_CR_FIFO_CLR_MASK));
> + =A0 =A0 =A0 iowrite32be(reg_data & (~XHI_CR_FIFO_CLR_MASK),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 drvdata->base_address + XHI_CR_OFFS=
ET);
> =A0}
>
> diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xi=
linx_hwicap/xilinx_hwicap.c
> index 6172689..7d0f0fb 100644
> --- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> +++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
> @@ -95,6 +95,7 @@
> =A0/* For open firmware. */
> =A0#include <linux/of_device.h>
> =A0#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> =A0#endif
>
> =A0#include "xilinx_hwicap.h"
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
