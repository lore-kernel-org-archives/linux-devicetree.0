From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt: fsl-fec.txt: Fix GPIO number comment
Date: Tue, 24 Apr 2012 21:54:55 +0800
Message-ID: <CAAQ0ZWScD=0S0oQJszhqv5sO5q4ETe2d8ON5F_5YZCau-ykKLQ@mail.gmail.com>
References: <1335273879-2281-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335273879-2281-1-git-send-email-fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24 April 2012 21:24, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Fix the comment for the GPIO number used for PHY reset.
>
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

David, Rob,

Let me know if you want the patch to go through arm-soc tree.

Regards,
Shawn

> ---
> Changes since v1:
> - Keep 'local-mac-address' information
>
> =A0Documentation/devicetree/bindings/net/fsl-fec.txt | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Document=
ation/devicetree/bindings/net/fsl-fec.txt
> index de43951..96ba770 100644
> --- a/Documentation/devicetree/bindings/net/fsl-fec.txt
> +++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
> @@ -19,6 +19,6 @@ fec@83fec000 {
> =A0 =A0 =A0 =A0reg =3D <0x83fec000 0x4000>;
> =A0 =A0 =A0 =A0interrupts =3D <87>;
> =A0 =A0 =A0 =A0phy-mode =3D "mii";
> - =A0 =A0 =A0 phy-reset-gpios =3D <&gpio1 14 0>; /* GPIO2_14 */
> + =A0 =A0 =A0 phy-reset-gpios =3D <&gpio1 14 0>; /* GPIO1_14 */
> =A0 =A0 =A0 =A0local-mac-address =3D [00 04 9F 01 1B B9];
> =A0};
> --
> 1.7.1
>
>
