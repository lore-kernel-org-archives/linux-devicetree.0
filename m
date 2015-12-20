From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] irqchip: add documentation for TS-4800 interrupt
 controller
Date: Sat, 19 Dec 2015 21:37:58 -0600
Message-ID: <20151220033758.GB9883@rob-hp-laptop>
References: <1450467559-21066-1-git-send-email-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450467559-21066-1-git-send-email-damien.riegel@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Damien Riegel <damien.riegel@savoirfairelinux.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, kernel@savoirfairelinux.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 18, 2015 at 02:39:18PM -0500, Damien Riegel wrote:
> This is an interrupt-controller implemented in an FPGA, to multiplex
> interrupts generated from other IPs. The FPGA usually uses a GPIO as a
> parent interrupt controller to notify that one of the multiplexed
> interrupts has triggered.
> 
> Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
> ---
>  .../bindings/interrupt-controller/technologic,ts4800.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/technologic,ts4800.txt

Acked-by: Rob Herring <robh@kernel.org>
