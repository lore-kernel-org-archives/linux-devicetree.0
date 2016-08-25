From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/5] of/platform: introduce a generic way to declare a
 platform bus
Date: Thu, 25 Aug 2016 08:44:56 -0500
Message-ID: <CAL_JsqK42T1M3MO26p46K0zTuvGUAdMWAf4FHGVpAJgDa+SudQ@mail.gmail.com>
References: <1471918019-19472-1-git-send-email-haokexin@gmail.com> <1471918019-19472-4-git-send-email-haokexin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471918019-19472-4-git-send-email-haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 22, 2016 at 9:06 PM, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The specific buses which need to be probed at boot time are different
> between platforms. Instead of put all the buses into the default
> of_default_bus_match_table[] match tables, this patch introduces a
> general way to declare a platform bus.

I'd prefer to not do this with linker sections if possible. Doesn't
PPC have machine descriptors that you could add the match table to? If
that table exists then arch_want_default_of_probe could return a
pointer to it.

Are there any platforms that work with the default match table? I'd be
fine with adding some strings to the default if that helps.

{ .type = "soc", },

device_type is deprecated for FDT, so this shouldn't be needed except
for really old stuff.

{ .compatible = "soc", },

Doesn't appear in kernel dts files. Could be out of tree or old ones?

{ .compatible = "simple-bus" },

Already handled.

{ .compatible = "gianfar" },

Seems like the children of this should be probed by the gianfar driver.

{ .compatible = "gpio-leds", },

I don't think this is needed.

{ .type = "qe", },

Again, deprecated.

{ .compatible = "fsl,qe", },

No issue to add this. Though, you could also probe it from mpc85xx_qe_init().

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
