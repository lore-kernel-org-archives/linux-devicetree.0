From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re-using sun5i-a13.dtsi for the r8 ?
Date: Fri, 21 Aug 2015 09:53:07 +0200
Message-ID: <55D6D8E3.3020403@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

I just realized that I never answered your question about the need
for a tvencoder simplefb node in sun5i-a13.dtsi, like the one from
the "ARM: dts: sun5i: Add simplefb node for tvencoder output"

I think the real question is do we want to use sun5i-a13.dtsi for
the r8 ?

I would expect us to use a sun5i-r8.dtsi, this one could then
include sun5i-a13.dtsi, and have the extra simplefb node for
the tvencoder. Putting the simplefb node for the tvencoder
in sun5i-a13.dtsi feels wrong because the A13 package does
not have a tvout pin.

Does that sound like a good solution to you ?

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
