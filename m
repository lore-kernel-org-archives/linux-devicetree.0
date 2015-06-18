From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/8] of: overlay: Implement indirect target support
Date: Wed, 17 Jun 2015 19:10:13 -0500
Message-ID: <CAL_JsqJgd6=xH_M7+KHc9kPqoJgg_XMi2BWw4MkO1Exma5kqiA@mail.gmail.com>
References: <1434138905-15886-1-git-send-email-pantelis.antoniou@konsulko.com> <1434138905-15886-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434138905-15886-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 12, 2015 at 2:54 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Some applications require applying the same overlay to a different
> target according to some external condition (for instance depending
> on the slot a card has been inserted, the overlay target is different).
>
> The indirect target use requires using the new
> of_overlay_create_indirect() API which uses a text selector.
>
> The format requires the use of a target-indirect node as follows:
>
>         fragment@0 {
>                 target-indirect {
>                         foo { target = <&foo_target>; };
>                         bar { target = <&bar_target>; };
>                 };
>         };

The problem with this is it does not scale. The overlay has to be
changed for every new target. If you had an add-on board (possibly
providing an overlay from an EEPROM), you would not want to have to
rebuild overlays with every new host board. It also only handles
translations of where to apply the overlay, but doesn't provide
translations of phandles within the overlay. Say a node that is a
clock or regulator consumer for example. Or am I missing something.

Grant and I discussed this briefly. I think we need a connector
definition in the base dtb which can provide the target for an
overlay. The connector should provide the translation between
connector local signals/buses and host signals/buses. We need to
define what this translation would look like for each binding.

At least for GPIO, we could have something similar to interrupt-map
properties. For example, to map connector gpio 0 to host gpio 66 and
connector gpio 1 to host gpio 44:

gpio-map = <0 &host-gpio 66>, <1 &host-gpio 44>;

We'd need to define how to handle I2C, SPI, regulators, and clocks
minimally. Perhaps rather than trying to apply nodes into the base
dtb, they should be under the connector and the kernel has to learn to
not just look for child nodes for various bindings. Just thinking
aloud...

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
