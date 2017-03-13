From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] fpga: add config complete timeout
Date: Mon, 13 Mar 2017 13:46:53 -0700
Message-ID: <CAAtXAHc_bdK8f3pyQ7n7J4EEXfu3fZ2TPjMcQzbRzzKpJBg1RQ@mail.gmail.com>
References: <1489174827-6033-1-git-send-email-matthew.gerlach@linux.intel.com> <1489174827-6033-2-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489174827-6033-2-git-send-email-matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 10, 2017 at 11:40 AM,  <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>
> Adding timeout for maximum allowed time for FPGA to go to
> operating mode after a FPGA region has been programmed.
>
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Acked-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/fpga/fpga-region.c    | 3 +++
>  include/linux/fpga/fpga-mgr.h | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
> index 3222fdb..28401cb 100644
> --- a/drivers/fpga/fpga-region.c
> +++ b/drivers/fpga/fpga-region.c
> @@ -381,6 +381,9 @@ static int fpga_region_notify_pre_apply(struct fpga_region *region,
>         of_property_read_u32(nd->overlay, "region-freeze-timeout-us",
>                              &info->disable_timeout_us);
>
> +       of_property_read_u32(nd->overlay, "config-complete-timeout-us",
> +                            &info->config_complete_timeout_us);
> +
>         /* If FPGA was externally programmed, don't specify firmware */
>         if ((info->flags & FPGA_MGR_EXTERNAL_CONFIG) && firmware_name) {
>                 pr_err("error: specified firmware and external-fpga-config");
> diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
> index 57beb5d..fd3f083 100644
> --- a/include/linux/fpga/fpga-mgr.h
> +++ b/include/linux/fpga/fpga-mgr.h
> @@ -76,11 +76,14 @@ enum fpga_mgr_states {
>   * @flags: boolean flags as defined above
>   * @enable_timeout_us: maximum time to enable traffic through bridge (uSec)
>   * @disable_timeout_us: maximum time to disable traffic through bridge (uSec)
> + * @config_complete_timeout_us: maximum time for FPGA to switch to operating
> + *        status in the write_complete op.
>   */
>  struct fpga_image_info {
>         u32 flags;
>         u32 enable_timeout_us;
>         u32 disable_timeout_us;
> +       u32 config_complete_timeout_us;
>  };
>
>  /**
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
