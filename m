From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] drm: convert drivers to use drm_of_find_panel_or_bridge
Date: Sun, 5 Feb 2017 23:22:34 -0200
Message-ID: <CAOMZO5DnmbtTVthqFYq=Q7LkSFo-mEm=xUjV7VP2Jci-HTT10A@mail.gmail.com>
References: <20170204033635.10250-1-robh@kernel.org> <20170204033635.10250-5-robh@kernel.org>
 <CAOMZO5Cb5Ye4uWtnV=rtaYAJGAS3C0bZAkVAab37PkSdyK=2fw@mail.gmail.com>
 <CAL_JsqKnPryTDhXKQtRZ05KZ1KDgNi40JP5W8HFgcEZJUTSBFg@mail.gmail.com> <CAOMZO5AmrpfDaC3rmH+DTON+xgYuFeXKpVhYHMxYqF9eh3Af-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5AmrpfDaC3rmH+DTON+xgYuFeXKpVhYHMxYqF9eh3Af-A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, DRI mailing list <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Joonyoung Shim <jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Stefan Agner <stefa>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 5, 2017 at 10:01 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> The tda998x_probe() returns success, but tda998x_bind() is never called.
>
> I am trying to understand what needs to be done in
> drivers/gpu/drm/mxsfb/ so that it can bind the tda998x driver.

Looks like that converting to component style and adding
component_bind_all() does the trick:

[    1.323772] tda998x 2-0070: found TDA19988
[    1.342381] mxsfb 2220000.lcdif: bound 2-0070 (ops tda998x_ops)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
