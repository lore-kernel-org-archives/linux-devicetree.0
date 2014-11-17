From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH V2 22/22] MIPS: Add multiplatform BMIPS target
Date: Mon, 17 Nov 2014 15:52:15 +0100
Message-ID: <CAOiHx=ky5T7z3T3gX382d=3sw+gGUEfnwXwpcLGa_Oi5YyBwgw@mail.gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
 <50587083.ieLlCR4VrM@wuerfel> <CAJiQ=7C-HniwXiVrqQg3cnFNNYGwoxHJf8JP-XYOqM1yWoyXaw@mail.gmail.com>
 <3480616.V2TMJFc7uE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3480616.V2TMJFc7uE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 17, 2014 at 1:16 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> I still think this is different in the sense that ARM multiplatform
> support is about combining platforms from separate mach-* directories,
> while your approach was to rewrite multiple mach-* directories into
> a single new one that remains separate from the others. While this is
> a great improvement, it doesn't get you any closer to having a
> combined BMIPS+RALINK+JZ4740+ATH79 kernel for instance. I don't know
> if such a kernel is something that anybody wants, or if it's even
> technically possible.
>
> If you wanted to do that however, starting with BMIPS you'd have
> to make it possible to define a new platform without the
> arch/mips/include/asm/mach-bmips/ directory (this should be possible
> already, so the hardest part is done), replace all global function
> calls (arch_init_irq, prom_init, get_system_type,  ...) with generic
> platform-independent implementations or wrappers around per-platform
> callbacks, and move the Kconfig section for CONFIG_BMIPS_MULTIPLATFORM
> outside of the "System type" choice statement.
> Until you do that, your platform isn't "more multipliplatform" than
> the others really, it just abstracts the differences between some
> SoCs nicer than most.

I guess a big blocker for such a real mips multiplatform kernel is
that there is still no defined (standard) interface for passing a
device tree to the kernel from the bootlader on mips, unlike on arm
(at least I'm not aware of any). And unless there is one, having a
multiplatform kernel does not make much sense, as there is no sane way
to tell apart different platforms on boot. But maybe we should just
define a way, and require new platforms to use it ;-)


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
