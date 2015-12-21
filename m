From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: vf-colibri: split PWM pinctrl
Date: Mon, 21 Dec 2015 21:46:40 +0800
Message-ID: <20151221134541.GD18410@tiger>
References: <1449094307-6011-1-git-send-email-stefan@agner.ch>
 <20151214021801.GA25756@tiger>
 <86e283b5c7ed5f54ef25c9ff7e747834@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <86e283b5c7ed5f54ef25c9ff7e747834-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 13, 2015 at 06:53:35PM -0800, Stefan Agner wrote:
> On 2015-12-13 18:18, Shawn Guo wrote:
> > On Wed, Dec 02, 2015 at 02:11:46PM -0800, Stefan Agner wrote:
> >> Split PWM pins into separate pinctrl nodes to allow overrides which
> >> select pins individually. This is useful for carrier boards which use
> >> only one pin for PWM and would like to use the other pin for a
> >> different purpose.
> >>
> >> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/vf-colibri.dtsi | 18 ++++++++++++++----
> >>  1 file changed, 14 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
> >> index e5949b9..924b660 100644
> >> --- a/arch/arm/boot/dts/vf-colibri.dtsi
> >> +++ b/arch/arm/boot/dts/vf-colibri.dtsi
> >> @@ -74,12 +74,12 @@
> >>
> >>  &pwm0 {
> >>  	pinctrl-names = "default";
> >> -	pinctrl-0 = <&pinctrl_pwm0>;
> >> +	pinctrl-0 = <&pinctrl_pwm0_a &pinctrl_pwm0_c>;
> >>  };
> >>
> >>  &pwm1 {
> >>  	pinctrl-names = "default";
> >> -	pinctrl-0 = <&pinctrl_pwm1>;
> >> +	pinctrl-0 = <&pinctrl_pwm1_b &pinctrl_pwm1_d>;
> >>  };
> > 
> > It may make more sense to define these pwm nodes in the final board
> > level dts with only defining the pins that are actually used on the
> > board.
> 
> Well, if we follow that policy, we would have to remove almost anything
> from the -colibri.dtsi device trees...
> 
> The Colibri standard defines standard functionality, which is kept
> compatible across modules with different SoC's. However, on almost all
> pins different functionality is available, and we have some customer
> which make use that....
> 
> So far we followed the policy that we define the pin/device
> configuration of the standard functionality in the -colibri.dtsi files
> (since this is the most used functionality). This allows us to also
> "bug-fix" standard functionality without having to touch customers
> (often out-of-tree) device trees.
> 
> This change is not different from that approach, it merely splits the
> pin configuration in two individual pinctrl nodes. This makes sense for
> PWM signals since they can be used individually (compared to, lets say,
> I2C, where it is more like "all or nothing")...  It turned out that
> several customers used PWM<A> for the display back light, while using
> PWM<C> in a different function, therefor that change.

Okay, sounds reasonable.  But please be consistent on the naming.  I
would expect the pin groups named in scheme
pinctrl_<device><0,1,2...>_<a,b,c...>.  That said, in this case of pwm,
they should be something like below.

 - pinctrl_pwm0_a
 - pinctrl_pwm0_b
 - pinctrl_pwm1_a
 - pinctrl_pwm1_b

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
