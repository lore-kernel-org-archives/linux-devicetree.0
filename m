From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Fri, 23 Nov 2012 16:17:09 +0530
Message-ID: <CAKohpom7Sqj7BeTFdsg04iGvZz1jnqB=UZTLdRNK7X-0ivknsQ@mail.gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
 <20121123103400.GO17471@gmail.com>
 <20121123104140.GP17471@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121123104140.GP17471-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23 November 2012 16:11, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
>> > @@ -0,0 +1,18 @@
>> > +STMPE gpio
>> > +----------
>> > +
>> > +Required properties:
>> > + - compatible: "st,stmpe-gpio"
>
> ... but this is wrong.
>
>> > +Example:
>> > +   stmpe_gpio {
>> > +           compatible = "st,stmpe-gpio";
>> > +           st,norequest-mask = <0x20>;     //gpio 5 can't be used
>> > +   };
>
> As is the example.
>
> So will be the the DT - if you've already written it.

Again, I believe these are required by the code you wrote in mfd-core.c

        if (parent->of_node && cell->of_compatible) {
                for_each_child_of_node(parent->of_node, np) {
                        if (of_device_is_compatible(np, cell->of_compatible)) {
                                pdev->dev.of_node = np;
                                break;
                        }
                }
        }

This matches compatible of child node with compatible of cell. And that's
why you have added that in your keypad mappings as well.

--
viresh
