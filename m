From: Nikolay Borisov <Nikolay.Borisov-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH RESEND 0/2] Add generic GIC compat strings
Date: Wed, 21 May 2014 14:48:03 +0100
Message-ID: <1400680085-10430-1-git-send-email-Nikolay.Borisov@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently the GIC (in drivers/irqchip/irq-gic.c) is referred to with
implementation-specific strings (e.g. "arm.cortex-a9-gic"), which is a
little unwieldy due to the number of different CPUs we now have with GIC
support.

These 2 patches add the generic arm,gic-v[1,2] compat strings and also chan=
ge
the respective documentation.

Nikolay Borisov (2):
  irqchip: Add generic gic-v1/gic-v2 compat strings.
  documentation/devicetree: Update GIC compat strings

 Documentation/devicetree/bindings/arm/gic.txt | 2 ++
 drivers/irqchip/irq-gic.c                     | 2 ++
 2 files changed, 4 insertions(+)

--=20
1.8.1.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
