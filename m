From: Leon Woestenberg <leon-1C1Z3qubMcQqDJ6do+/SaQ@public.gmane.org>
Subject: devicetree describing PCIe endpoint peripherals
Date: Fri, 2 Feb 2018 22:46:15 +0100
Message-ID: <CAMjhiJiYAB2xHN3tCyYx_tZqOxyx-nMrc1GAfgY9gBfmg4bdWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello all,

I am interested in devicetree overlay support for anything behind a
PCIe MMIO region, for the case of (reconfigurable) FPGAs.

PCIe itself is a discoverable bus, and the BARs are dynamically
mapped, but the endpoint's MMIO regions, could be treated just like a
SoC's peripheral bus.

For this, I would like the Linux device driver to load a devicetree
overlay or subtree, which then triggers further bindings between
further device drivers(*).

Is the right infrastructure  in place already to support this model?
Or is there functionality lacking in the driver model or of_()
functions?

(*) Thinking of it, I am unsure if a platform device suffices here,
because some notition of PCIe specifics might come into play.

For the partially reconfigurable case, devicetree overlays would match.

Regards,

Leon.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
