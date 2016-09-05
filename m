From: James Pettigrew <james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
Subject: [PATCH v4 0/2] ARM: sunxi: Add support for FriendlyARM
 NanoPi NEO SBC
Date: Tue,  6 Sep 2016 08:15:55 +1000
Message-ID: <cover.1473112593.git.james@innovum.com.au>
References: <1472701734-1837-1-git-send-email-james@innovum.com.au>
Reply-To: james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJMVRGPPMIMDXNXXYCRUBF3QXIF6-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1472701734-1837-1-git-send-email-james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, james-Rly9TSIBl47vnOemgxGiVw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes in v2:
	As per Rask's review (thank you):
		Added vendor prefix
		Removed unncessary input.h include
		Fixed underscores and unnecessary unit addresses in node names
		Added GPIO pin comments to led nodes

Changes in v3:
	Fixed syntax errors

Changes in v4:
	Moved change to vendor-prefixes into separate patch

James Pettigrew (2):
  ARM: dts: sun8i: Add dts file for the NanoPi NEO SBC
  devicetree: Add vendor prefix for FriendlyARM

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts          | 125 +++++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-h3-nanopi-neo.dts

-- 
1.9.1
