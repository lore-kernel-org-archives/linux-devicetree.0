From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/3] of/gpio: Introduce of_put_gpio(), add ref counting
	for OF GPIO chips
Date: Tue, 9 Feb 2010 10:28:15 -0700
Message-ID: <fa686aa41002090928o6911d095ydca1e1e670a0fc22@mail.gmail.com>
References: <20100205204949.GA2575@oksana.dev.rtsoft.ru> <20100205205045.GC4178@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100205205045.GC4178@oksana.dev.rtsoft.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Miller <davem@davemloft.net>, Michal Simek <monstr@monstr.eu>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

On Fri, Feb 5, 2010 at 1:50 PM, Anton Vorontsov
<avorontsov@ru.mvista.com> wrote:
> OF GPIO infrastructure is using dynamic GPIO bases, so it is possible
> that of_get_gpio()'s returned GPIO number will be no longer valid, or
> worse, it may point to an unexpected GPIO controller.
>
> This scenario is possible:
>
> driver A: =A0 =A0 =A0 =A0 =A0 =A0 =A0 driver B: =A0 =A0 =A0 =A0 =A0 =A0=
 =A0driver C:
> --------- =A0 =A0 =A0 =A0 =A0 =A0 =A0 --------- =A0 =A0 =A0 =A0 =A0 =A0=
 =A0---------
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpiochip_add()
> gpio =3D of_get_gpio()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpiochip_remove()
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 gpiochip_add()
> gpio_request(gpio);
> gpio_set_value(gpio);
>
> That is, driver A assumes that it is working with GPIO from driver B,
> but in practice it may disappear and driver C will take its GPIO base
> number, so it will provide the same GPIO numbers.
>
> With this patch that situation is no longer possible. Though drivers
> will need to learn to put GPIOs back, so that GPIO controllers could
> be removed.
>
> Signed-off-by: Anton Vorontsov <avorontsov@ru.mvista.com>

Rather than having a lock at the device tree data pointer level which
mixes usage with potentially many other drivers; wouldn't it make more
sense to use a mutex at the of_gc subsystem context?

g.
