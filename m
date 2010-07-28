From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] xilinxfb: update tft comp versions
Date: Wed, 28 Jul 2010 01:52:28 -0600
Message-ID: <AANLkTikHyoBtEzcPmsck9X_Xkg4iy7y+uU-59qm86-G+@mail.gmail.com>
References: <1280265853-21245-1-git-send-email-aalonso00@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1280265853-21245-1-git-send-email-aalonso00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Adrian Alonso <aalonso00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 27, 2010 at 3:24 PM, Adrian Alonso <aalonso00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> * Add tft display module compatibility for new
> =A0hardware modules
>
> Signed-off-by: Adrian Alonso <aalonso00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0drivers/video/xilinxfb.c | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/video/xilinxfb.c b/drivers/video/xilinxfb.c
> index 574dc54..29b5daa 100644
> --- a/drivers/video/xilinxfb.c
> +++ b/drivers/video/xilinxfb.c
> @@ -485,6 +485,8 @@ static int __devexit xilinxfb_of_remove(struct of_dev=
ice *op)
> =A0/* Match table for of_platform binding */
> =A0static struct of_device_id xilinxfb_of_match[] __devinitdata =3D {
> =A0 =A0 =A0 =A0{ .compatible =3D "xlnx,xps-tft-1.00.a", },
> + =A0 =A0 =A0 { .compatible =3D "xlnx,xps-tft-2.00.a", },
> + =A0 =A0 =A0 { .compatible =3D "xlnx,xps-tft-2.01.a", },
> =A0 =A0 =A0 =A0{ .compatible =3D "xlnx,plb-tft-cntlr-ref-1.00.a", },
> =A0 =A0 =A0 =A0{ .compatible =3D "xlnx,plb-dvi-cntlr-ref-1.00.c", },
> =A0 =A0 =A0 =A0{},

I'll merged this, but it isn't exactly the best fix (not your fault; a
deficiency in the xilinx device tree generator).  I still need to get
around to fixing the generator to claim compatibility with the .00.a
ip core versions by default for newer parts with the same major
revision number.  Once it is fixed, then only the -2.00.a compatible
value would need to be added to the table.

Thanks Adrian.

g.
