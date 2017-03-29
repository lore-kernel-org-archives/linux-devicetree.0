From: "M'boumba Cedric Madianga" <cedric.madianga@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Document the STM32 MDMA bindings
Date: Wed, 29 Mar 2017 10:07:51 +0200
Message-ID: <CAOAejn2zkVDBPwxvid32TPt-cParDkxFMd+uqr+tnRxbHMj7LA@mail.gmail.com>
References: <1489417599-31308-1-git-send-email-cedric.madianga@gmail.com>
 <1489417599-31308-2-git-send-email-cedric.madianga@gmail.com>
 <20170320215250.wwhq6lzwe45jmwks@rob-hp-laptop>
 <CAOAejn10dPjYTj8vBTDj5bc_RPTmkYC7uuBMPnP-R0BsQiRwhw@mail.gmail.com>
 <CAL_JsqLMn7W=r+JRX51zOScs9N04PcTtX8EFy2eacwadCxwaRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqLMn7W=r+JRX51zOScs9N04PcTtX8EFy2eacwadCxwaRg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> stm32 is not a specific SoC. Compatible strings should be specific to
> an SoC (with fallback strings to whatever they are compatible with) so
> you can handle SoC specific differences or errata.

Ok I see. I will add a more specific SoC description in my compatible.
Thanks.


> I still don't understand. Is the difference in DMA addresses vs. CPU
> addresses? If so, you should dma-ranges to translate these.

Not really.
In fact, the MDMA controller provides a master AXI interface for
memories like DDR/SRAM and peripheral registers access (system access
port).
It also provides a master AHB interface only for Cortex-M7 TCM memory
access (TCM access port).
So the goal of this st,ahb-addr-masks property is to list all TCM
addresses avalaible in the SoC, in order to correctly configure the
MDMA as an AHB master in that particular case.
For all other cases (other memories or peripheral registers access),
the MDMA will act as AXI master.

Hope it helps to understand.

BR,
Cedric
