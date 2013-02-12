From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Devicetree node to turn off LCD when backlight is 'disabled'
Date: Tue, 12 Feb 2013 18:05:43 +0000
Message-ID: <20130212180543.E8D773E10C1@localhost>
References: <1360563905.4130.6.camel@gitbox> <5119F0DC.1010109@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5119F0DC.1010109@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alex Courbot <acourbot@nvidia.com>, Tony Prisk <linux@prisktech.co.nz>
Cc: Devicetree Mailing List <devicetree-discuss@lists.ozlabs.org>, Arm Kernel Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 12 Feb 2013 16:35:56 +0900, Alex Courbot <acourbot@nvidia.com> wrote:
> On 02/11/2013 03:25 PM, Tony Prisk wrote:
> > I was just wondering if the following would be an acceptable way to turn
> > off an lcd backlight when the pwm-backlight driver is set to level 0.
> > The LCD backlight is 'powered' by the gpio.
> >
> > leds {
> > 	compatible = "gpio-leds";
> > 	backlight {
> > 		label = "lcd-power";
> > 		gpios = <&gpio 0 0 0>;  /* bank pin active_low */
> > 		linux,default-trigger = "backlight";
> > 		default-state = "on";
> > 	};
> > };
> 
> This would work... for the most common case of a FB blank event (as 
> gpio-leds will be notified of it and switch your GPIO on/off according 
> to the kind of event). There are a few drawbacks however:
> 
> 1) You will have no control over the order of your power sequence. 
> pwm-backlight also uses FB notifications to switch the PWM on/off. Which 
> one will happen first will depend on the registration order.
> 
> 2) This will only work on FB blank events. For instance, if someone 
> writes "0" into the "brightness" property of your backlight's sysfs 
> node, no FB blank event will be emitted and your GPIO will remain on.
> 
> Also this solution works for the simple case where you control the 
> backlight using only a GPIO. It would be good to support more complex 
> cases as well (I have to handle a GPIO and a regulator, for instance).
> 
> The "correct" way of doing this would be to let the pwm-backlight driver 
> (or even the backlight framework) control the power status of the 
> backlight itself. You can do this using the platform callbacks of 
> pwm-backlight, but this will require a custom panel. Another possibility 
> would be to use the power sequence framework within the backlight 
> drivers, but I need to rewrite it first.

That really does sound like the right approach, and wiring it up to a
GPIO sounds reasonable. I don't think there is a need to use platform
callbacks for this.

g.
