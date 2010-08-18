From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 05/14] ARM: vexpress: fix typo in addruart
Date: Wed, 18 Aug 2010 14:58:58 -0600
Message-ID: <AANLkTi=KJgWL_cdTwYa96S3_ZEoOGzze9O24G1zZLdq0@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-6-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> The new infrastructure for low level debug in ARM requires the
> addruart macro to be defined on a platform specific basis to get
> rid of static addresses init in machine descriptors.
> Uart physical and virtual addresses should be retrieved through
> the addruart macro.
>
> This patch fixes the addruart macro for Versatile Express board
> in order to return the proper uart physical address.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0arch/arm/mach-vexpress/include/mach/debug-macro.S | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>

I'll leave this one to Jeremy.  I've not picked up any of the debug
macro patches into my tree.

g.

> diff --git a/arch/arm/mach-vexpress/include/mach/debug-macro.S b/arch/arm=
/mach-vexpress/include/mach/debug-macro.S
> index e0382fd..050d65e 100644
> --- a/arch/arm/mach-vexpress/include/mach/debug-macro.S
> +++ b/arch/arm/mach-vexpress/include/mach/debug-macro.S
> @@ -15,7 +15,7 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.macro =A0addruart,rp,rv
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mov =A0 =A0 \rp, #DEBUG_LL_UART_OFFSET
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0orr =A0 =A0 \rv, \rp, #0xf8000000 =A0 @ vi=
rtual base
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 orr =A0 =A0 \rv, \rp, #0x10000000 =A0 @ phy=
sical base
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 orr =A0 =A0 \rp, \rp, #0x10000000 =A0 @ phy=
sical base
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.endm
>
> =A0#include <asm/hardware/debug-pl01x.S>
> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
