From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Full DT IRQ support for versatile
Date: Thu, 12 Jan 2012 18:20:37 -0700
Message-ID: <CACxGe6v-gkW+pDP-2hTcf7WqeMBtx+H80Xymj7SqS8nqin9qUA@mail.gmail.com>
References: <1326415441-17695-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326415441-17695-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2012 at 5:43 PM, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org> wrote:
> These patches move versatile over to instantiating both interrupt
> controllers from the device tree. =A0I've tested this in qemu for both DT
> and non-DT platforms but only with an initramfs. =A0I've seen interrupts
> generated on both controllers for both boot methods.
>
> Grant, Rob, this makes use of irqdomain again as I'm not sure what the
> replacement is going to look like yet. =A0versatile works with DT in
> mainline, but that's kind of lucky... =A0I know there's been patches to
> make irq_domain_add_simple() return the irq_domain and can rebase if
> needed.

I posted the patches for finishing up irq_domain migration yesterday.
irq_domain_add_simple() can trivially be changed to
irq_domain_add_legacy. I'll try out these
patches on top of my irqdomain/next branch

g.

>
> Jamie Iles (2):
> =A0versatile: sic: add device tree bindings
> =A0versatile: dt: register interrupt controllers from dt
>
> =A0.../devicetree/bindings/arm/versatile-sic.txt =A0 =A0 =A0| =A0 27 ++++=
++++++
> =A0arch/arm/mach-versatile/core.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 27 +++-------
> =A0arch/arm/mach-versatile/core.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0arch/arm/mach-versatile/versatile_dt.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
5 +++++-
> =A0arch/arm/plat-versatile/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
> =A0arch/arm/plat-versatile/fpga-irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 51 +++++++++++++++++++-
> =A0arch/arm/plat-versatile/include/plat/fpga-irq.h =A0 =A0| =A0 =A06 ++
> =A07 files changed, 106 insertions(+), 22 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/versatile-sic=
.txt
>
> --
> 1.7.5.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
