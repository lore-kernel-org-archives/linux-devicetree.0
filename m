From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] bmips: add support for BCM63268
Date: Thu, 7 Apr 2016 12:57:22 -0500
Message-ID: <20160407175722.GF32257@rob-hp-laptop>
References: <1459684846-11308-1-git-send-email-noltari@gmail.com>
 <1459757517-14897-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459757517-14897-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 04, 2016 at 10:11:57AM +0200, =C1lvaro Fern=E1ndez Rojas wr=
ote:
> This SoC is very similar to BCM63168 and Broadcom usually refers to t=
hem as
> BCM63268.
> Use alphabetical order for bmips quirks.
> Add BCM63268 and missing BCM63168 to device tree documentation.
>=20
> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  v2: keep support for BCM63168
>=20
>  Documentation/devicetree/bindings/mips/brcm/soc.txt | 3 ++-
>  arch/mips/bmips/setup.c                             | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
