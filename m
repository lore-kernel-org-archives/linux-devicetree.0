From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [linux-sunxi][PATCH v2 0/5] Add tested digital audio blocks to A64
Date: Mon, 29 Jan 2018 10:18:58 +0100
Message-ID: <20180129091903.12319-1-codekipper@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi All,

this patch series adds the digital audio blocks to the A64 SoC. No block
changes are necessary.

BR,
CK

---
v2 changes compared to v1 are:
- Added SoC specific compatiables
- moved spdif default pins to dtsi
- Added i2s2 block for HDMI as it has now been tested.
---
Marcus Cooper (5):
  arm64: allwinner: a64: Add the SPDIF block and pin
  arm64: allwinner: a64: Add SPDIF to the A64
  arm64: allwinner: a64: Add SPDIF to the Pine64
  arm64: allwinner: a64: Add DAI nodes
  arm64: allwinner: a64: Add DAI node for HDMI

 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |  5 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 81 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
