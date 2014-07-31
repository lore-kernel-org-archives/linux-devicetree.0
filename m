From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Thu, 31 Jul 2014 21:20:16 +0200
Message-ID: <20140731192016.GA6869@excalibur.cnev.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

I have today read the patch by Hans de Goede to add a dts file
for the "Banana Pi" development board (see
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/276339.=
html)
and have stumbled over the license declaration at the beginning:

> +/*
> + * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * The code contained herein is licensed under the GNU General Publi=
c
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */

The phrase "The code contained herein is licensed under the GNU
General Public License" does not make explicitly clear under
which version(s) of the GPL the code can be used.  From the
following "You may obtain a copy of the GNU General Public
License Version 2 or later at the following locations [...]" one
can deduce that the intention is most probably to license the
code unter GPL2+, but from a legal point of view this information
should be an explicit part of the license statement itself, as
strictly formally speaking the latter statement does only inform
the reader where he can find the text of GPL2 and later GPL
versions, but does not expressly apply them to the code.  This is
of course a rather formalistic view and may well be seen as
beancounting, but I have seen too many cases where formal license
ambiguities have led to problems years later, so I proposed to
Hans to change the wording in his patch to something more
explicit, similar to the dts files for other arm platforms.

A phrasing like used in the GPL appendix ("This program is
free software; you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free
Software Foundation; either version 2 of the License, or (at your
option) any later version") would avoid any ambiguity.

Hans agreed that the current phrasing is not ideal and should
probably be changed to something unabiguous but pointed out that a
similar wording is used in all the other dts files for Allwinner
SOCs (arch/arm/boot/dts/sun?i-a*.dts) and proposed to refer the
issue to you as the Allwinner platform maintainer (with the
linux-arm-kernel and devicetree lists in CC).

Regards,
Karsten
--=20
Gem. Par. 28 Abs. 4 Bundesdatenschutzgesetz widerspreche ich der Nutzun=
g
sowie der Weitergabe meiner personenbezogenen Daten f=C3=BCr Zwecke der
Werbung sowie der Markt- oder Meinungsforschung.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
