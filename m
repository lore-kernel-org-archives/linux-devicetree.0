From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: imx6q: replace clk_register_clkdev with clock
 DT lookup
Date: Mon, 20 Aug 2012 23:16:11 +0800
Message-ID: <20120820151609.GN24242@S2101-09.ap.freescale.net>
References: <1345104526-14797-1-git-send-email-shawn.guo@linaro.org>
 <1345104526-14797-3-git-send-email-shawn.guo@linaro.org>
 <503232E0.3000007@gmail.com>
 <CAKGA1bn2uCWE8YkGR4EzTxZ_bXJ_ov2diq63uxQ=dT7b6Fu9GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKGA1bn2uCWE8YkGR4EzTxZ_bXJ_ov2diq63uxQ=dT7b6Fu9GQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2012 at 09:54:48AM -0500, Matt Sealey wrote:
> Yet another arbitrary array...
> 
> I'm not sure why you would move the registration lookup into the DT

Because I do not want to patch kernel every time I need a new lookup.
Furthermore, looking at function imx53_qsb_init in imx53-dt.c, you
will find that lookup for sgtl5000 is really board specific and should
go to device tree.

> and use an arbitrarily ordered array again. Sure, you're looking it up
> entirely within the device tree here, but a better solution would be
> to not name clocks twice, and structure your clock definition
> properly.
> 
> What's wrong with;
> 
> ccm@020c4000 {
>    ...
>    my_clock: clock@0 {
>        name = "my_clock_name";
>    }
> }
> 
> uart@nnnnnnnn {
>    ...
>    clocks = <&my_clock>;
> }
> 
> ?
> 
It turns a property into 185 nodes, which will just bloat the device
tree.  This issue has been discussed for a plenty of times.

-- 
Regards,
Shawn
