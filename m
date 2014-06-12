From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 0/5] of: Automatic console registration cleanups
Date: Wed, 11 Jun 2014 20:28:31 -0500
Message-ID: <CAL_JsqJmYH3_tSMtdwQd9QfeB39i5UOxBwBzyP=QjvzK1XSnmQ@mail.gmail.com>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396022885-6102-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 28, 2014 at 11:08 AM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi all,
>
> This is a series that I've been playing with over the last few days to
> clean up the selection of default console devices when using the device
> tree. The device tree defines a way of specifying the console by using a
> "stdout-path" property in the /chosen node, but very few drivers
> actually attempt to use that data, and so for most platforms there needs
> to be a "console=" line in the command line if a serial port is intended
> to be used as the console.
>
> With this series, if there is a /chosen/stdout-path property, and if
> that property points to a serial port node, then when the serial driver
> registers the port, the core uart_add_one_port() function will notice
> and if no console= argument was provided then add it as a preferred
> console.
>
> I've not tested this very extensively yet, but I want to get some
> feedback before I go further.
>
> The one downside with this approach is that it doesn't do anything for
> early console setup. That still needs to be added on a per-driver basis,
> but at least it shouldn't conflict with this approach.

Hey, what happened with this series?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
