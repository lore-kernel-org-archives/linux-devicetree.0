From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] input: keyboard: Add devicetree support for lm8333
Date: Mon, 31 Oct 2016 16:33:14 -0500
Message-ID: <CAL_JsqJxBjvpYsOqKE5iduPTtjxRdU8EGfeUbyv0VhpMN2RdMg@mail.gmail.com>
References: <1477595854-9059-1-git-send-email-gordan.markus@gmail.com>
 <20161031053227.n7lsmo6fgxbl2qze@rob-hp-laptop> <1477946270.2116.21.camel@gordan-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477946270.2116.21.camel@gordan-VirtualBox>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 31, 2016 at 3:37 PM, Gordan Markuš <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Mon, 2016-10-31 at 00:32 -0500, Rob Herring wrote:
>> On Thu, Oct 27, 2016 at 09:17:34PM +0200, Gordan Markus wrote:
>> > This adds LM8333 devicetree parsing for the keypad part.
>> > Optional properties to specify the keypad driver active
>> > time and debounce time.
>> >
>> > Signed-off-by: Gordan Markuš <gordan.markus-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/input/ti,lm8333.txt        | 45 ++++++++++++++++++
>>
>> It is preferred that bindings be a separate patch.
>
> Thanks Rob.
> Just to be clear, should I create a new thread with two patches?

Considering changes are needed, yes.

>> >  drivers/input/keyboard/lm8333.c                    | 54 ++++++++++++++++++++++
>> >  2 files changed, 99 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/input/ti,lm8333.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/input/ti,lm8333.txt b/Documentation/devicetree/bindings/input/ti,lm8333.txt
>> > new file mode 100644
>> > index 0000000..4100d48
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/input/ti,lm8333.txt
>> > @@ -0,0 +1,45 @@
>> > +LM8333 Keypad
>> > +
>> > +Required properties:
>> > +- compatible: Compatible property value should be "ti,lm8333".
>> > +
>> > +- reg: Physical base address of the peripheral and length of memory mapped
>> > +  region.
>> > +
>> > +- interrupts: The interrupt number for the peripheral.
>> > +
>> > +- linux,keymap: The keymap to use
>> > +   (see Documentation/devicetree/bindings/input/matrix-keymap.txt)
>> > +
>> > +Optional properties:
>> > +- ti,active-time: Specify the time during which the keypad is scanned after
>> > +   the last key is released, before entering Halt mode.
>> > +   The active time must be longer than the debounce time.
>> > +   Default 500 ms.
>>
>> Add a unit suffix.
>
> The property will be renamed to "ti,active-time-ms".
>
>>
>> > +
>> > +- ti,debounce-time: Specify the keypad debounce time.
>> > +   This can be used for reliable scanning of keyboards with noisy contacts.
>> > +   Default 10 ms.
>>
>> Don't we have a common property for this?
>
> There isn't a common property, as far as I can tell.
> Different devices have different debounce time properties.

Looks like we have 2 at least: debounce-interval and
debounce-delay-ms. I'd go with the latter as it has units.

And there's lots of other variations. Don't add yet another one.

$ git grep debounce Documentation/devicetree/bindings/input/
Documentation/devicetree/bindings/input/ads7846.txt:
ti,debounce-max                 Max number of additional readings per
Documentation/devicetree/bindings/input/ads7846.txt:
ti,debounce-tol                 Tolerance used for filtering (u16).
Documentation/devicetree/bindings/input/ads7846.txt:
ti,debounce-rep                 Additional consecutive good readings
Documentation/devicetree/bindings/input/ads7846.txt:
ti,pendown-gpio-debounce        Platform specific debounce time for
the
Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt:-
col-debounce-filter-period: The debounce period for the Column filter.
Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt:-
status-debounce-filter-period: The debounce period for the Status
filter.
Documentation/devicetree/bindings/input/brcm,bcm-keypad.txt:
 col-debounce-filter-period = <5>;
Documentation/devicetree/bindings/input/gpio-keys-polled.txt:   -
debounce-interval: Debouncing interval time in milliseconds.
Documentation/devicetree/bindings/input/gpio-keys.txt:  -
debounce-interval: Debouncing interval time in milliseconds.
Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt:-
debounce-delay-ms:     debounce interval in milliseconds
Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt:
 debounce-delay-ms = <5>;
Documentation/devicetree/bindings/input/lpc32xx-key.txt:-
nxp,debounce-delay-ms: Debounce delay in ms
Documentation/devicetree/bindings/input/lpc32xx-key.txt:
 nxp,debounce-delay-ms = <3>;
Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt:-
nvidia,debounce-delay-ms: delay in milliseconds per row scan for
debouncing
Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt:
nvidia,debounce-delay-ms = <640>;
Documentation/devicetree/bindings/input/pxa27x-keypad.txt:-
marvell,debounce-interval : How long time the key will be
Documentation/devicetree/bindings/input/pxa27x-keypad.txt:  is
debounce interval for direct key and bit[15:0] is debounce
Documentation/devicetree/bindings/input/pxa27x-keypad.txt:
 marvell,debounce-interval = <0x001e001e>;
Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt:- debounce:
Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt:
 debounce = <15625>;
Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt:- debounce:
Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt:
 debounce = <15>;
Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt:- debounce:
Documentation/devicetree/bindings/input/qcom,pm8xxx-pwrkey.txt:
 debounce = <15625>;
Documentation/devicetree/bindings/input/st-keyscan.txt:-
st,debounce_us: Debouncing interval time in microseconds
Documentation/devicetree/bindings/input/st-keyscan.txt: st,debounce_us = <5000>;
Documentation/devicetree/bindings/input/stmpe-keypad.txt: -
debounce-interval        : Debouncing interval time in milliseconds
Documentation/devicetree/bindings/input/stmpe-keypad.txt:
 debounce-interval = <64>;
Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.txt:-
ti,palmas-pwron-debounce-milli-seconds: Duration in milliseconds
Documentation/devicetree/bindings/input/ti,palmas-pwrbutton.txt:
         ti,palmas-pwron-debounce-milli-seconds = <15>;
Documentation/devicetree/bindings/input/touchscreen/brcm,iproc-touchscreen.txt:-
debounce_timeout: Each step is 512 us.  Valid 0-255
Documentation/devicetree/bindings/input/touchscreen/brcm,iproc-touchscreen.txt:
        debounce_timeout = <40>;
Documentation/devicetree/bindings/input/touchscreen/fsl-mx25-tcq.txt:
- fsl,pen-debounce-ns: Pen debounce time in nanoseconds.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
