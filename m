From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 13/34] dt-bindings: arm: amlogic: Move
 'amlogic,meson-gx-ao-secure' binding to its own file
Date: Tue, 4 Dec 2018 22:18:18 -0600
Message-ID: <CAL_Jsq+hZRJZZ1ZcOxZVXtsUs0013cP0fyf3A=_9J15WbzuUhw@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-14-robh@kernel.org>
 <7hr2ewbxd4.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hr2ewbxd4.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 4, 2018 at 7:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Rob Herring <robh@kernel.org> writes:
>
> > It is best practice to have 1 binding per file, so board level bindings
> > should be separate for various misc SoC bindings.
> >
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Carlo Caione <carlo@caione.org>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-amlogic@lists.infradead.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/amlogic.txt       | 29 -------------------
> >  .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 ++++++++++++++++++
> >  2 files changed, 28 insertions(+), 29 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
>
> Acked-by: Kevin Hilman <khilman@baylibre.com>
>
> But this isn't really related to the schema series is it?  If you
> prefer, I can just queue this one separately via my tree.

Yes, you can take it.

Rob
