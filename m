From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH v6 3/3] edac: Add support for Amazon's Annapurna Labs L2
 EDAC
Date: Thu, 10 Oct 2019 17:28:24 +0300
Message-ID: <9b62e2aa-4503-02d7-2448-cc0697464046@amazon.com>
References: <20191007151730.7705-1-hhhawa@amazon.com>
 <20191007151730.7705-4-hhhawa@amazon.com>
 <CAL_JsqKk1SeUTPdVOC_5ewC+xqdPMZbBxiqZHYO3Zdme06P57w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKk1SeUTPdVOC_5ewC+xqdPMZbBxiqZHYO3Zdme06P57w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, James Morse <james.morse@arm.com>, Frank Rowand <frowand.list@gmail.com>, David Miller <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, daniel@iogearbox.net, "Paul E. McKenney" <paulmck@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-edac <linux-edac@vger.kernel.org>, devicetree@vger.kernel.org, "Woodhouse, David" <dwmw@amazon.co.uk>, benh@amazon.com, "Krupnik, Ronen" <ronenk@amazon.com>, Talel Shenhar <talel@amazon.com>, Jonathan Chocron <jonnyc@amazon.com>, "Hanoch, Uri" <hanochu@amazon.com>, Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: devicetree@vger.kernel.org



On 10/10/2019 2:09 AM, Rob Herring wrote:
> +Sudeep
> 
> On Mon, Oct 7, 2019 at 10:18 AM Hanna Hawa <hhhawa@amazon.com> wrote:
>>
>> Adds support for Amazon's Annapurna Labs L2 EDAC driver to detect and
>> report L2 errors.
> 
> I was curious why you needed a DT cache parsing function...
> 
> [...]
> 
>> +static int al_l2_edac_probe(struct platform_device *pdev)
>> +{
>> +       struct edac_device_ctl_info *edac_dev;
>> +       struct al_l2_edac *al_l2;
>> +       struct device *dev = &pdev->dev;
>> +       int ret, i;
>> +
>> +       edac_dev = edac_device_alloc_ctl_info(sizeof(*al_l2), DRV_NAME, 1, "L",
>> +                                             1, 2, NULL, 0,
>> +                                             edac_device_alloc_index());
>> +       if (!edac_dev)
>> +               return -ENOMEM;
>> +
>> +       al_l2 = edac_dev->pvt_info;
>> +       edac_dev->edac_check = al_l2_edac_check;
>> +       edac_dev->dev = dev;
>> +       edac_dev->mod_name = DRV_NAME;
>> +       edac_dev->dev_name = dev_name(dev);
>> +       edac_dev->ctl_name = "L2_cache";
>> +       platform_set_drvdata(pdev, edac_dev);
>> +
>> +       INIT_LIST_HEAD(&al_l2->l2_caches);
>> +
>> +       for_each_possible_cpu(i) {
>> +               struct device_node *cpu;
>> +               struct device_node *cpu_cache;
>> +               struct al_l2_cache *l2_cache;
>> +               bool found = false;
>> +
>> +               cpu = of_get_cpu_node(i, NULL);
>> +               if (!cpu)
>> +                       continue;
>> +
>> +               cpu_cache = of_find_next_cache_node(cpu);
>> +               list_for_each_entry(l2_cache, &al_l2->l2_caches, list_node) {
>> +                       if (l2_cache->of_node == cpu_cache) {
>> +                               found = true;
>> +                               break;
>> +                       }
>> +               }
>> +
>> +               if (found) {
>> +                       cpumask_set_cpu(i, &l2_cache->cluster_cpus);
>> +               } else {
>> +                       l2_cache = devm_kzalloc(dev, sizeof(*l2_cache),
>> +                                               GFP_KERNEL);
>> +                       l2_cache->of_node = cpu_cache;
>> +                       list_add(&l2_cache->list_node, &al_l2->l2_caches);
>> +                       cpumask_set_cpu(i, &l2_cache->cluster_cpus);
>> +               }
>> +
>> +               of_node_put(cpu);
>> +       }
> 
> We already have what's probably similar code to parse DT and populate
> cacheinfo data. Does that not work for you? If not, why not and can we
> extend it?

As I saw in cacheinfo it will return the cacheinfo for the online CPUs 
only, correct me if I'm wrong..

Here I'm parsing all the L2 info for all CPUs depends on DT to get 
"cluster_cpus", and using smp_call_function_any() will call the online 
cpu to read the L2MERRSR status register.

> 
> Then your driver might work if the data comes from ACPI instead (or
> maybe that's all different, I don't know).

No plan to get it work on ACPI, at least in the near future.

> 
> Rob
> 
