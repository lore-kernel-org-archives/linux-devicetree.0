From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] Yet another GIC OF binding series
Date: Sat, 3 Sep 2011 19:04:31 +0530
Message-ID: <CAJuYYwT9ZB-4O9fnMT_svFY=X4bBZhs0U6=Zp-cCaWhxLgpmAQ@mail.gmail.com>
References: <1312921020-6820-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1312921020-6820-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10 August 2011 01:46, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>
> Grant,
>
> Here's yet another patch series for GIC binding and init.
>
> You keep saying we should have a common DT function scanning for interrupt
> controller nodes and calling their initialization functions. But that will
> not work until we have dynamic assignment of linux irq numbers. So either
> everyone should just stop trying to do DT bindings for GIC/VIC until that
> is in place, or we need an interim solution. This is another attempt at
> the latter. I reworked gic_of_init intending for it to be the interrupt
> controller specific initialization function that DT interrupt controller
> scanning code would call. For now, it is just called by the platform code.
> The platform initialization looks something like this:
>
> struct of_intc_desc desc;
> memset(&desc, 0, sizeof(desc));
> desc.controller =3D of_find_compatible_node(NULL, NULL, "arm,cortex-a9-gi=
c");
> gic_of_init(&desc);
>
> I've addressed your previous comments and in particular initializing more
> than 1 GIC is supported now.

Works fine for Exynos4.

Tested-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

>
> Rob
>
> Rob Herring (3):
> =A0dt: irq: add interrupt controller descriptor struct
> =A0ARM: gic: allow irq_start to be 0
> =A0ARM: gic: add OF based initialization
>
> =A0Documentation/devicetree/bindings/arm/gic.txt | =A0 28 +++++++++++++++=
++++
> =A0arch/arm/common/gic.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 36 ++++++++++++++++++++++++-
> =A0arch/arm/include/asm/hardware/gic.h =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +
> =A0include/linux/of_irq.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A06 ++++
> =A04 files changed, 71 insertions(+), 1 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/gic.txt
>
> --
> 1.7.4.1
>
>
