From: Tony Prisk <linux@prisktech.co.nz>
Subject: Devicetree node to turn off LCD when backlight is 'disabled'
Date: Mon, 11 Feb 2013 19:25:05 +1300
Message-ID: <1360563905.4130.6.camel@gitbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arm Kernel Mailing List <linux-arm-kernel@lists.infradead.org>, Devicetree Mailing List <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

I was just wondering if the following would be an acceptable way to turn
off an lcd backlight when the pwm-backlight driver is set to level 0.
The LCD backlight is 'powered' by the gpio.

leds {
	compatible = "gpio-leds";
	backlight {
		label = "lcd-power";
		gpios = <&gpio 0 0 0>;  /* bank pin active_low */
		linux,default-trigger = "backlight";
		default-state = "on";
	};
};

The method has been tested by an end-user and confirmed as working - I
just wanted to check whether it is the 'accepted' way of doing it.

Regards
Tony Prisk
