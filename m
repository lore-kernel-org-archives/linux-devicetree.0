From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 01/14] dt/bindings: Add bindings for PIC32 interrupt
 controller
Date: Sat, 16 Jan 2016 21:57:11 -0600
Message-ID: <20160117035711.GA26226@rob-hp-laptop>
References: <1452734299-460-1-git-send-email-joshua.henderson@microchip.com>
 <1452734299-460-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1452734299-460-2-git-send-email-joshua.henderson@microchip.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org, Cristian Birsan <cristian.birsan@microchip.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 13, 2016 at 06:15:34PM -0700, Joshua Henderson wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> Document the devicetree bindings for the interrupt controller on
> Microchip PIC32 class devices.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
> Changes since v4:
> 	- Add new microchip,external-interrupts property
> 	- Provide a better description of some of the features
> 	- Clean up formatting
> Changes since v3: None
> Changes since v2: None
> Changes since v1:
> 	- Remove hardware interrupt priorities from interrupt controller DT
> 	  bindings.
> ---
>  .../interrupt-controller/microchip,pic32-evic.txt  |   67 ++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32-evic.txt

Acked-by: Rob Herring <robh@kernel.org>
