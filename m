From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Configure standalone GPIO in device tree?
Date: Mon, 11 Jun 2012 10:46:41 -0500
Message-ID: <4FD612E1.6070107@gmail.com>
References: <4FD5F8F7.1020901@grid-net.com> <4FD5FEEF.70606@gmail.com>
 <4FD610D2.5020603@grid-net.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FD610D2.5020603-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/11/2012 10:37 AM, Subodh Nijsure wrote:
> On 06/11/2012 07:21 AM, Rob Herring wrote:
>> On 06/11/2012 08:56 AM, Subodh Nijsure wrote:
>>> Hello,
>>>
>>> I am working with a hardware that has couple of GPIOs that are not tied
>>> to any specific device one to indicate board status, other to indicate
>>> presence of this hardware to some other 'independent' hardware.
>>>
>>> I have been going through some of the device tree files and I haven't
>>> come across way to represent a GPIO independent of a specific device, is
>>> it possible to do so using DT? How would I specify such a GPIO?
>>>
>>> I am working on MX28 (MXS for linux) based platform but if there are
>>> some other platforms already doing that would appreciate pointer to that
>>> dt file.
>> How do you program that gpio line? It has to be controlled from
>> somewhere.
> In non-dt version, .init_machine code used to configure GPIO using
> gpio_request_one() interface and set the values.
> 
> Currently as a hack on my board, I am doing the following, but that
> status led has nothing do with the ethernet driver.
> 
>                 mac0: ethernet@800f0000 {
>                         phy-mode = "rmii";
>                         pinctrl-names = "default";
>                         pinctrl-0 = <&mac0_pins_a>;
>                         status-led = <&gpio3 5 0>;
>                         mac-address = [ 00 11 22 33 44 56 ];
>                 };
> 
>                 int status_led;
>                 struct device_node *np = pdev->dev.of_node;
> 
>                 status_led = of_get_named_gpio(np, "status-led", 0);
>                 gpio_request_one(status_led, GPIOF_OUT_INIT_LOW,
> "status-led");
> 
> So in DT world I would like to  lookup  LED named status-led, only
> version I know of of_get_named_gpio() requires device_node pointer,so I
> guess I am looking for way to lookup gpio in .init_machine function,
> without having a pointer to a device_node, is that possible?

Look at gpio-led. There are some examples in PowerPC dts files and
documentation in Documentation/devicetree/bindings/gpio/led.txt.

Rob
