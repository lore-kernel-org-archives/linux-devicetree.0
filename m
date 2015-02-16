From: "Lad, Prabhakar" <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/4] media: ov2640: add primary dt support
Date: Mon, 16 Feb 2015 16:48:44 +0000
Message-ID: <CA+V-a8vkd2Q714s=o9WZZvPWJQATp=6POb8VYdSgarKxxEKqyQ@mail.gmail.com>
References: <1423560696-12304-1-git-send-email-josh.wu@atmel.com> <1423560696-12304-4-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423560696-12304-4-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Josh,

Thanks for the patch.

On Tue, Feb 10, 2015 at 9:31 AM, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
[Snip]
>
> -       priv->clk =3D v4l2_clk_get(&client->dev, "mclk");
> +       priv->clk =3D v4l2_clk_get(&client->dev, "xvclk");

with this change don=E2=80=99t you need to update the board file using =
this driver/
the bridge driver ?

Regards,
--Prabhakar Lad
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
