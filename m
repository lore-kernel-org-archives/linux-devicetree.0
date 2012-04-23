From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt: fsl-imx-cspi.txt: Fix comment about GPIOs used for
 chip selects
Date: Mon, 23 Apr 2012 09:32:31 +0800
Message-ID: <CAAQ0ZWTsdrYQ28=K=acnP=HT3+1DuTa-X8q0NM66xcvSP21hgw@mail.gmail.com>
References: <1335028873-3395-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1335028873-3395-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22 April 2012 01:21, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The gpio numbers does not match the comment.
>
> Fix the comments for GPIOs used for chip selects.
>
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Grant, Rob,

Please let me know if you prefer to have it go through arm-soc tree
than spi or dt tree.

Regards,
Shawn

> ---
> =A0.../devicetree/bindings/spi/fsl-imx-cspi.txt =A0 =A0 =A0 | =A0 =A04 ++=
--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt b/Doc=
umentation/devicetree/bindings/spi/fsl-imx-cspi.txt
> index 9841057..4256a6d 100644
> --- a/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
> +++ b/Documentation/devicetree/bindings/spi/fsl-imx-cspi.txt
> @@ -17,6 +17,6 @@ ecspi@70010000 {
> =A0 =A0 =A0 =A0reg =3D <0x70010000 0x4000>;
> =A0 =A0 =A0 =A0interrupts =3D <36>;
> =A0 =A0 =A0 =A0fsl,spi-num-chipselects =3D <2>;
> - =A0 =A0 =A0 cs-gpios =3D <&gpio3 24 0>, /* GPIO4_24 */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&gpio3 25 0>; /* GPIO4_25 */
> + =A0 =A0 =A0 cs-gpios =3D <&gpio3 24 0>, /* GPIO3_24 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<&gpio3 25 0>; /* GPIO3_25 */
> =A0};
> --
> 1.7.1
>
