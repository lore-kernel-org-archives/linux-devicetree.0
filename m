From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/6] gpio: Add GPIO driver for Nintendo Wii
Date: Wed, 7 Feb 2018 13:29:45 +0100
Message-ID: <CACRpkdZLiw=e-XiS9cbQuJGJ2tJVV86qKaLCy2yG==FSENhAHw@mail.gmail.com>
References: <20180122050411.32460-1-j.neuschaefer@gmx.net> <20180122050411.32460-4-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180122050411.32460-4-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Albert Herranz <albert_herranz@yahoo.es>, Segher Boessenkool <segher@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 22, 2018 at 6:04 AM, Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The Nintendo Wii's chipset (called "Hollywood") has a GPIO controller
> that supports a configurable number of pins (up to 32), interrupts, and
> some special mechanisms to share the controller between the system's
> security processor (an ARM926) and the PowerPC CPU. Pin multiplexing is
> not supported.
>
> This patch adds a basic driver for this GPIO controller. Interrupt
> support will come in a later patch.
>
> This patch is based on code developed by Albert Herranz and the GameCube
> Linux Team, file arch/powerpc/platforms/embedded6xx/hlwd-gpio.c,
> available at https://github.com/DeltaResero/GC-Wii-Linux-Kernels, but
> has grown quite dissimilar.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Cc: Albert Herranz <albert_herranz@yahoo.es>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> ---
>
> v2:

All looks very good to me, Andy had some additional comments,
once addressed in v3 I will apply this.

You only need to resend this patch as I already applied the DT
bindings.

Yours,
Linus Walleij
