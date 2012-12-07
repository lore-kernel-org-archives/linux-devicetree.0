From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] leds: leds-pwm: Add device tree bindings
Date: Fri, 07 Dec 2012 13:34:53 +0000
Message-ID: <20121207133453.800C43E0B87@localhost>
References: <1352731270-27534-1-git-send-email-peter.ujfalusi@ti.com>
 <1352731270-27534-4-git-send-email-peter.ujfalusi@ti.com>
 <20121206100052.EC8293E0E22@localhost> <50C0913B.9070802@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50C0913B.9070802-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 6 Dec 2012 13:36:11 +0100, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org> wrote:
> Hi Grant,
> 
> On 12/06/2012 11:00 AM, Grant Likely wrote:
> > On Mon, 12 Nov 2012 15:41:10 +0100, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org> wrote:
> >> Support for device tree booted kernel.
> >> When the kernel is booted with DeviceTree blob we support one led per
> >> leds-pwm device to have cleaner integration with the PWM subsystem.
> >>
> >> For usage see:
> >> Documentation/devicetree/bindings/leds/leds-pwm.txt
> >>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/leds/leds-pwm.txt          |  34 ++++++
> >>  drivers/leds/leds-pwm.c                            | 125 +++++++++++++++------
> >>  2 files changed, 127 insertions(+), 32 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> >> new file mode 100644
> >> index 0000000..9fe3040
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
> >> @@ -0,0 +1,34 @@
> >> +LED connected to PWM
> >> +
> >> +Required properties:
> >> +- compatible : should be "pwm-leds".
> >> +- pwms : PWM property, please refer to: 
> >> +  Documentation/devicetree/bindings/pwm/pwm.txt
> >> +- pwm-names : (optional) Name to be used by the PWM subsystem for the PWM device
> >> +- label : (optional) The label for this LED.  If omitted, the label is
> >> +  taken from the node name (excluding the unit address).
> >> +- max-brightness : Maximum brightness possible for the LED
> >> +- linux,default-trigger :  (optional) This parameter, if present, is a
> >> +  string defining the trigger assigned to the LED.  Current triggers are:
> >> +    "backlight" - LED will act as a back-light, controlled by the framebuffer
> >> +		  system
> >> +    "default-on" - LED will turn on, but see "default-state" below
> >> +    "heartbeat" - LED "double" flashes at a load average based rate
> >> +    "ide-disk" - LED indicates disk activity
> >> +    "timer" - LED flashes at a fixed, configurable rate
> > 
> > The binding mostly looks good. However, it seems to be gratuitously
> > different from the gpio-leds binding and it duplicates property
> > definitions. Please match the gpio-leds behaviour with each led defined
> > as a sub node of the pwm-leds node.
> 
> The GPIO and PWM bindings are substantially different. For start in pwm we do
> not have of_get_pwm* helpers. To get the PWM itself we need to use wpm_get()

That's just the implementation. I'm talking about the binding. :-)

Implementation should follow binding design, not the other way around.
Both bindings use the same pattern. There isn't a of_get_pwm helper now,
but there is nothing preventing one from being created if you need it.

in the controller:
	#gpio-cells  vs. #pwm-cells
in the user:
	gpios = <[gpio specifier]> vs. pwms = <pwm specifier>

The PWM binding states that pwm-names is optional.

> which uses the pwms = <>; pwm-names = <>; properties on the device's main node.
> This is what I could do at the moment:
> 
> twl_pwm: pwm {
> 	compatible = "ti,twl4030-pwm";
> 	#pwm-cells = <2>;
> };
> 
> twl_led: pwmled {
> 	compatible = "ti,twl4030-pwmled";
> 	#pwm-cells = <2>;
> };
> 
> pwmleds {
> 	compatible = "pwm-leds";
> 	pwms = <&twl_pwm 0 7812500
> 		&twl_pwmled 0 7812500>;
> 	pwm-names = "omap4::keypad",
> 		    "omap4:green:chrg";
> 	kpad {
> 		label = "omap4::keypad";
> 		max-brightness = <127>;
> 	};
> 
> 	charging {
> 		label = "omap4:green:chrg";
> 		max-brightness = <255>;
> 	};

That's just a goofy extra layer of indirection and still doesn't follow
the lead of the gpio-leds pattern. That makes it worse that your
original binding, not better.

It really needs to look like this:

pwmleds {
	compatible = "pwm-leds";
	kpad {
		label = "omap4::keypad";
		max-brightness = <127>;
		pwms = <&twl_pwm 0 7812500>;
	};
	charging {
		label = "omap4:green:chrg";
		max-brightness = <255>;
		pwms = <&twl_pwmled 0 7812500>;
	};
};

g.
