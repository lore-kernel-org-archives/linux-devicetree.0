From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv8 2/2] mailbox: Introduce framework for mailbox
Date: Wed, 16 Jul 2014 10:40:19 +0100
Message-ID: <53C64883.2050709@arm.com>
References: <1405071167-14503-1-git-send-email-jaswinder.singh@linaro.org> <1405071325-14683-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405071325-14683-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org" <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org" <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, "lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "loic.pallardy-qxv4g6HH51o@public.gmane.org" <loic.pallardy-qxv4g6HH51o@public.gmane.org>, "s-anna-l0cyMroinI0@public.gmane.org" <s-anna-l0cyMroinI0@public.gmane.org>, "ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "bjorn-UYDU3/A3LUY@public.gmane.org" <bjorn-UYDU3/A3LUY@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org" <Mollie.Wu-l16TxrwUIHTQFUHtdCDX3A@public.gmane.org>, "t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org" <t.takinishi-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/07/14 10:35, Jassi Brar wrote:
> Introduce common framework for client/protocol drivers and
> controller drivers of Inter-Processor-Communication (IPC).
>
> Client driver developers should have a look at
>   include/linux/mailbox_client.h to understand the part of
> the API exposed to client drivers.
> Similarly controller driver developers should have a look
> at include/linux/mailbox_controller.h
>
> Signed-off-by: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>   .../devicetree/bindings/mailbox/mailbox.txt        |  33 ++
>   Documentation/mailbox.txt                          | 107 +++++
>   MAINTAINERS                                        |   8 +
>   drivers/mailbox/Makefile                           |   4 +
>   drivers/mailbox/mailbox.c                          | 490 +++++++++++++++++++++
>   include/linux/mailbox_client.h                     |  48 ++
>   include/linux/mailbox_controller.h                 | 128 ++++++
>   7 files changed, 818 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt
>   create mode 100644 Documentation/mailbox.txt
>   create mode 100644 drivers/mailbox/mailbox.c
>   create mode 100644 include/linux/mailbox_client.h
>   create mode 100644 include/linux/mailbox_controller.h
>
> diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Documentation/devicetree/bindings/mailbox/mailbox.txt
> new file mode 100644
> index 0000000..3f00955
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mailbox.txt
> @@ -0,0 +1,33 @@
> +* Generic Mailbox Controller and client driver bindings
> +
> +Generic binding to provide a way for Mailbox controller drivers to
> +assign appropriate mailbox channel to client drivers.
> +
> +* Mailbox Controller
> +
> +Required property:
> +- #mbox-cells: Must be at least 1. Number of cells in a mailbox
> +               specifier.
> +
> +Example:
> +       mailbox: mailbox {
> +               ...
> +               #mbox-cells = <1>;
> +       };
> +
> +
> +* Mailbox Client
> +
> +Required property:
> +- mbox: List of phandle and mailbox channel specifier.
> +
> +- mbox-names: List of identifier strings for each mailbox channel
> +               required by the client.
> +

IMO the mailbox names are more associated with the controller channels/
mailbox rather than the clients using it. Does it make sense to move
this under controller. It also avoid each client replicating the names.

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
