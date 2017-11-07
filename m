From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
Date: Tue, 7 Nov 2017 17:06:11 +0100
Message-ID: <CAK8P3a2ROugscy=WzxsND+fN-g+MX2znXdxLXxG06bH1uST93A@mail.gmail.com>
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com> <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
 <CACRpkdZLggJA_qcRSJv4tndHDU4SG6HhP1U8uJpiKn=gBpAneA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZLggJA_qcRSJv4tndHDU4SG6HhP1U8uJpiKn=gBpAneA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>, Kernel Build Reports Mailman List <kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Masami Hiramatsu <mhiramat-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 7, 2017 at 4:21 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Nov 7, 2017 at 1:15 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
>>> 2 arch/arm/mach-footbridge/dc21285.c:145:2: error: expected ';' before 'else'
>>
>> A harmless rework that Linus Walleij did apparently uncovered an
>> ancient bug. I'm
>> waiting for Linus to suggest a fix.
>
> In footbridge? Oh my. I just sent a fix for an ancient bug in the
> mach-sa1100 simpad.c
> boardfile. Isn't that what you're referring to?
>
> (I intended to CC you but git send-email doesn't pick up Reported-by..
> I'll forward.)

My mistake, I confused the two output lines. This one is one that I
already fixed,
it came from Kees' timer conversion.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
