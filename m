From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: Can one set GPIO direction in pinmux definition?
Date: Wed, 22 Aug 2012 19:17:50 -0500
Message-ID: <CAKGA1b=ko_KBW5KwSLmJ2W1KioZt2s2fuezfrB+oZFcwjC7LGg@mail.gmail.com>
References: <5034FCB2.5040709@grid-net.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5034FCB2.5040709-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
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
To: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 22, 2012 at 10:37 AM, Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org> wrote:
>
> For a MX28 based hardware I am working with I need to use AUART4
>
> I need to configure this AUART4 as uart only when necessary and at all other
> times pins associated with AUART4 need to be configured as inputs.
>
> I am using following DT definitions to setup AUART4 mux  but can't figure
> out how to setup pin direction via DT, can it be done or I need to do it in
> C code?
>
>         apb@80000000 {
>                 apbh@80000000 {
>                                 auart4_pins_a: auart4@0 {
>                                         reg = <0>;
>                                         fsl,pinmux-ids = <
>                                                 0x3142 /*
> MX28_PAD_SAIF0_MCLK__AUART4_CTS */
>                                                 0x3152 /*
> MX28_PAD_SAIF0_LRCLK__AUART4_RTS */
>                                                 0x3162 /*
> MX28_PAD_SAIF0_BITCLK__AUART4_RX */
>                                                 0x3172 /*
> MX28_PAD_SAIF0_SDATA0__AUART4_TX */
>                                         >;
>                                         fsl,drive-strength = <0>;
>                                         fsl,voltage = <1>;
>                                         fsl,pull-up = <0>;
>                                 };
>                                 auart4_highz_pins: auart4-gpio@0 {
>                                         reg = <0>;
>                                         fsl,pinmux-ids = <
>                                                 0x3143 /*
> MX28_PAD_SAIF0_MCLK__GPIO_3_20 */
>                                                 0x3153 /*
> MX28_PAD_SAIF0_LRCLK__GPIO_3_21 */
>                                                 0x3163 /*
> MX28_PAD_SAIF0_BITCLK__GPIO_3_22 */
>                                                 0x3173 /*
> MX28_PAD_SAIF0_SDATA0__GPIO_3_23 */
>                                         >;
>                                         fsl,drive-strength = <0>;
>                                         fsl,voltage = <1>;
>                                         fsl,pull-up = <0>;
>                                 };
>                  };
>           };
>
>                 apbx@80040000 {
>                         auart4: serial@80072000 {
>                                 pinctrl-names = "default", "auart";
>                                 pinctrl-0 = <&auart4_highz_pins>;
>                                 pinctrl-1 = <&auart4_pins_a>;
>                                 status = "okay";
>                         };
>                };

Those pin definitions are defined per-device but they're parsed at
module init - so you'd load uart, then your gpio stuff and your uart
would stop working as it's input paths would have moved in the iomux
controller. Until you unloaded the gpio and uart drivers, then loaded
the right one. I am guessing you don't want to be forcibly loading and
unloading drivers just to swap modes.

Someone did some kind of external bus muxing implementation
("extbus"?) a while back which could sort this out; it's since lost in
time and space, or at least I can't figure out the terms I need to
Google to recover it or how I saved my bookmark. You'd have to
(re-)write the drivers to support the switch (i.e. dynamically parse
pinctrl nodes for the swap or pass them by reference to the muxing
implementation) and stop "working" while the other is in use, but I
feel like I remember that only really supported the case where you had
multiple potential plugin boards at boot (not hotpluggable).

In order to set the directions you'd need to define them in a
driver-specific way, but IMO there needs to be a binding that
configures gpio directions anyway since there's not one currently
which is perplexing - for interrupt-capable GPIO sources it is
implicit through the gpio interrupt domain, but for just inputs you
can read, you have to rely on the bootloader setting it up and your
driver knowing exactly what to do..

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Product Development Analyst, Genesi USA, Inc.
