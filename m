From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC 5/9] dt-bindings: arm: amlogic: amlogic, meson-gx-ao-secure:
 convert to yaml
Date: Fri, 2 Aug 2019 09:32:36 -0600
Message-ID: <CAL_Jsq+gtauOzrRRtTqbowUSOMi5Rs_GQVt7e7gYHa7TtjOhOA@mail.gmail.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-6-narmstrong@baylibre.com>
 <90dbcb33-74a2-68de-eb1a-ce84040298b8@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <90dbcb33-74a2-68de-eb1a-ce84040298b8@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 2, 2019 at 8:37 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Rob,
>
> Thanks for reviews.
>
> On 01/08/2019 15:56, Neil Armstrong wrote:
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 -------------
> >  .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 42 +++++++++++++++++++
> >  2 files changed, 42 insertions(+), 28 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> > deleted file mode 100644
> > index c67d9f48fb91..000000000000
> > --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -Amlogic Meson Firmware registers Interface
> > -------------------------------------------
> > -
> > -The Meson SoCs have a register bank with status and data shared with the
> > -secure firmware.
> > -
> > -Required properties:
> > - - compatible: For Meson GX SoCs, must be "amlogic,meson-gx-ao-secure", "syscon"
>
> I have a hard time find how to define "syscon" here, if I put syscon in the compatible
> it gets matched on other bindings and I get lot of warnings.
>
> How should I model it ?

You have to add a custom 'select' key that doesn't include 'syscon'.
There should be a few examples in the tree.

Rob
