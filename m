From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] drm: rcar-du: use of_graph_get_remote_endpoint()
Date: Thu, 29 Jun 2017 13:22:14 +0200
Message-ID: <CAMuHMdUF-y38M3R4=fhb547aiF=+qwOpjipAXaThkQiTMQz7fg@mail.gmail.com>
References: <87mv8tez69.wl%kuninori.morimoto.gx@renesas.com>
 <87lgodez3z.wl%kuninori.morimoto.gx@renesas.com> <2246315.6ZutvAkGUK@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2246315.6ZutvAkGUK@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Thu, Jun 29, 2017 at 12:44 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wednesday 28 Jun 2017 00:32:17 Kuninori Morimoto wrote:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> Now, we can use of_graph_get_remote_endpoint(). Let's use it.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> ---
>> based on 4c9c3d595f1bad021cc126d20879df4016801736
>> ("of_graph: add of_graph_get_remote_endpoint()")
>
> This commit isn't upstream yet. I've taken the patch in my tree and will

FTR, it is in linux-next, but the function has been moved from
drivers/of/base.c to drivers/of/property.c.

> rebase it on top of v4.13-rc1 before submitting it for v4.14.

Note that a simple rebase won't make it disappear, due to the move.
So you'll have to drop it explicitly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
