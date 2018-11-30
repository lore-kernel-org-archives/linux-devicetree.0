From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 12/36] dt-bindings: arm: Convert cpu binding to json-schema
Date: Fri, 30 Nov 2018 12:00:05 -0600
Message-ID: <CAL_JsqJJkcbxvfbVVOTPb5gavPgypO-Cd05C6qpvbvPMd1G81g@mail.gmail.com>
References: <20181005165848.3474-1-robh@kernel.org> <20181005165848.3474-13-robh@kernel.org>
 <035ae23f-3c92-ffd9-0753-abbd604c5c02@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <035ae23f-3c92-ffd9-0753-abbd604c5c02@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Tom Rini <trini@konsulko.com>, Kumar Gala <kumar.gala@linaro.org>, Grant Likely <glikely@secretlab.ca>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Jonathan
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 2:49 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> Hi Rob,
>
> On 05. 10. 18 18:58, Rob Herring wrote:
> > Convert ARM CPU binding to DT schema format using json-schema.
> >
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/cpus.txt          | 490 -----------------
> >  .../devicetree/bindings/arm/cpus.yaml         | 503 ++++++++++++++++++
> >  2 files changed, 503 insertions(+), 490 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/cpus.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/cpus.yaml

[...]

> I have take a look at xilinx part of this and try to build it for arm64
> platforms and I see errors coming from this cpu description.
> /root/linux/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dt.yaml:
> cpu@0:compatible: ['arm,cortex-a53', 'arm,armv8'] is too long
> /root/linux/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dt.yaml:
> cpu@0:compatible: Additional items are not allowed ('arm,armv8' was
> unexpected)

Thanks for actually giving this a spin!

> Based on grep this is used in a lot of places
> compatible = "arm,cortex-a53", "arm,armv8";
>
> Should this be moved to just simple?
> compatible = "arm,cortex-a53";

I'd normally go with the majority which would be to keep it. However,
'arm,armv8' is of questionable value, isn't actually documented, and
doesn't exist for any other version of the architecture. So we should
kill it IMO.

Paging Mark Rutland and other arm folks...

Rob
