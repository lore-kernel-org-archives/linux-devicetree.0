From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH] ARM: dts: armada-385-synology-ds116: add support for
 Synology DS116 NAS
Date: Sun, 12 Feb 2017 01:53:50 +0100
Message-ID: <20170212005350.GA18612@1wt.eu>
References: <1486805073-15534-1-git-send-email-w@1wt.eu>
 <20170212004031.GA7328@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170212004031.GA7328@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Arnaud Ebalard <arno@natisbad.org>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Sun, Feb 12, 2017 at 01:40:31AM +0100, Andrew Lunn wrote:
> > +			serial@12000 {
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&uart0_pins>;
> > +				status = "okay";
> > +			};
> > +
> > +			serial@12100 {
> > +				/* A PIC16F1829 is connected to uart1 at 115200 bps,
> > +				 * and takes single-character orders :
> > +				 *   "1" : power off
> 
> Hi Willy
> 
> The qnap-poweroff.c driver will support this. You need a new
> compatible string, since 115200 is not the speed the current synology
> devices use.

But won't that squat the I/O address and prevent me from using all the
other codes via the regular serial port ? They are particularly convenient
in fact since they are the only way to access the LEDs, beeper and even
to trigger a reset (even if this last one is less used in software form).

> > +				 *   "2" : short beep
> > +				 *   "3" : long beep
> > +				 *   "4" : turn the power LED ON
> > +				 *   "5" : flash the power LED
> > +				 *   "6" : turn the power LED OFF
> > +				 *   "7" : turn the status LED OFF
> > +				 *   "8" : turn the status LED ON
> > +				 *   "9" : flash the status LED
> > +				 *   "A" : flash the motherboard LED (D8)
> > +				 *   "B" : turn the motherboard LED OFF
> > +				 *   "C" : hard reset
> > +				 */
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&uart1_pins>;
> > +				status = "okay";
> > +			};
> 
> > +		gpio-leds {
> > +			compatible = "gpio-leds";
> > +
> > +			/* The greed part is on gpio0.20 which is also used by
> 
> green?

Oops, sorry, thanks for catching.

Willy
