From: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v5 3/4] media: ov2640: add primary dt support
Date: Wed, 25 Feb 2015 11:54:26 +0800
Message-ID: <54ED4772.902@atmel.com>
References: <1423560696-12304-1-git-send-email-josh.wu@atmel.com> <1423560696-12304-4-git-send-email-josh.wu@atmel.com> <CA+V-a8vkd2Q714s=o9WZZvPWJQATp=6POb8VYdSgarKxxEKqyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <CA+V-a8vkd2Q714s=o9WZZvPWJQATp=6POb8VYdSgarKxxEKqyQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAK <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi, Prabhakar Lad

On 2/17/2015 12:48 AM, Lad, Prabhakar wrote:
> Hi Josh,
>
> Thanks for the patch.
>
> On Tue, Feb 10, 2015 at 9:31 AM, Josh Wu <josh.wu@atmel.com> wrote:
> [Snip]
>> -       priv->clk =3D v4l2_clk_get(&client->dev, "mclk");
>> +       priv->clk =3D v4l2_clk_get(&client->dev, "xvclk");
> with this change don=E2=80=99t you need to update the board file usin=
g this driver/
> the bridge driver ?
I think no.

=46irst, my patch should be on top of the following two patches, which=20
changed the *v4l2_clk_get()* behavior:
[v3,1/2] V4L: remove clock name from v4l2_clk API
https://patchwork.linuxtv.org/patch/28108/
[v4,2/2] V4L: add CCF support to the v4l2_clk API
https://patchwork.linuxtv.org/patch/28111/

After applied above two patches, v4l2_clk_get() function is changed. Th=
e=20
name "mclk" is refer to a CCF clock of the ov2640 device.
If not found such a "mclk" CCF clock, v4l2_clk_get() will try to get th=
e=20
internal register clock in soc_camera.c.
As the CCF dt clock is not support by ov2640 until I add DT support,=20
that means current ov2640 driver will always not found the "mclk" CCF=20
clock, and they will use internal clock.
So after I changed the name "mclk" to "xvclk", the default behavior wil=
l=20
not change (still using internal clock registered by soc-camera.c).

Best Regards,
Josh Wu

>
> Regards,
> --Prabhakar Lad
