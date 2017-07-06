From: Miodrag Dinic <Miodrag.Dinic@imgtec.com>
Subject: RE: [PATCH v2 03/10] Documentation: Add device tree binding for
 Goldfish PIC driver
Date: Thu, 6 Jul 2017 13:21:10 +0000
Message-ID: <232DDC0A2B605E4F9E85F6904417885F015D929D24@BADAG02.ba.imgtec.org>
References: <1498664922-28493-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1498664922-28493-4-git-send-email-aleksandar.markovic@rt-rk.com>,<CAL_JsqJHN90TbOtcvr8CjLqpy9zokzKX1UgoRu+j=uH37-Xi6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJHN90TbOtcvr8CjLqpy9zokzKX1UgoRu+j=uH37-Xi6A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>, Goran Ferenc <Goran.Ferenc@imgtec.com>, "David S. Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Douglas Leung <Douglas.Leung@imgtec.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hogan <James.Hogan@imgtec.com>, Jason Cooper <jason@lakedaemon.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Burton <Paul.Burton@imgtec.com>, Petar Jovanovic <Petar.Jovanovic@imgtec.com>, Raghu Gandham <Raghu.Gandham@imgtec.com>, Th
List-Id: devicetree@vger.kernel.org

cc-ing Jin Quian (maintains kernel repo for emulators), Bo Hu & Lingfeng Yang from Google

Hi Rob,

thank you for taking the time to review the patches.
Let me try to answer some of your comments and concerns:

> This isn't even supported in Google's common kernel tree. If it's not
> important enough for it, why should it be for mainline kernel?

Goldfish PIC controller driver is used and maintained currently in a
separate kernel repo Google uses for Android emulator support:
[1] https://android.googlesource.com/kernel/goldfish.git

The referenced device also exist and is maintained in the official
Android emulator repo. This device/driver has been successfully
used for the past many years by MIPS for driving interrupts to
other virtual devices which make Android emulation possible.

I'll try to quote Google on their plans and let Jin correct me if I'm wrong.

The idea is to have the emulator support in the Googles common kernel repo for all
architectures and stop maintaining a separate one just for emulation.
Currently there is emulator kernel support in common repo for Intel & ARM platforms,
MIPS emulator support is still maintained in [1].

The effort of mainlining MIPS Ranchu virtual platform is because we want to
eventually have MIPS emulator support in Googles common kernel repo
backported from upstream in some of their next rebases.

Also, having the emulator support in the upstream kernel would help picking up the latest fixes.
In the matter of fact, many fixes for the MIPS kernel came from Android testing in the emulator.

> To put it another way, why does goldfish need a special interrupt
> controller. Just use one of the many that are already supported in the
> kernel and emulated by qemu.

The reason we are using Goldfish PIC for MIPS emulation is because it
is pretty simple Interrupt controller which is easily maintained and
the infrastructure for it in Android emulator is in place and continuously tested.

> Same comments apply to the RTC patch.

Same reasons apply as for Goldfish PIC.

Kind regards,
Miodrag
________________________________________
From: Rob Herring [robh+dt@kernel.org]
Sent: Friday, June 30, 2017 1:17 AM
To: Aleksandar Markovic
Cc: Linux-MIPS; Aleksandar Markovic; Miodrag Dinic; Goran Ferenc; David S. Miller; devicetree@vger.kernel.org; Douglas Leung; Greg Kroah-Hartman; James Hogan; Jason Cooper; linux-kernel@vger.kernel.org; Marc Zyngier; Mark Rutland; Martin K. Petersen; Mauro Carvalho Chehab; Paul Burton; Petar Jovanovic; Raghu Gandham; Thomas Gleixner
Subject: Re: [PATCH v2 03/10] Documentation: Add device tree binding for Goldfish PIC driver

On Wed, Jun 28, 2017 at 10:46 AM, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>
> Add documentation for DT binding of Goldfish PIC driver. The compatible
> string used by OS for binding the driver is "google,goldfish-pic".

This isn't even supported in Google's common kernel tree. If it's not
important enough for it, why should it be for mainline kernel?

To put it another way, why does goldfish need a special interrupt
controller. Just use one of the many that are already supported in the
kernel and emulated by qemu.

Same comments apply to the RTC patch.

Rob
