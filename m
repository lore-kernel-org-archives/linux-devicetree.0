From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 04/14] ARM: r1 DT mach id init
Date: Wed, 18 Aug 2010 14:56:57 -0600
Message-ID: <AANLkTikRRE=NjoaeJFU4gBcqr9dZoiO=Rci4FVjwxKAK@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-5-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
> Device tree ARM machine desc has been allocated id 0xffffffff temporarily.
> This machine id should be passed in r1 upon kernel booting.
> Legacy code requires code stubs to update r1 accordingly when
> booting from legacy boot loaders that do not necessarily pass DT
> mach id on r1.
>
> This patch adds code in the dtb stub to automatically generate and move
> the required DT machine id into r1 before jumping to kernel code.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>

Fixed in test-devicetree.  You'll be able to drop this one.

> ---
> =A0arch/arm/boot/dt/dtb.S | =A0 =A03 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/boot/dt/dtb.S b/arch/arm/boot/dt/dtb.S
> index e678db2..7d56289 100644
> --- a/arch/arm/boot/dt/dtb.S
> +++ b/arch/arm/boot/dt/dtb.S
> @@ -35,6 +35,9 @@ setup_dtb:
> =A0 =A0 =A0 =A0cmp =A0 =A0 r4, r5
> =A0 =A0 =A0 =A0blo =A0 =A0 2b
>
> + =A0 =A0 =A0 /* update r1 with DT id =A0*/
> + =A0 =A0 =A0 mvn =A0 =A0 r1, #0x0
> +
> =A0 =A0 =A0 =A0b =A0 =A0 =A0 zimage_start
>
> =A0 =A0 =A0 =A0.ltorg
> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
