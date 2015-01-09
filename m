From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/6] btwilink: add minimal device tree support
Date: Fri, 9 Jan 2015 09:34:36 +0530
Message-ID: <CAEUmHyYOpz2+H37RBejQc+KQOvguejwNcnSMn96PD31hwurw3A@mail.gmail.com>
References: <1420775239-24745-1-git-send-email-gigi.joseph@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420775239-24745-1-git-send-email-gigi.joseph-l0cyMroinI0@public.gmane.org>
Sender: linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gigi Joseph <gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gigi Joseph <gigi.joseph-l0cyMroinI0@public.gmane.org>, Eyal Reizer <eyalr-l0cyMroinI0@public.gmane.org>, bvijay <bvijay-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 9, 2015 at 9:17 AM, Gigi Joseph <gigi.joseph-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add minimal device tree support to the btwilink driver that is used
> for binding bluetooth with the ti-st shared transport driver.
>
> Signed-off-by: Eyal Reizer <eyalr-l0cyMroinI0@public.gmane.org>
> Signed-off-by: bvijay <bvijay-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Gigi Joseph <gigi.joseph-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/bluetooth/btwilink.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/bluetooth/btwilink.c b/drivers/bluetooth/btwilink.c
> index 55c135b..95adec3 100644
> --- a/drivers/bluetooth/btwilink.c
> +++ b/drivers/bluetooth/btwilink.c
> @@ -30,6 +30,7 @@
>
>  #include <linux/ti_wilink_st.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>
>  /* Bluetooth Driver Version */
>  #define VERSION               "1.0"
> @@ -286,6 +287,14 @@ static int ti_st_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
>         return 0;
>  }
>
> +static const struct of_device_id btwilink_of_match[] = {
> +{
> +       .compatible = "btwilink",
compatible property include the manufacturer name also...
compatible="<manufacturer>,<model>"
> +       },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, btwilink_of_match);
> +
>  static int bt_ti_probe(struct platform_device *pdev)
>  {
>         static struct ti_st *hst;
> @@ -349,6 +358,8 @@ static struct platform_driver btwilink_driver = {
>         .remove = bt_ti_remove,
>         .driver = {
>                 .name = "btwilink",
> +               .owner = THIS_MODULE,
No need to update this field. It will be updated by driver core.
> +               .of_match_table = of_match_ptr(btwilink_of_match),
>         },
>  };
>
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks and Regards,
Varka Bhadram.
