From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 18/34] dt-bindings: arm: Convert FSL board/soc bindings
 to json-schema
Date: Thu, 6 Dec 2018 17:33:13 -0600
Message-ID: <CAL_JsqK5nBdk-MiuTPMxr9oXqXnLqeMU3vtZi6AnT9V35_W55A@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-19-robh@kernel.org>
 <20181206023140.GZ3987@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206023140.GZ3987@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 8:32 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Mon, Dec 03, 2018 at 03:32:07PM -0600, Rob Herring wrote:
> > Convert Freescale SoC bindings to DT schema format using json-schema.
> >
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/armadeus.txt      |   6 -
> >  Documentation/devicetree/bindings/arm/bhf.txt |   6 -
> >  .../bindings/arm/compulab-boards.txt          |  25 --
> >  Documentation/devicetree/bindings/arm/fsl.txt | 229 ------------------
> >  .../devicetree/bindings/arm/fsl.yaml          | 214 ++++++++++++++++
>
> Rob,
>
> I do have any changes on bindings/arm/fsl.txt queued for 4.21 on my
> tree, so please send it via your tree.

What about:

c386f362957b dt-bindings: Add compatible string for LS1028A-QDS
3671cd57de06 dt-bindings: ls1012a: Add FRWY-LS1012A device tree binding

>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
