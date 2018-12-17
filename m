From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: mtd: stm32_fmc2: add STM32 FMC2 NAND
 controller documentation
Date: Mon, 17 Dec 2018 15:26:50 -0600
Message-ID: <20181217212650.GA20603@bogus>
References: <1544781488-18723-1-git-send-email-christophe.kerello@st.com>
 <1544781488-18723-2-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544781488-18723-2-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Kerello <christophe.kerello@st.com>
Cc: boris.brezillon@bootlin.com, miquel.raynal@bootlin.com, richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 14, 2018 at 10:58:06AM +0100, Christophe Kerello wrote:
> This patch adds the documentation of the device tree bindings for the STM32
> FMC2 NAND controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-fmc2-nand.txt    | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt

Please add acks/reviewed-bys when posting new versions.

Rob
