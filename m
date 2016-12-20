From: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/3] Enable SPDIF on the Mele I7
Date: Tue, 20 Dec 2016 11:40:35 +0100
Message-ID: <20161220104038.22532-1-codekipper@gmail.com>
Reply-To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCHNXO4F7MHBBKEV4TBAKGQEMRJV34Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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
here is the patch set required to enable SPDIF on the Mele I7 which is
a A31 based TV-box. To get this working a fix has to be applied to the
clock driver and this will be pushed seperately.

For now the dtsi changes can be applied and when the clk change is
merged then we can finialise this push by applying the I7 patch.
BR,
CK

Marcus Cooper (3):
  ARM: dts: sun6i: Add SPDIF TX pin to the A31
  ARM: dts: sun6i: Add the SPDIF block to the A31
  ARM: dts: sun6i: Add SPDIF to the Mele I7

 arch/arm/boot/dts/sun6i-a31-i7.dts | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/sun6i-a31.dtsi   | 19 +++++++++++++++++++
 2 files changed, 43 insertions(+)

-- 
2.11.0
