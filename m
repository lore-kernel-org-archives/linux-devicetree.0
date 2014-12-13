From: Silvio Fricke <silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] removing of some unused/unsupported dts entries
Date: Sat, 13 Dec 2014 02:46:45 +0100
Message-ID: <cover.1418434448.git.silvio.fricke@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Silvio Fricke <silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I have found some dts entries which are not evaluated by the drivers. This
patch remove this entries from the dts files.
Jason has mentioned I should CC: Thomas, Marc and him self to this mails.

thanks and best regards,
Silvio


Silvio Fricke (3):
  ARM: mx5: dts: remove unused irq-trigger entry
  ARM: tegra: dts: remove unused irq-trigger entry
  ARM: SPEAr: dts: remove unused irq-trigger, id and block entries

 arch/arm/boot/dts/imx53-m53.dtsi      | 1 -
 arch/arm/boot/dts/spear1310-evb.dts   | 1 -
 arch/arm/boot/dts/spear1340-evb.dts   | 2 --
 arch/arm/boot/dts/spear320-hmi.dts    | 3 ---
 arch/arm/boot/dts/tegra30-apalis.dtsi | 1 -
 5 files changed, 8 deletions(-)

-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
