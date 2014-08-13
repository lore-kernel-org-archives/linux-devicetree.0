From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] ARM: l2c: cache size parsing through device tree
Date: Wed, 13 Aug 2014 16:29:28 -0700
Message-ID: <1407972571-8986-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series adds support for specifying the L2 cache size through Device
Tree using the ePAPR standard 'cache-size' and 'cache-sets' properties.

The rationale behind these patches is to support Broadcom's BCM63138 DSL SoC
which comes out of reset with an invalid cache way-size specified in its L2C
auxiliary register.

For the third patch I took the approach of a helper function that can be called
by the 3 different of_parse functions that we have currently.

Thanks!

Florian Fainelli (3):
  ARM: l2c: enforce use of cache-level property
  ARM: l2c: order optional properties in alphabetical order
  ARM: l2c: parse 'cache-size' and 'cache-sets' properties

 Documentation/devicetree/bindings/arm/l2cc.txt |  4 +-
 arch/arm/mm/cache-l2x0.c                       | 68 ++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 1 deletion(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
