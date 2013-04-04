From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] CLK: Allow parent clock and rate to be configured in
 DT.
Date: Thu, 4 Apr 2013 20:08:29 -0300
Message-ID: <CAOMZO5ASkvquyzPCEGObvB5Xh9bDPTJ2zx26eOUJT_Vb36Bn3Q@mail.gmail.com>
References: <20130319170933.28337.50448.stgit@localhost>
 <20130325101707.GZ1906@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130325101707.GZ1906-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Mon, Mar 25, 2013 at 7:17 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

>> +For example:
>> +     clock-configuration {
>> +             compatible = "clock-configuration";
>> +             clko1 {
>> +                     clocks = <&clks 160>; /* cko1_sel */
>> +                     parent = <&clks 114>; /* pll3_sw */
>> +             };
>> +
>> +             esdhca {
>> +                     clocks = <&clks 102>; /* esdhc_a_podf */
>> +                     clock-frequency = <200000000>;
>> +             };
>
> This example shows this. For some reason we adjust the esdhc frequency
> to 200MHz in the code currently, but this is because it matches our
> current usecase. Once you move this into devicetree, we can't change
> this anymore in the kernel, even if we find a much better way to adjust
> the frequency in the future (i.e. smaller values might be good for power
> savings, higher values might increase performance, we even might
> dynamically change this frequency).

What if we use Martin's idea, but without the "clock-frequency" option
and only pass the parent information? This way the driver can find the
better clock as you described. Something like:

     clock-parent {
             compatible = "clock-parent";
             clko1 {
                     clocks = <&clks 160>; /* cko1_sel */
                    parent = <&clks 114>; /* pll3_sw */
             };

This could be useful for removing the imx6q_sabrelite_cko1_setup()
function from arch/arm/mach-imx/mach-imx6q.c.

I would like to add audio support for another board and would like to
avoid to do the same as imx6q_sabrelite_cko1_setup()  for setting up
the CLKO, if possible.

Regards,

Fabio Estevam
