From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH trivial] of/overlay: Grammar s/an negative/a negative/
Date: Fri, 29 May 2015 09:59:43 -0500
Message-ID: <CAL_JsqKY3tcCA=t0g=mWSw2ticVFKfKypEv1ycssgin7jusQ9w@mail.gmail.com>
References: <1432210226-22446-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432210226-22446-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jiri Kosina <trivial@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 21, 2015 at 7:10 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.

Rob

> ---
>  drivers/of/overlay.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
> index 9af4d8de91792cb3..8fb906d4cdecfa4f 100644
> --- a/drivers/of/overlay.c
> +++ b/drivers/of/overlay.c
> @@ -442,7 +442,7 @@ static struct kset *ov_kset;
>   * of the overlay in a list. This list can be used to prevent
>   * illegal overlay removals.
>   *
> - * Returns the id of the created overlay, or an negative error number
> + * Returns the id of the created overlay, or a negative error number
>   */
>  int of_overlay_create(struct device_node *tree)
>  {
> @@ -607,7 +607,7 @@ static int overlay_removal_is_ok(struct of_overlay *ov)
>   *
>   * Removes an overlay if it is permissible.
>   *
> - * Returns 0 on success, or an negative error number
> + * Returns 0 on success, or a negative error number
>   */
>  int of_overlay_destroy(int id)
>  {
> @@ -656,7 +656,7 @@ EXPORT_SYMBOL_GPL(of_overlay_destroy);
>   *
>   * Removes all overlays from the system in the correct order.
>   *
> - * Returns 0 on success, or an negative error number
> + * Returns 0 on success, or a negative error number
>   */
>  int of_overlay_destroy_all(void)
>  {
> --
> 1.9.1
>
