From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Fri, 7 Jun 2013 13:36:16 +0200
Message-ID: <CACRpkdbuDWBPUC8RKSfzwiMycyf1juC=ivxPi-tz-3-vcScnEg@mail.gmail.com>
References: <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
 <20130508164123.GA10248@ab42.lan> <518AAF31.8080502@wwwdotorg.org>
 <20130510082521.GA2125@ab42.lan> <51942472.9010402@wwwdotorg.org>
 <CACRpkdYtKr5w2=1sONG4Qn2TQue38nV7epWfzxNQz5rjSs0DZQ@mail.gmail.com>
 <20130522142824.GC4789@ab42.lan>
 <CAD6h2NT4FqmEsLvtTDwwDL2YVzXYNpw72hTOcSxSMvHLhWvFPQ@mail.gmail.com>
 <20130524115053.GB5203@ab42.lan>
 <CACRpkdbqzSZefYB2jywkkKDE_Qse83+MDJ+D+UNYnQGFUzwQWQ@mail.gmail.com>
 <20130603094204.GC31808@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130603094204.GC31808-7oYq3qWSd+k@public.gmane.org>
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
To: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Leuenberger <sascha.leuenberger-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, Pierrick Hascoet <pierrick.hascoet-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shiraz HASHIM <shiraz.hashim-qxv4g6HH51o@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 3, 2013 at 11:42 AM, Christian Ruppert
<christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org> wrote:

> Ease of use is also the reason why I added the gpio-base property to the
> original driver: Finding out the global GPIO number to use in
> /sys/class/gpio for a given GPIO of a given bank seems to be a recurring
> headache for our customers and the definition of the bank's base number
> in the device tree is an attempt to improve this situation.

What you need to do in that case is to find a way to name the pins
in sysfs (creating symbolic links with the GPIO pin name) so they
can use these names in sysfs instead.

There is no ambition from my side to try to correlate the
GPIO sysfs interface and device trees. This is because the GPIO
sysfs is not universally liked. And when you say you want to make the
sysfs ABI easy to use that lights a big red light on my panel. I will
explain why.

What is very important is that your customers understand that
the GPIO sysfs shall not be used for things like:

- LEDs
- Switches
- Regulators
- Camera muxes
- etc

>From the kernel community we have tried (or atleast I have tried)
that this kind of hardware shall be handled by the apropriate linux
subsystems, and not by obscure userspace code.

In a fight between device tree and GPIO sysfs device tree
*wins*.

Consider this example from the Snowball device tree:

        en_3v3_reg: en_3v3 {
                compatible = "regulator-fixed";
                regulator-name = "en-3v3-fixed-supply";
                regulator-min-microvolt = <3300000>;
                regulator-max-microvolt = <3300000>;
                gpios = <&gpio0 26  0x4>; // 26
                startup-delay-us = <5000>;
                enable-active-high;
        };

        gpio_keys {
                compatible = "gpio-keys";
                #address-cells = <1>;
                #size-cells = <0>;

                button@1 {
                        debounce_interval = <50>;
                        wakeup = <1>;
                        linux,code = <2>;
                        label = "userpb";
                        gpios = <&gpio1 0 0x4>;
                };
                button@2 {
                        debounce_interval = <50>;
                        wakeup = <1>;
                        linux,code = <3>;
                        label = "extkb1";
                        gpios = <&gpio4 23 0x4>;
                };
                button@3 {
                        debounce_interval = <50>;
                        wakeup = <1>;
                        linux,code = <4>;
                        label = "extkb2";
                        gpios = <&gpio4 24 0x4>;
                };
                button@4 {
                        debounce_interval = <50>;
                        wakeup = <1>;
                        linux,code = <5>;
                        label = "extkb3";
                        gpios = <&gpio5 1 0x4>;
                };
                button@5 {
                        debounce_interval = <50>;
                        wakeup = <1>;
                        linux,code = <6>;
                        label = "extkb4";
                        gpios = <&gpio5 2 0x4>;
                };
        };

        leds {
                compatible = "gpio-leds";
                used-led {
                        label = "user_led";
                        gpios = <&gpio4 14 0x4>;
                        default-state = "on";
                        linux,default-trigger = "heartbeat";
                };
        };

As you immediately realize, if people don't know how to specify
the above and start writing a userspace daemon to do the same
thing by hammering on sysfs files, they are doing the wrong thing.

What you need to make sure is that before your customers start
to do userspace tricks in GPIO sysfs they need to answer the
question "why?".

If the GPIO sysfs is encouraging people to do things like the
above from userspace, it needs to be actively discouraged,
because that is hurting the people doing that.

Yours,
Linus Walleij
