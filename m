From: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: DT bindings for interrupt outputs that aren't wired up to an
 interrupt controller
Date: Tue, 07 Feb 2017 18:58:33 +0000
Message-ID: <1486493913.2863.7.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi

I'm wondering how to handle the case where the outputs from a device
that generates interrupts are not all wired to an interrupt controller,
and also where different systems wire up different interrupts.

E.g. a datasheet says device generates 3 interrupts A, B and C, but one
system using the device doesn't connect up B and another doesn't connect
up C.

>From what I can see, device-tree bindings for a device will tend to list
rigid length and order for the contents of 'interrupt' and 'interrupt-
names' properties, but what happens if one of them isn't wired up in
hardware? Is there such a thing as a null interrupt specifier to put in
the list?

One solution, for devices without bindings yet is to specify interrupts
as optional but require interrupt-names for those that are present so OS
drivers can match the correct interrupt functions to the interrupt
specifiers. E.g for my two example systems

  interrupts = <10>, <11>;
  interrupt-names = "A", "C">;

  interrupts = <10>, <11>;
  interrupt-names = "A", "B";

Is such an approach acceptable?

I've searched quite a bit existing practice in this area but have come
up blank.

Thanks for any help.

-- 
Tixy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
