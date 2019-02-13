From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm: imx: Use of_node_name_eq for node name comparisons
Date: Wed, 13 Feb 2019 12:07:33 -0600
Message-ID: <CAL_JsqKPJet11X3pru1u5hEUVUH_SCcmncVAaesfDrzxtUEGEg@mail.gmail.com>
References: <20181205195050.4759-7-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-7-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 1:50 PM Rob Herring <robh@kernel.org> wrote:
>
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
>
> For instances using of_node_cmp, this has the side effect of now using
> case sensitive comparisons. This should not matter for any FDT based
> system which this is.
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/imx/imx-drm-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Philipp, can I get an ack on this? I can commit it.

Rob
