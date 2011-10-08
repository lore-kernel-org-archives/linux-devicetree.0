From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 0/3] GIC OF bindings
Date: Sat, 8 Oct 2011 19:34:29 +0530
Message-ID: <CAJuYYwRLqdfagj7KxbdmvPBz2J1LWwphew+0eTkxWDZtW8Zh7Q@mail.gmail.com>
References: <1317410880-24828-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1317410880-24828-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, marc.zyngier@arm.com, jamie@jamieiles.com, b-cousson@ti.com, shawn.guo@linaro.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 1 October 2011 00:57, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Another round of GIC devicetree support.
>
> This moves the tracking of the starting hwirq number into the irq dom=
ain
> code. Doing this makes hwirq =3D=3D GIC interrupt ID and simplifies t=
he GIC
> code removing irq_offset.
>
> The full series is available here. This includes Russell's devel-stab=
le and
> for-next branches and Nico's vmalloc branch:
>
> git://git.jdl.com/software/linux-3.0.git gic-v2
>
> Tested on highbank and Realview 11MPCore qemu (2 GICs).
>
> Rob
>
> Rob Herring (3):
> =A0irq: support domains with non-zero hwirq base
> =A0ARM: gic: add irq_domain support
> =A0ARM: gic: add OF based initialization

=46or Exynos4 GIC and Interrupt Combiner Controllers:

Tested-by: Thomas Abraham <thomas.abraham@linaro.org>

>
> =A0Documentation/devicetree/bindings/arm/gic.txt | =A0 55 ++++++++++
> =A0arch/arm/common/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0arch/arm/common/gic.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0142 +++++++++++++++++++------
> =A0arch/arm/include/asm/hardware/gic.h =A0 =A0 =A0 =A0 =A0 | =A0 =A05=
 +-
> =A0include/linux/irqdomain.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
| =A0 16 +++-
> =A0kernel/irq/irqdomain.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 12 +-
> =A06 files changed, 189 insertions(+), 42 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/arm/gic.txt
>
> --
> 1.7.5.4
>
>
