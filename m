From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/5] of: Automatic console registration cleanups
Date: Fri, 28 Mar 2014 16:53:15 -0700
Message-ID: <20140328235316.079E0C41FF4@trevor.secretlab.ca>
References: <1396022885-6102-1-git-send-email-grant.likely@linaro.org> < 20140328185653.GB26433@quad.lixom.net> < CAL_JsqKFO+OSz83f=XdyKgCqByUvHe7qLzgn5QLU1x1V1A5Fng@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKFO+OSz83f=XdyKgCqByUvHe7qLzgn5QLU1x1V1A5Fng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 28 Mar 2014 14:19:23 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Mar 28, 2014 at 1:56 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> > On Fri, Mar 28, 2014 at 09:08:00AM -0700, Grant Likely wrote:
> >> Hi all,
> >>
> >> This is a series that I've been playing with over the last few days to
> >> clean up the selection of default console devices when using the device
> >> tree. The device tree defines a way of specifying the console by using a
> >> "stdout-path" property in the /chosen node, but very few drivers
> >> actually attempt to use that data, and so for most platforms there needs
> >> to be a "console=" line in the command line if a serial port is intended
> >> to be used as the console.
> >>
> >> With this series, if there is a /chosen/stdout-path property, and if
> >> that property points to a serial port node, then when the serial driver
> >> registers the port, the core uart_add_one_port() function will notice
> >> and if no console= argument was provided then add it as a preferred
> >> console.
> >>
> >> I've not tested this very extensively yet, but I want to get some
> >> feedback before I go further.
> >>
> >> The one downside with this approach is that it doesn't do anything for
> >> early console setup. That still needs to be added on a per-driver basis,
> >> but at least it shouldn't conflict with this approach.
> 
> I'm working on the early aspect. I've got things working with either
> command line (which I sent out recently) and with parsing the FDT
> (which I haven't sent out yet).

Oooh, I missed that. I'll take a look through the series and comment.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
