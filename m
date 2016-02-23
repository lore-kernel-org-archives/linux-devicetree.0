From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/3] dt/bindings: Add PIC32 clock binding documentation
Date: Tue, 23 Feb 2016 14:47:02 -0600
Message-ID: <20160223204702.GA22594@rob-hp-laptop>
References: <1455899179-14097-1-git-send-email-joshua.henderson@microchip.com>
 <1455899179-14097-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455899179-14097-2-git-send-email-joshua.henderson@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org, Purna Chandra Mandal <purna.mandal@microchip.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 19, 2016 at 09:25:34AM -0700, Joshua Henderson wrote:
> From: Purna Chandra Mandal <purna.mandal@microchip.com>
> 
> Document the devicetree bindings for the clock driver found on Microchip
> PIC32 class devices.
> 
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---
> Note: Please pull this complete series through the MIPS tree.
> 
> Changes since v6:
> 	- Update Microchip PIC32 clock binding document based on review
> 	- Add header defining clocks
> Changes since v5: None
> Changes since v4: None
> Changes since v3: None
> Changes since v2:
> 	- Force lowercase in PIC32 clock binding documentation
> Changes since v1: None
> ---
>  .../devicetree/bindings/clock/microchip,pic32.txt  |   39 ++++++++++++++++++
>  include/dt-bindings/clock/microchip,pic32-clock.h  |   42 ++++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,pic32.txt
>  create mode 100644 include/dt-bindings/clock/microchip,pic32-clock.h

Acked-by: Rob Herring <robh@kernel.org>
