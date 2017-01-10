From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v5 0/2] Support for Axentia TSE-850
Date: Tue, 10 Jan 2017 09:08:50 +0100
Message-ID: <1484035732-31635-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

changes v4 -> v5
- comment from Rob about the memory node made me look closer and
  the memory size is actually updated by the bootloader, and that
  hid the fact that the entry was always faulty. This version
  specifies the correct memory size from the start, which is 64MB.
- ack from Rob

changes v3 -> v4
- rename files arch/arm/boot/dts/axentia-* to .../at91-*
- remove bootargs from at91-tse850-3.dts
- depend on the atmel ssc to register as a sound dai by itself
- bump copyright years

changes v2 -> v3
- document the new compatible strings prefixed with "axentia,".

changes v1 -> v2
- squash the fixup into the correct patch, sorry for the noise.

After finally having all essintial drivers upstreamed I would
like to have the dts and the defconfig also upstreamed.

The atmel-ssc/sound-dai change depends on a change that has been
sitting in the ASoC tree since mid-december, and I have been waiting
for it to hit linux-next before sending this, but it seems to take
longer than I anticipated. So, since I do not want this to in
turn miss the next merge window because of that wait I therefore
request that this is taken now even though it doesn't really work
w/o the ASoC "topic/atmel" branch as of 2016-12-15 [1]. It of course
builds cleanly even w/o those ASoC changes. That effectively means
that noone besides me should notice the inconsistency (I currently
have all affected devices under my control).

Cheers,
peda

[1] http://git.kernel.org/cgit/linux/kernel/git/broonie/sound.git/log/?h=topic/atmel

Peter Rosin (2):
  ARM: dts: at91: add devicetree for the Axentia TSE-850
  ARM: sama5_defconfig: add support for the Axentia TSE-850 board

 Documentation/devicetree/bindings/arm/axentia.txt |  19 ++
 MAINTAINERS                                       |   8 +
 arch/arm/boot/dts/Makefile                        |   1 +
 arch/arm/boot/dts/at91-linea.dtsi                 |  53 +++++
 arch/arm/boot/dts/at91-tse850-3.dts               | 274 ++++++++++++++++++++++
 arch/arm/configs/sama5_defconfig                  |   7 +-
 6 files changed, 361 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/axentia.txt
 create mode 100644 arch/arm/boot/dts/at91-linea.dtsi
 create mode 100644 arch/arm/boot/dts/at91-tse850-3.dts

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
