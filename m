From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 9/9] pinctrl: single: dump pinmux register value
Date: Mon, 22 Oct 2012 15:27:44 -0700
Message-ID: <20121022222744.GM4730@atomide.com>
References: <1350922139-3693-1-git-send-email-haojian.zhuang@gmail.com>
 <1350922139-3693-10-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1350922139-3693-10-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [121022 09:13]:
> Dump pinmux register value, not only function part in the pinmux
> register.

This makes sense, but should be done using pcs_read, not pcs_readl,
see below.

> Also fix the issue on caluclating pin offset. The last parameter
> should be pin number, not register offset.
>
> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/pinctrl/pinctrl-single.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
> index a20da78..6ba2a5d 100644
> --- a/drivers/pinctrl/pinctrl-single.c
> +++ b/drivers/pinctrl/pinctrl-single.c
> @@ -284,15 +284,15 @@ static int pcs_get_group_pins(struct pinctrl_dev *pctldev,
>  
>  static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
>  					struct seq_file *s,
> -					unsigned offset)
> +					unsigned pin)
>  {
>  	struct pcs_device *pcs;
> -	unsigned val;
> +	unsigned val, mux_bytes;
>  
>  	pcs = pinctrl_dev_get_drvdata(pctldev);
>  
> -	val = pcs->read(pcs->base + offset);
> -	val &= pcs->fmask;
> +	mux_bytes = pcs->width / BITS_PER_BYTE;
> +	val = pcs_readl(pcs->base + pin * mux_bytes);
>  
>  	seq_printf(s, "%08x %s " , val, DRIVER_NAME);
>  }

You should not use pcs_readl here directly as the register
width can vary. Can you please update the patch for that and
make it independent from the rest of the series? That way we
can merge the fix for v3.7-rc series.

Regards,

Tony
