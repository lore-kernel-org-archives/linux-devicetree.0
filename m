From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] devicetree: document NXP LPC1850 PINT irq
 controller binding
Date: Thu, 7 Apr 2016 12:57:12 -0500
Message-ID: <20160407175712.GC32257@rob-hp-laptop>
References: <1459614924-32670-1-git-send-email-manabian@gmail.com>
 <1459614924-32670-3-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1459614924-32670-3-git-send-email-manabian@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: marc.zyngier@arm.com, jason@lakedaemon.net, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 02, 2016 at 06:35:24PM +0200, Joachim Eastwood wrote:
> Add binding documentation for NXP LPC1850 GPIO Pin Interrupt (PINT)
> controller.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---
>  .../interrupt-controller/nxp,lpc1850-gpio-pint.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/nxp,lpc1850-gpio-pint.txt

Acked-by: Rob Herring <robh@kernel.org>
