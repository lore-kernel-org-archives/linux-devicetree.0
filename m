From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt: fsl-fec.txt: Fix GPIO comment and remove hardcoded
 MAC address
Date: Tue, 24 Apr 2012 14:31:47 +0800
Message-ID: <CAAQ0ZWSUdzt3Ogt2jVacgVH=z6S4ckX+7+ipK+q2r3=0zLTgLw@mail.gmail.com>
References: <1335239915-2563-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335239915-2563-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 24 April 2012 11:58, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Fix the comment for the GPIO number used for PHY reset and also avoid pas=
sing a
> hardcoded MAC address.
>
You can choose to not pass MAC address from device tree, but someone
may want to use it for some case, e.g. local network just for
debugging.  In any case, it's a binding supported by driver, you can
choose not use it, but you can not remove it from the binding doc.

Regards,
Shawn

> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> =A0Documentation/devicetree/bindings/net/fsl-fec.txt | =A0 =A06 +-----
> =A01 files changed, 1 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Document=
ation/devicetree/bindings/net/fsl-fec.txt
> index de43951..3261203 100644
> --- a/Documentation/devicetree/bindings/net/fsl-fec.txt
> +++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
> @@ -9,9 +9,6 @@ Required properties:
> =A0 "rgmii", "rgmii-id", "rgmii-rxid", "rgmii-txid", "rtbi", "smii".
> =A0- phy-reset-gpios : Should specify the gpio for phy reset
>
> -Optional properties:
> -- local-mac-address : 6 bytes, mac address
> -
> =A0Example:
>
> =A0fec@83fec000 {
> @@ -19,6 +16,5 @@ fec@83fec000 {
> =A0 =A0 =A0 =A0reg =3D <0x83fec000 0x4000>;
> =A0 =A0 =A0 =A0interrupts =3D <87>;
> =A0 =A0 =A0 =A0phy-mode =3D "mii";
> - =A0 =A0 =A0 phy-reset-gpios =3D <&gpio1 14 0>; /* GPIO2_14 */
> - =A0 =A0 =A0 local-mac-address =3D [00 04 9F 01 1B B9];
> + =A0 =A0 =A0 phy-reset-gpios =3D <&gpio1 14 0>; /* GPIO1_14 */
> =A0};
> --
> 1.7.1
>
