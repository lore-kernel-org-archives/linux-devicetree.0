From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] MFD/OF: document MFD devices and handle simple-mfd
Date: Tue, 3 Mar 2015 11:47:44 -0600
Message-ID: <CAL_JsqLjooPxPdG2+fqSJToyWCtZHB=FvkqCUt+WgHExNo7D=A@mail.gmail.com>
References: <1425375148-4369-1-git-send-email-linus.walleij@linaro.org> <1425375148-4369-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425375148-4369-2-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 3, 2015 at 3:32 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This defines a new compatible option for MFD devices "simple-mfd" that will
> make the OF core spawn child devices for all subnodes of that MFD device.
> It is optional but handy for things like syscon and possibly other
> simpler MFD devices.
>
> Since there was no file to put the documentation in, I took this opportunity
> to make a small writeup on MFD devices and add the compatible definition
> there.
>
> Suggested-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> I make the patch to the OF core in this one, it makes much more sense since
> it's a oneliner
>
> Lee: this is a (tested!) implementation of your suggestion for simple-mfd.
> If you can eventually ACK this from the MFD side, I think it should be
> funneled through the ARM SoC tree.
>
> Grant/Rob: if either of you can ACK the change to the OF core likewise it can
> be taken through ARM SoC.
>
> DT binings maintainers: there is some background discussion on this here:
> http://marc.info/?l=linux-arm-kernel&m=142486676603889&w=2
> http://marc.info/?l=devicetree&m=142166313621469&w=2
> ---
>  Documentation/devicetree/bindings/mfd/mfd.txt | 40 +++++++++++++++++++++++++++
>  drivers/of/platform.c                         |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mfd.txt
>
> diff --git a/Documentation/devicetree/bindings/mfd/mfd.txt b/Documentation/devicetree/bindings/mfd/mfd.txt
> new file mode 100644
> index 000000000000..cc057438abe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mfd.txt
> @@ -0,0 +1,40 @@
> +Multi-Function Devices (MFD)
> +
> +These devices comprise a nexus for heterogeneous hardware blocks spawning
> +multiple child devices.
> +
> +A typical MFD can be:
> +
> +- A mixed signal ASIC on an external bus, sometimes a PMIC (power management
> +  integrated circuit) that is manufactured in a lower technology node (rough
> +  silicon) that handles analog drivers for things like audio amplifiers, LED
> +  drivers, level shifters, PHY (physical interfaces to things like USB or
> +  ethernet), regulators etc.
> +
> +- A range of memory registers containing "miscellaneous system registers" also
> +  known as a system controller "syscon" or any other memory range containing a
> +  mix of unrelated registers.
> +
> +Optional properties:
> +
> +- compatible : "simple-mfd" - this signifies that the operating system should
> +  spawn child devices for all the subnodes of the MFD device akin to how
> +  "simple-bus" inidicates when to spawn children for a simple memory-mapped
> +  bus. For more complex devices, when the nexus driver has to probe registers
> +  to figure out what children exist etc, this should not be used. In the latter
> +  case the child devices will be instantiated by the operating system.

If you point of_platform_populate to the parent node, it should
instantiate all children regardless of "simple-bus" or any other
match. The match is to probe the grandchildren. I could be mistaken,
but that's how it works at the root level. You don't have a driver
probe for the parent, so you want the top level of_platform_populate
call to instantiate these devices?

Why does simple-bus not work for you? After all, it is not
"simple-memory-map-bus."

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
