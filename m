From: Linus Walleij <linus.walleij@linaro.org>
Subject: GPIO character device next steps
Date: Fri, 8 Apr 2016 20:32:31 +0200
Message-ID: <CACRpkdYDjN8R60hhhu4RK9LF2cChOkA98pgvy2TzG9MAT1qGRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lee Campbell <leecam@google.com>, Amit Kucheria <amit.kucheria@linaro.org>, Markus Pargmann <mpa@pengutronix.de>, Michael Welling <mwelling@ieee.org>
List-Id: devicetree@vger.kernel.org

As you know we froze the GPIO sysfs ABI in kernel v4.6 and
now we need to complete its replacement with a new mechanism
using the character device.

We can currently:

- Enumerate gpiochips - udev/systemd and its siblings
  will do this automatically from the character devices
  (a patch for mdev will be needed for BusyBox to enumerate
  the chips).

- List its lines with name and consumer strings, that is what
  "lsgpio" from tools/gpio/lsgpio.c does.

- Locate the offset of any desired GPIO line from this string

- Locate the gpiochip in the bus topology using sysfs
  (as with any device)

So I need some help, rants, ACKs etc on whatever I come up
with next, and the next steps are (from the top of my head):

- Naming GPIO lines from DT files
  (So you have something reasonable to look for from userspace)
  What do people think about just using
  gpio-names = "foo", "bar", "baz"; as suggested by Rob Herring?

- Getting a filehandle for one or several GPIOs
  I would prefer to support getting multiple GPIOs from day one
  as we know this is going to be a usecase sooner or later.
  For example it is not uncommon to bitbang a bus from userspace
  and then clock and data lines should

- Give them consumer names from userspace (label who's
  using this GPIO)

- Setting flags on a line from userspace (such as ACTIVE_LOW
  or OPEN_DRAIN) so the hardware can act accordingly.

- Using this filehandle, shake the lines from low to high and vice
  versa from userspace.

- Getting a filehandle to listen to input events (interrupts) from a
  certain GPIO line. Here I am primarily thinking about something
  akin to IIO's event mechanism using poll() which I like a lot.

- Getting the filehandle for events involves selecting trigger type
  for rising/falling edge events. (I don't see how userspace could
  possibly support or want to support level IRQs.)

I am thinking about using filehandles to get a grip on (multiple)
GPIOs and for events because it has the nice property that we
know very well when userspace is using the resource, and we can
free it when the file is closed (which also happens if the application
crashes or get killed, or at shutdown etc).

I'm thinking about staying with a single open() on the chardev
from userspace, but several processes can open handles, then
we need to use an ioctl() to say what we want from this
filehandle: whether a handle on a few GPIO lines or a polled
event.

We want to be mutually exclusive to processes when getting
pins for output, while making it possible for several clients
to read the same line or subscribe to events from the same
line.

Your thoughts?

Yours,
Linus Walleij
