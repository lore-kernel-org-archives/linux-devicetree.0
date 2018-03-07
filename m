From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: add support for STM32 USB PHY
 Controller (USBPHYC)
Date: Wed, 7 Mar 2018 14:29:06 -0600
Message-ID: <20180307202906.nn2y47f3yzply35s@rob-hp-laptop>
References: <1520002585-13113-1-git-send-email-amelie.delaunay@st.com>
 <1520002585-13113-2-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520002585-13113-2-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 02, 2018 at 03:56:24PM +0100, Amelie Delaunay wrote:
> This patch adds the device tree bindings description for STM32 USBPHYC
> (USB PHY Controller).
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../devicetree/bindings/phy/phy-stm32-usbphyc.txt  | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
