From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: dma: Add YAML schemas for the generic
 DMA bindings
Date: Fri, 12 Jul 2019 15:49:32 -0600
Message-ID: <CAL_JsqL37NzqbVqqbG-z0RHE=uwqP_8VGF42ABgy24DiucSODA@mail.gmail.com>
References: <20190711092158.14678-1-maxime.ripard@bootlin.com>
 <CAL_JsqLh8QEwa-3v9-Vs=e55k3GyyvwsNVxmdBMWMD_VxqKMyA@mail.gmail.com>
 <28a776e2-52fa-60e9-a7d9-8caeec78f1d1@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <28a776e2-52fa-60e9-a7d9-8caeec78f1d1@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 12, 2019 at 3:24 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>
>
>
> On 11.7.2019 20.33, Rob Herring wrote:
> > On Thu, Jul 11, 2019 at 3:34 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >>
> >> The DMA controllers and consumers have a bunch of generic properties that
> >> are needed in a device tree. Add a YAML schemas for those.
> >>
> >> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >> ---
> >>  .../devicetree/bindings/dma/dma-consumer.yaml |  60 +++++++++
> >
> > This already exists in the dt-schema/schemas/dma/dma.yaml though not
> > the descriptions because that needs relicensing.
> >
> > Looks like we need NVidia's (Jon H) and TI's (Peter U) permission.
>
> If I'm not mistaken the new license is GPL-2.0, if so I don't see any
> issue, but I'll ask our legal to be sure.

To move it to the schema repository we need it to be (GPL-2.0 OR
BSD-2-Clause). I'd prefer to have the core bindings in the dt-schema
repo rather than add to the kernel.

Rob
