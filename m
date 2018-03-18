From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] of: overlay: Fix forgotten reference to
 of_overlay_apply()
Date: Sun, 18 Mar 2018 07:48:08 -0500
Message-ID: <20180318124808.dqdjtejtjit3yi7m@rob-hp-laptop>
References: <1520592288-7680-1-git-send-email-geert+renesas@glider.be>
 <1520592288-7680-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520592288-7680-3-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 09, 2018 at 11:44:47AM +0100, Geert Uytterhoeven wrote:
> While technically the ovcs_id is still returned by of_overlay_apply(),
> this is an internal function.  All public callers of of_overlay_remove()
> pass an ovcs_id returned by the public function of_overlay_fdt_apply().
> 
> Fixes: 39a751a4cb7e4798 ("of: change overlay apply input data from unflattened to FDT")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> The single internal caller is of_overlay_remove_all().
> ---
>  drivers/of/overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.
