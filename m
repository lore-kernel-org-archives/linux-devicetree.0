From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] gpio-exar: Use correct property prefix and document
 bindings
Date: Mon, 24 Jul 2017 14:06:14 -0500
Message-ID: <20170724190614.k2cd2aqzkoi5frvk@rob-hp-laptop>
References: <dd5bb6b5-a6a7-a799-581f-b5fb83aa677b@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <dd5bb6b5-a6a7-a799-581f-b5fb83aa677b-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 07:31:14AM +0200, Jan Kiszka wrote:
> The device-specific property should be prefixed with the vendor name,
> not "linux,", as Linus Walleij pointed out. Change this and document the
> bindings of this platform device.
> 
> We didn't ship the old binding in a release yet. So we can still change
> it without breaking an official API.
> 
> Fixes: 380b1e2f3a2f ("gpio-exar/8250-exar: Make set of exported GPIOs configurable")
> 
> Signed-off-by: Jan Kiszka <jan.kiszka-kv7WeFo6aLtBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-exar.txt | 5 +++++
>  drivers/gpio/gpio-exar.c                             | 2 +-
>  drivers/tty/serial/8250/8250_exar.c                  | 4 ++--
>  3 files changed, 8 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-exar.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
