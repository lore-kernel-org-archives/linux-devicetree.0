From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for PIC32 deadman timer
 peripheral
Date: Mon, 8 Feb 2016 10:07:26 -0600
Message-ID: <20160208160726.GA17302@rob-hp-laptop>
References: <1454371348-25104-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454371348-25104-1-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 01, 2016 at 05:02:23PM -0700, Joshua Henderson wrote:
> From: Purna Chandra Mandal <purna.mandal@microchip.com>
> 
> Document the devicetree bindings for the deadman timer peripheral found on
> Microchip PIC32 SoC class devices.
> 
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: <linux-mips@linux-mips.org>
> ---
> Note: Please merge this patch series through the MIPS tree.
> ---
>  .../bindings/watchdog/microchip,pic32-dmt.txt      |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt

Other than the node name comment:

Acked-by: Rob Herring <robh@kernel.org>
