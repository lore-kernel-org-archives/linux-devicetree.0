From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] dt-bindings: gpu: add bindings for the ARM Mali
 Bifrost GPU
Date: Mon, 8 Apr 2019 14:07:00 -0500
Message-ID: <CAL_JsqJj4pae6AuK=HGU5GuZogFKyAbU_y7Ls_CyTcV6qXH_rg@mail.gmail.com>
References: <20190401080949.14550-1-narmstrong@baylibre.com>
 <1640dd7b-3576-d9ce-0641-6b6a64a87275@arm.com> <d26f1ce9-c56c-5e51-37f5-0689aa198dc0@baylibre.com>
 <5CA9CE1A.6060109@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5CA9CE1A.6060109@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 7, 2019 at 5:17 AM Neil Armstrong <narmstrong@baylibre.com> wro=
te:
>
> Hi Rob,
>
> Le 01/04/2019 13:24, Neil Armstrong a =C3=A9crit :
> > On 01/04/2019 12:00, Steven Price wrote:
> >> On 01/04/2019 09:09, Neil Armstrong wrote:
> >>> Add the bindings for the Bifrost family of ARM Mali GPUs.
> >>>
> >>> The Bifrost GPU architecture is similar to the Midgard family,
> >>> but with a different Shader Core & Execution Engine structures.
> >>>
> >>> Bindings are based on the Midgard family bindings, but the inner
> >>> architectural changes makes it a separate family needing separate
> >>> bindings.
> >>>
> >>> The Bifrost GPUs are present in a number of recent SoCs, like the
> >>> Amlogic G12A Family, and many other vendors.
> >>> The Amlogic vendor specific compatible is added to handle the
> >>> specific IP integration differences and dependencies.
> >>>
> >>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >>> ---
> >>>  .../bindings/gpu/arm,mali-bifrost.txt         | 92 +++++++++++++++++=
++
> >>>  1 file changed, 92 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bi=
frost.txt
> >>>
> >>> Changes since v3:
> >>> - Added note about discoverable model/revision
> >>> - Enforced fixed defined irq order
> >>> - Fixed typo in accommodate
> >>>
> >>> Changes since v2:
> >>> - moved to a single compatible since HW is fully discoverable
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.t=
xt b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> >>> new file mode 100644
> >>> index 000000000000..711c9ead17a2
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> >>> @@ -0,0 +1,92 @@
> >>> +ARM Mali Bifrost GPU
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +Required properties:
> >>> +
> >>> +- compatible :
> >>> +  * Since Mali Bifrost GPU model/revision if fully discoverable by r=
eading
> >>                                              ^^
> >> s/if/is/
>
> Should I still send a v5 to fixing this typo ? I can fix it while applyin=
g it.

No need to resend. I planned to apply it, but if you are going to:

Reviewed-by: Rob Herring <robh@kernel.org>
