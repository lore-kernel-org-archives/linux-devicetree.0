From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: chosen/stdout-path and userland (Re: Can't boot kernel v4.0-rc2
 on Koelsch)
Date: Wed, 11 Mar 2015 14:23:13 +0100
Message-ID: <CAMuHMdWjHnX4NS2Z7MMg9FBjDpo41h517U3t+ndSCzhGKDLCvA@mail.gmail.com>
References: <CAMuHMdVSbYYGQyOjce87Q_dMHvh9du1EkgOgC+CBgrMys++mkA@mail.gmail.com>
	<55003D82.1080601@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55003D82.1080601-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Cao Minh Hiep <cm-hiep-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>, Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>, Linux-SH <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Sakato Ryusuke <ryusuke.sakato.bx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Wed, Mar 11, 2015 at 2:05 PM, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> wrote:
> On 03/11/2015 06:08 AM, Geert Uytterhoeven wrote:
>> TL;DR
>>
>> After removing the "console=" parameter from chosen/bootargs, and relying
>> solely on chosen/stdout-path, Hiep-san's Linaro userland cannot find the
>> console device anymore.

> The tty subsystem emits the list of consoles as a space-delimited, single text
> line in /sys/class/tty/console/active (alias: /sys/devices/virtual/tty/console/active).

Thanks! I didn't know about that virtual file.

> The first console listed is the primary console.
> tty0 is not resolved to its underlying tty device name.

Are you sure about that? Isn't the last one the primary console?

root@koelsch:~# cat  /sys/class/tty/console/active
tty0 ttySC0

If tty0 would be the primary console, getty on /dev/console wouldn't work for
my serial console, as only input on the primary console can be read through
/dev/console if my memory serves me well (or perhaps this has changed?).

Ah, Documentation/ABI/testing/sysfs-tty agrees with me:

What:           /sys/class/tty/console/active
Date:           Nov 2010
Contact:        Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Description:
                 Shows the list of currently configured
                 console devices, like 'tty1 ttyS0'.
                 The last entry in the file is the active
                 device connected to /dev/console.

> That said, is the original reporter of this problem even interested in
> upgrading their userspace, even if this is fixed in Linaro eventually?
> What about other Linaro users?

We'll see...

> I think the only reasonable course here is to continue to support
> "console=" in /chosen/bootargs.

Hmm...
If you really need it, you can always add it to the U-Boot bootargs variable.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
