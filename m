From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] of: irq: Fix interrupt-map entry matching
Date: Thu, 7 Nov 2013 10:40:16 -0600
Message-ID: <CAL_JsqKUaioiz2dw3Sr8f7UfqzjagWH_je2-u_QGYXRK5g1=yg@mail.gmail.com>
References: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
	<2177804.l4VGDTRFDu@amdc1227>
	<2713030.RoDxNQo0oz@amdc1227>
	<1773667.KXPxL5WsyI@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1773667.KXPxL5WsyI@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 7, 2013 at 5:32 AM, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> Hi Grant,
>
> Could you pick this patch up? It fixes boot-up at least on several Exynos
> based platforms, which use interrupt-map nodes with #interrupt-cells
> higher than 1.
>
> Also please disregard patch 2/2, as your fix that has been merged seems
> to be fine.

I've applied the 1st patch.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
