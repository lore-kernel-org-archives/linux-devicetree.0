From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: perf: stm32: ddrperfm support
Date: Thu, 13 Jun 2019 17:04:42 -0600
Message-ID: <20190613230442.GA7783@bogus>
References: <1558366019-24214-1-git-send-email-gerald.baeza@st.com>
 <1558366019-24214-3-git-send-email-gerald.baeza@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558366019-24214-3-git-send-email-gerald.baeza@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerald BAEZA <gerald.baeza@st.com>
Cc: "will.deacon@arm.com" <will.deacon@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net" <olof@lixom.net>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "arnd@arndb.de" <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>"linux-doc@vger.kernel.org" <li>
List-Id: devicetree@vger.kernel.org

On Mon, 20 May 2019 15:27:16 +0000, Gerald BAEZA wrote:
> The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1 SOC.
> 
> This documentation indicates how to enable stm32-ddr-pmu driver on
> DDRPERFM peripheral, via the device tree.
> 
> Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
> ---
>  .../devicetree/bindings/perf/stm32-ddr-pmu.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-pmu.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
