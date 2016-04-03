From: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: [PATCH 2/3] MIPS: BMIPS: improve BCM6358 device tree
Date: Mon, 4 Apr 2016 01:10:10 +0200
Message-ID: <20160403231010.GA6518@linux-mips.org>
References: <1459685585-11747-1-git-send-email-noltari@gmail.com>
 <1459685585-11747-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459685585-11747-2-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Apr 03, 2016 at 02:13:04PM +0200, =C1lvaro Fern=E1ndez Rojas wr=
ote:

> - Switch to bcm6345-l1-intc interrupt controller.
> - Add ehci0 and ohci0 nodes.
> - Use proper native-endian syscon property.
>=20
> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/mips/boot/dts/brcm/bcm6358.dtsi | 29 ++++++++++++++++++++++++--=
---

Any reason Why didn't you fold this patch into the "[v3,2/2] bmips: add
device tree example for BCM6358" patch of the other series?

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
