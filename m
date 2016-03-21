From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v2 0/5] ARM: sunxi: Add SPDIF playback support
Date: Mon, 21 Mar 2016 17:10:37 +0100
Message-ID: <1458576642-4078-1-git-send-email-codekipper@gmail.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBBN2YC3QKGQENPQGBIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi All,

now that the sun4i-spdif driver has made it into linux-next then this patch
series completes what is needed to have SPDIF working on both A10 and A20
devices.

Enjoy,
CK

---
Changes since v1:
- Added defines to the dma properties and changed reg length to cover the entire
  spdif memory area.

Andrea Venturi (1):
  clk: sunxi: mod1 clock should modify it's parent

Marcus Cooper (4):
  ARM: dts :sunxi: Add SPDIF pins to A10 and A20
  ARM: dts: sunxi: Add the SPDIF to the A10 and A20
  ARM: dts: sun4i: Add SPDIF to the Mele A1000
  ARM: dts: sun7i: Add SPDIF to Itead Ibox

 arch/arm/boot/dts/sun4i-a10-a1000.dts      | 23 +++++++++++++++
 arch/arm/boot/dts/sun4i-a10.dtsi           | 45 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-itead-ibox.dts | 24 ++++++++++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi           | 45 ++++++++++++++++++++++++++++++
 drivers/clk/sunxi/clk-a10-mod1.c           |  2 +-
 5 files changed, 138 insertions(+), 1 deletion(-)

-- 
2.7.4
