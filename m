From: Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: imx6q: replace clk_register_clkdev with clock DT
 lookup
Date: Mon, 20 Aug 2012 12:22:56 -0500
Message-ID: <CAKGA1bnfhMC8QG9OqBbpy5iq6ZAfEgrYMg_LVd50U7yikLhDAg@mail.gmail.com>
References: <1345104526-14797-1-git-send-email-shawn.guo@linaro.org>
 <1345104526-14797-3-git-send-email-shawn.guo@linaro.org>
 <503232E0.3000007@gmail.com>
 <CAKGA1bn2uCWE8YkGR4EzTxZ_bXJ_ov2diq63uxQ=dT7b6Fu9GQ@mail.gmail.com>
 <20120820151609.GN24242@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120820151609.GN24242-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 20, 2012 at 10:16 AM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Aug 20, 2012 at 09:54:48AM -0500, Matt Sealey wrote:
>> Yet another arbitrary array...
>>
>> I'm not sure why you would move the registration lookup into the DT
>
> Because I do not want to patch kernel every time I need a new lookup.
> Furthermore, looking at function imx53_qsb_init in imx53-dt.c, you
> will find that lookup for sgtl5000 is really board specific and should
> go to device tree.
>
>> and use an arbitrarily ordered array again. Sure, you're looking it up
>> entirely within the device tree here, but a better solution would be
>> to not name clocks twice, and structure your clock definition
>> properly.
>>
>> What's wrong with;
>>
>> ccm@020c4000 {
>>    ...
>>    my_clock: clock@0 {
>>        name = "my_clock_name";
>>    }
>> }
>>
>> uart@nnnnnnnn {
>>    ...
>>    clocks = <&my_clock>;
>> }
>>
>> ?
>>
> It turns a property into 185 nodes, which will just bloat the device
> tree.  This issue has been discussed for a plenty of times.

It's not bloat just because it is by its very definition "a big list", is it?

How do you explain duplicating the clock names in the array AND in the
device node as NOT being bloated?

You're going to have to define these clocks as a tree with parents and
leaf nodes anyway in the clock subsystem. Why not define these in the
device tree in total and reference them by handle when you build the
entire clock tree from the ground up? Or will it just be all the
clocks defined in Linux, but the lookups (which is what I see here)
moved into the DT? Why not form the lookups as part of the definition
of the clock tree?

-- 
Matt Sealey <matt-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
Product Development Analyst, Genesi USA, Inc.
