From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] fpga pr ip: Core driver support for Altera Partial
 Reconfiguration IP.
Date: Thu, 16 Feb 2017 09:35:27 -0800
Message-ID: <CAAtXAHd_uk=9A4H=vjdd9VTiwHo5_zX-hPURW9d70KeWSKO-mg@mail.gmail.com>
References: <1487193038-3490-1-git-send-email-matthew.gerlach@linux.intel.com> <1487193038-3490-3-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487193038-3490-3-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matthew,

On Wed, Feb 15, 2017 at 1:10 PM,  <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:

> +static int alt_pr_fpga_write_complete(struct fpga_manager *mgr,
> +                                     struct fpga_image_info *info)
> +{
> +       u32 i;
> +
> +       for (i = 0; i < info->config_complete_timeout_us; i++) {
> +               switch (alt_pr_fpga_state(mgr)) {
> +               case FPGA_MGR_STATE_WRITE_ERR:
> +                       return -EIO;
> +
> +               case FPGA_MGR_STATE_OPERATING:
> +                       dev_info(&mgr->dev,
> +                                "successful partial reconfiguration\n");
> +                       return 0;
> +
> +               default:
> +                       break;
> +               }
> +               udelay(1);

Does this need to be a udelay? would a usleep_range() do maybe?

Could we maybe pull the timeout part into the framework if all drivers are doing
is to wait / poll for the state to be a certain value?

Thanks,

Moritz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
