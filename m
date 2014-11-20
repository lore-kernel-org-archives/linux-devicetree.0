From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 00/22] Multiplatform BMIPS kernel
Date: Thu, 20 Nov 2014 10:09:02 -0800
Message-ID: <546E2E3E.5040305@gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com> <20141120030434.GE24364@ld-irv-0074> <CAJiQ=7C8h-MAuRdgzZqx2=bg8bvy7v9pv7e7tGXWmA9ghYJiqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJiQ=7C8h-MAuRdgzZqx2=bg8bvy7v9pv7e7tGXWmA9ghYJiqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/19/2014 07:55 PM, Kevin Cernekee wrote:
> On Wed, Nov 19, 2014 at 7:04 PM, Brian Norris
> <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Sat, Nov 15, 2014 at 04:17:24PM -0800, Kevin Cernekee wrote:
>>> The lack of a reboot handler is annoying; syscon-reboot probably won't work
>>> on STB (because it requires two writes).
>>
>> Can't you reuse drivers/power/reset/brcmstb-reboot.c ?
> 
> Oops, I ran a quick check earlier by grepping for "sun-top-ctrl" and
> looking under drivers/reset, but assumed this driver wasn't merged yet
> when nothing came up in the code.  Thanks for the pointer.
> 
> It looks like the current driver will work for 40nm, but 65nm uses
> different bit positions: RESET_CTRL bit 3 to arm, and SW_RESET bit 31
> to trigger.  I'll add a new "brcm,brcmstb-reboot-65nm" compatible
> string to make this work.
> 
> Also, we'll need to take Guenter Roeck's register_restart_handler()
> patch in order to build on MIPS.

Slightly unrelated, did you also try to use drivers/bus/brcmstb_gisb.c
on these MIPS platforms?

Its usefulness is probably lower on MIPS since we typically get accurate
bus errors to be decoded by the CPU and printed through the exception
handler, but I'd be curious if it works just fine as well.

Thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
