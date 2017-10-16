From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: overlay: move resolve phandles into of_overlay_apply()
Date: Mon, 16 Oct 2017 15:46:53 -0500
Message-ID: <CAL_JsqL28_rr5CHMovr-k3h_Wyjpyf8xVia9Ffkcz_ZzGktCnA@mail.gmail.com>
References: <1507683745-17499-1-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507683745-17499-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 10, 2017 at 8:02 PM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sony.com>
>
> Move more code into of_overlay_apply() so that it does not have
> to be duplicated by each caller of of_overlay_apply().
>
> The test in of_resolve_phandles() that the overlay tree is detached is
> temporarily disabled so that old style overlay unittests do not fail.
>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
> ---
>
> This patch applies on top of the series: "[PATCH 00/12] of: overlay: clean
> up device tree overlay code".
>
> While reviewing "[PATCH 09/12] of: overlay: avoid race condition between
> applying multiple overlays", Rob asked if of_resolve_phandles() could be
> moved into of_overlay_apply().  This patch is what is involved in doing so.

Looks fine. Can you squash this into patch 9 and resend the series (or
at least 9-12). The rest all looks fine to me.

Rob
