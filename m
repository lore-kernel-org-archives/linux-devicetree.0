From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/11] dt/bindings: Correct clk binding example for PIC32
 WDT.
Date: Wed, 18 May 2016 11:52:05 -0500
Message-ID: <20160518165205.GA4407@rob-hp-laptop>
References: <1463461560-9629-1-git-send-email-purna.mandal@microchip.com>
 <1463461560-9629-10-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463461560-9629-10-git-send-email-purna.mandal@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Purna Chandra Mandal <purna.mandal@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Joshua Henderson <joshua.henderson@microchip.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 17, 2016 at 10:35:59AM +0530, Purna Chandra Mandal wrote:
> Update binding example based on new clock binding scheme.
> [1] Documentation/devicetree/bindings/clock/microchip,pic32.txt
> 
> Signed-off-by: Purna Chandra Mandal <purna.mandal@microchip.com>
> ---
> 
>  Documentation/devicetree/bindings/watchdog/microchip,pic32-wdt.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
