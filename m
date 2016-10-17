From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/13] Revamp Semtech SX150x driver
Date: Mon, 17 Oct 2016 07:26:55 -0700
Message-ID: <1476714428-11264-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cphealy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

I am working with a hardware design utilizing SX1506 GPIO expander
(actually it uses 1503, but they seem to be the same from SW's point
of view) and following are the pathches I had to make in order to be
able to succesfully use part's driver from upstream kernel.

I am pretty certain I did not do any of the DT bindings in a proper
way, so I am more than happy to change all of that, or, due to the
fact I don't use any of those bindings in my usecase, drop them
alltogether.

Thank you,
Andrey Smirnov

Andrey Smirnov (13):
  gpio-sx150x: Remove 'gpio_base' from pdata
  gpio-sx150x: Remove 'irq_summary' parameter
  gpio-sx150x: Remove 'irq_base' parameter
  gpio-sx150x: Replace 'io_polarity' with DT binding
  bindings: gpio-sx150x: Document "semtech,io-polarity" binding
  gpio-sx150x: Replace "io_pull*_ena" with DT bindings
  bindings: gpio-sx150x: Document "semtech,io-pull*" bindings
  gpio-sx150x: Replace 'reset_during_probe" with DT binding
  bindings: gpio-sx150x: Document "semtech,reset-during-probe" bindings
  gpio-sx150x: Replace 'oscio_is_gpio' with DT binding
  bindings: gpio-sx150x: Document "semtech,oscio-is-gpo" binding
  gpio-sx150x: Remove struct sx150x_platform_data
  gpio-sx150x: Pass device type in DT match table

 .../devicetree/bindings/gpio/gpio-sx150x.txt       |  29 ++++
 drivers/gpio/gpio-sx150x.c                         | 184 +++++++++------------
 2 files changed, 105 insertions(+), 108 deletions(-)

-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
