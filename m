From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 1/6] MIPS: BMIPS: add missing console to bcm96358nb4ser
Date: Tue, 14 Jun 2016 16:38:47 +0200
Message-ID: <CAOiHx=kmkkMyHQQ5wm7J7UGgrsgpMv6dcBxHhwv4yFUc6zzwDw@mail.gmail.com>
References: <1465803534-25840-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465803534-25840-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi =C3=81lvaro,

On 13 June 2016 at 09:38, =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gma=
il.com> wrote:
> Console definition is needed in order to avoid a warning in earlycon =
to
> console transition.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/mips/boot/dts/brcm/bcm96358nb4ser.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts b/arch/mips/b=
oot/dts/brcm/bcm96358nb4ser.dts
> index f412117..702eae2 100644
> --- a/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts
> +++ b/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts

Unfortunately I haven't seen this earlier, but please don't name the
dts file bcm9* unless it's an actual reference/eval board from
Broadcom.

A more sensible name would be neufbox4-sercom.dts or
bcm6358-neufbox4-sercom.dts.


Regards
Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
