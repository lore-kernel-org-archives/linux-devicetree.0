From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH v5 3/4] misc: sram: Add optional clock
Date: Tue, 6 Nov 2012 13:28:31 -0500
Message-ID: <509956CF.4010408@windriver.com>
References: <1350570453-24546-1-git-send-email-p.zabel@pengutronix.de>
 <1350570453-24546-4-git-send-email-p.zabel@pengutronix.de>
 <CAP=VYLpwahaxVssP1bXmp+ttM_eArF9B2DX1auiOmterdHHUGw@mail.gmail.com>
 <1351513257.5872.104.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351513257.5872.104.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
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
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12-10-29 08:20 AM, Philipp Zabel wrote:
> Am Freitag, den 26.10.2012, 12:17 -0400 schrieb Paul Gortmaker:
>> On Thu, Oct 18, 2012 at 10:27 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>>> On some platforms the SRAM needs a clock to be enabled explicitly.
>>>
>>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>> ---
>>>  drivers/misc/sram.c |   10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
>>> index 7a363f2..0cc2e75 100644
>>> --- a/drivers/misc/sram.c
>>> +++ b/drivers/misc/sram.c
>>> @@ -21,6 +21,8 @@
>>>  #include <linux/kernel.h>
>>>  #include <linux/module.h>
>>>  #include <linux/init.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/err.h>
>>>  #include <linux/io.h>
>>>  #include <linux/of.h>
>>>  #include <linux/platform_device.h>
>>> @@ -29,6 +31,7 @@
>>>
>>>  struct sram_dev {
>>>         struct gen_pool *pool;
>>> +       struct clk *clk;
>>>  };
>>
>> I see another field gets added to the struct here.  (yet another
>> reason to have it folded into the original)   But you still
>> really don't need to create a sram_dev for this, because...
>>
>>>
>>>  static int __devinit sram_probe(struct platform_device *pdev)
>>> @@ -53,6 +56,10 @@ static int __devinit sram_probe(struct platform_device *pdev)
>>>         if (!sram)
>>>                 return -ENOMEM;
>>>
>>> +       sram->clk = devm_clk_get(&pdev->dev, NULL);
>>> +       if (!IS_ERR(sram->clk))
>>> +               clk_prepare_enable(sram->clk);
>>> +
>>>         sram->pool = gen_pool_create(PAGE_SHIFT, -1);
>>>         if (!sram->pool)
>>>                 return -ENOMEM;
>>> @@ -80,6 +87,9 @@ static int __devexit sram_remove(struct platform_device *pdev)
>>>
>>>         gen_pool_destroy(sram->pool);
>>>
>>> +       if (!IS_ERR(sram->clk))
>>> +               clk_disable_unprepare(sram->clk);
>>> +
>>
>> ...here, this looks confusing with the use of IS_ERR on
>> an entity that was not recently assigned to.
> 
> Right.
> How about I set sram->clk = NULL in sram_probe if devm_clk_get returns
> an error value?

Sorry for delayed reply ; was out last week.
And yes, I like that better than the double call as well.

Thanks,
Paul.
--

> 
>> Instead, just
>> put a "struct clk *clk;" on the stack and do the
>>
>>    clk = devm_clk_get(&pdev->dev, NULL);
>>
>> in both the init and the teardown.  Then the code will be
>> more readable.
> 
> Calling devm_clk_get on the same clock twice seems a bit weird.
> I expect that eventually someone will want to disable clocks during
> suspend, so I'd prefer to keep the clk pointer around.
> 
> regards
> Philipp
> 
