From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/6] mailbox: dt-bindings: Add shared [driver <=>
 device tree] defines
Date: Mon, 10 Aug 2015 12:28:17 +0530
Message-ID: <CABb+yY2asjH-c+VJXvG+RK0=2p=P4Y21pznNP0riaKMWLxYZog@mail.gmail.com>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
	<1437990272-23111-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437990272-23111-3-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 27, 2015 at 3:14 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This header is currently only used for defines pertaining to data
> direction i.e. Rx, Tx or Loopback.
>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  include/dt-bindings/mailbox/mailbox.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/mailbox/mailbox.h
>
> diff --git a/include/dt-bindings/mailbox/mailbox.h b/include/dt-bindings/mailbox/mailbox.h
> new file mode 100644
> index 0000000..82e929a
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/mailbox.h
> @@ -0,0 +1,14 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __MAILBOX_CONTROLLER_DT_BINDINGS_H
> +#define __MAILBOX_CONTROLLER_DT_BINDINGS_H
> +
> +#define MBOX_TX                0x1
> +#define MBOX_RX                0x2
> +#define MBOX_LOOPBACK  (MBOX_RX | MBOX_TX)
> +
Not sure I understand 'loopback'.  Does it mean h/w has some
'loopback' mode for testing purposes? Or it simply means the
controller can send as well as receive messages?

Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
