From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: <Query> Reg: Adding a gpio initialization sequence in dts is
 valid or not
Date: Wed, 08 Aug 2012 08:30:20 -0500
Message-ID: <502269EC.2070008@gmail.com>
References: <CAL1wa8fjJg33vVM4ZOFuA2ACps55cahoK65MDf4ebAi9B6KUxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAL1wa8fjJg33vVM4ZOFuA2ACps55cahoK65MDf4ebAi9B6KUxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Leela Krishna Amudala <leelakrishna.a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/08/2012 04:52 AM, Leela Krishna Amudala wrote:
> Hello All,
> 
> I came across that to set power to an LCD, few panels require a pull
> up/pull down operation on single GPIO line
> and few panels need some gpio line setting sequence with some delay in between.
> 
> For my development board, user manual says that I have to do a
> sequence of gpio line settings with some delay in between
> to set power to LCD and currently I'm doing it as
> 
> pull_up(gpio_line_5)
> some_delay(x)
> pull_down(gpio_line_5)
> some_delay(x)
> pull_up(gpio_line_5)
> 
> I want to read this GPIO line from device tree and parse it and do the
> above sequence in the driver.
> I'm thinking to follow the below approach to get this done.
> 

See the thread "runtime interpreted power sequences"

> Putting the sequence in dts file like below for an LCD which requires
> gpio sequence
>                lcd-reset-gpio = <&gpx1 5 1 3 0>,    (3 - for pull up)
>                                       <&gpx1 5 1 1 0>,    (1 - for pull down)
>                                       <&gpx1 5 1 3 0>;    (3 - for pull up)
>                delay = x;
> 
> and only one gpio entry in the case of LCD which doesn't require gpio
> sequence setting
>                lcd-reset-gpio = <&gpx1 5 1 3 0>,    (3 - pull up)
> 
> The 4 arguments in the above handle denotes
> 
> <[phandle of the gpio controller node]
>       [pin number within the gpio controller]
>       [mux function]
>       [pull up/down]
>       [drive strength]>
> 

The gpio controller defines the number of gpio cells. So technically you
could do that if you're defining the gpio controller's binding, but I
don't think thats a good idea. If the binding is already defined, then
you can't really change it anyway.

Rob

> My board requires one gpio line to pull up->pull down->pull up to set
> power and similarly
> other boards may require two gpio lines to follow the sequence in that
> case number of entries
> in dts file will increase.
> 
> I want to know whether the above approach is acceptable in device-tree or not.
> 
> Best Wishes,
> Leela Krishna Amudala.
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
> 
