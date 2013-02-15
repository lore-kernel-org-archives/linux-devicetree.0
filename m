From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/9] sh-pfc: Add OF support
Date: Fri, 15 Feb 2013 20:37:03 +0100
Message-ID: <CACRpkdYetPi=-wz+ESkJz_2LmfgDttUytwa8CAQNWu101aVtbA@mail.gmail.com>
References: <1360726161-16072-1-git-send-email-horms+renesas@verge.net.au>
	<1360726161-16072-2-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1360726161-16072-2-git-send-email-horms+renesas@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Phil Edworthy <phil.edworthy@renesas.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2013 at 4:29 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:

> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Support device instantiation through the device tree. The compatible
> property is used to select the SoC pinmux information.
>
> Set the gpio_chip device field to the PFC device to enable automatic
> GPIO OF support.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: devicetree-discuss@lists.ozlabs.org
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Looks good to me.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
