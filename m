From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: next/master build: 214 builds: 26 failed, 188 passed, 28 errors,
 6333 warnings (next-20171107)
Date: Tue, 7 Nov 2017 16:21:19 +0100
Message-ID: <CACRpkdZLggJA_qcRSJv4tndHDU4SG6HhP1U8uJpiKn=gBpAneA@mail.gmail.com>
References: <5a0159b6.08bc500a.ebe4b.25c6@mx.google.com> <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3QKkGv6eSjX7wH6LpOY0-1XUPFoX0ntog5-ZSHPab6iA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "kernelci.org bot" <bot@kernelci.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, David Daney <david.daney@cavium.com>, Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 7, 2017 at 1:15 PM, Arnd Bergmann <arnd@arndb.de> wrote:

>> 2 arch/arm/mach-footbridge/dc21285.c:145:2: error: expected ';' before 'else'
>
> A harmless rework that Linus Walleij did apparently uncovered an
> ancient bug. I'm
> waiting for Linus to suggest a fix.

In footbridge? Oh my. I just sent a fix for an ancient bug in the
mach-sa1100 simpad.c
boardfile. Isn't that what you're referring to?

(I intended to CC you but git send-email doesn't pick up Reported-by..
I'll forward.)


Yours,
Linus Walleij
