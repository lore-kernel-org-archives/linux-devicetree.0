From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: display: stm32: add supply property to DSI controller
Date: Sat, 06 Apr 2019 01:06:58 -0500
Message-ID: <5ca84204.1c69fb81.1c8ee.7f46@mx.google.com>
References: <1554279389-27377-1-git-send-email-yannick.fertre@st.com> <1554279389-27377-2-git-send-email-yannick.fertre@st.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554279389-27377-2-git-send-email-yannick.fertre@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 3 Apr 2019 10:16:25 +0200, =?UTF-8?q?Yannick=20Fertr=C3=A9?= wrote:
> This patch adds documentation of a new property phy-dsi-supply to the
> STM32 DSI controller.
> 
> Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
