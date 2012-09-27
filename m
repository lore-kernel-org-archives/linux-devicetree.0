From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 06/18] tegra: fdt: Add LCD definitions for Tegra
Date: Thu, 27 Sep 2012 12:44:42 -0700
Message-ID: <CAPnjgZ0+MUkvLPpSdnXTLpbM8Z0Hk_mtTRBk3Y75=EPsMPN5BQ@mail.gmail.com>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
 <1342106718-3058-7-git-send-email-sjg@chromium.org>
 <CAPnjgZ2SbVVKxUdW1cvLf_9rAWLWeiVr-y6S_sz-Uw5_O_AyQA@mail.gmail.com>
 <20120731095116.GA16155@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120731095116.GA16155-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
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
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On Tue, Jul 31, 2012 at 2:51 AM, Thierry Reding
<thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> On Tue, Jul 31, 2012 at 10:27:23AM +0100, Simon Glass wrote:
>> +Thierry
>>
>> Hi,
>>
>> On Thu, Jul 12, 2012 at 4:25 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > Add LCD definitions and also a proposed binding for LCD displays.
>> >
>> > The PWM is as per what will likely be committed to linux-next soon.
>> >
>> > The displaymode binding comes from a proposal here:
>> >
>> > http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html
>> >
>> > The panel binding is new, and fills a need to specify the panel
>> > timings and other tegra-specific information. Should a binding appear
>> > that allows the pwm to handle this automatically, we can revisit
>> > this.
>> >
>>
>> Any comments on this binding please? The main addition from Thierry's
>> one posted on LMKL is the LCD resolution selection.
>
> There's no such thing as the panel bindings on Linux. I think nobody's
> done that before, there's also no suitable software abstraction, but I
> suppose that should be irrelevant for this discussion.
>
>> > +Optional properties (rgb):
>> > + - nvidia,frame-buffer: address of frame buffer (if omitted it will be
>> > +               calculated)
>> > +       - This may be useful to share an address between U-Boot and Linux and
>> > +               avoid boot-time corruption / flicker
>> > +
>> > +
>> > +The panel node describes the panel itself.
>> > +
>> > +Required properties (panel) :
>> > + - nvidia,pwm : pwm to use to set display contrast (see tegra20-pwm.txt)
>> > + - nvidia,panel-timings: 4 cells containing required timings in ms:
>> > +       * delay between panel_vdd-rise and data-rise
>> > +       * delay between data-rise and backlight_vdd-rise
>> > +       * delay between backlight_vdd and pwm-rise
>> > +       * delay between pwm-rise and backlight_en-rise
>> > +
>> > +Optional GPIO properies all have (phandle, GPIO number, flags):
>> > + - nvidia,backlight-enable-gpios: backlight enable GPIO
>> > + - nvidia,lvds-shutdown-gpios: LVDS power shutdown GPIO
>> > + - nvidia,backlight-vdd-gpios: backlight power GPIO
>> > + - nvidia,panel-vdd-gpios: panel power GPIO
>> > +
>> > +Example:
>> > +
>> > +host1x {
>> > +       compatible = "nvidia,tegra20-host1x", "simple-bus";
>> > +       reg = <0x50000000 0x00024000>;
>> > +       interrupts = <0 65 0x04   /* mpcore syncpt */
>> > +                       0 67 0x04>; /* mpcore general */
>> > +
>> > +       #address-cells = <1>;
>> > +       #size-cells = <1>;
>> > +
>> > +       ranges = <0x54000000 0x54000000 0x04000000>;
>> > +
>> > +       dc@54200000 {
>> > +               compatible = "nvidia,tegra20-dc";
>> > +               reg = <0x54200000 0x00040000>;
>> > +               interrupts = <0 73 0x04>;
>> > +
>> > +               rgb {
>> > +                       status = "okay";
>> > +                       /* Seaboard has 1366x768 */
>> > +                       clock = <70600000>;
>> > +                       xres = <1366>;
>> > +                       yres = <768>;
>> > +                       left-margin = <58>;
>> > +                       right-margin = <58>;
>> > +                       hsync-len = <58>;
>> > +                       lower-margin = <4>;
>> > +                       upper-margin = <4>;
>> > +                       vsync-len = <4>;
>> > +                       hsync-active-high;
>> > +                       nvidia,frame-buffer = <0x2f680000>;
>> > +                       nvidia,bits-per-pixel = <16>;
>> > +                       nvidia,panel = <&lcd_panel>;
>> > +               };
>
> Perhaps it would be useful to add an extra node for the mode definition,
> if only to keep the data separate from that of the rgb node. I know that
> there currently are no other properties, but the rgb node was supposed
> to define the output or connector. If ever the same needs to be done for
> any of the TVO or DSI outputs, more properties may be needed.
>
> Furthermore the code to parse this would be more generic because you
> could pass it any DT node. Of course the nvidia,-prefixed properties
> wouldn't be part of that subnode because they don't define the mode as
> such.
>
> Thinking about it some more, maybe the mode information should really be
> part of the panel description below.

OK I will move it there, thanks.

>
>> > +       };
>> > +};
>> > +
>> > +lcd_panel: panel {
>> > +       nvidia,pwm = <&pwm 2 0>;
>> > +       nvidia,backlight-enable-gpios = <&gpio 28 0>;   /* PD4 */
>> > +       nvidia,lvds-shutdown-gpios = <&gpio 10 0>;      /* PB2 */
>> > +       nvidia,backlight-vdd-gpios = <&gpio 176 0>;     /* PW0 */
>> > +       nvidia,panel-vdd-gpios = <&gpio 22 0>;          /* PC6 */
>> > +       nvidia,panel-timings = <4 203 17 15>;
>> > +};
>
> If we can reach some kind of agreement on the power-sequencing code that
> Alexandre (Cc'ed) is working on, then this can be replaced with a more
> generic description. This also has the usual problem of being a non-
> addressable top-level node...

Yes, I have been following that. However, it would need quite a bit of
code to be written. I would like to leave this for a future owner if
possible.

Regards,
Simon

>
> Thierry
