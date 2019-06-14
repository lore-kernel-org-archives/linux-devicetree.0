From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Fri, 14 Jun 2019 11:49:42 +0100
Message-ID: <fb5c11b4-6fd1-830b-7a3a-ccf4b31ec337@arm.com>
References: <1559211329-13098-1-git-send-email-hhhawa@amazon.com>
 <1559211329-13098-3-git-send-email-hhhawa@amazon.com>
 <3129ed19-0259-d227-0cff-e9f165ce5964@arm.com>
 <4514bfa2-68b2-2074-b817-2f5037650c4e@amazon.com>
 <fdc3b458-96eb-1734-c294-2463f37f2244@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fdc3b458-96eb-1734-c294-2463f37f2244@arm.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: "Hawa, Hanna" <hhhawa@amazon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, linux-edac@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Hawa,

On 13/06/2019 18:05, James Morse wrote:
> On 11/06/2019 20:56, Hawa, Hanna wrote:
>> James Morse wrote:
>>> Hawa, Hanna wrote:
>>>> +        if (cluster != last_cluster) {
>>>> +            smp_call_function_single(cpu, al_a57_edac_l2merrsr,
>>>> +                         edac_dev, 0);
>>>> +            last_cluster = cluster;
>>>> +        }
>>> Here you depend on the CPUs being listed in cluster-order in the DT. I'm fairly sure the
>>> numbering is arbitrary: On my Juno 0,3,4,5 are the A53 cluster, and 1,2 are the A57
>>> cluster.
>>>
>>> If 1,3,5 were cluster-a and 2,4,6 were cluster-b, you would end up calling
>>> al_a57_edac_l2merrsr() for each cpu. As you don't wait, they could race.
>>>
>>> If you can get a cpu-mask for each cluster, smp_call_function_any() would to the
>>> pick-one-online-cpu work for you.

>> Again, I rely on that it's alpine SoC specific driver.

An example of where this goes wrong is kexec:
If you offline CPU0, then kexec, the new kernel will start up on the lowest numbered
online CPU, which won't be zero. But the new kernel will call it CPU0.

Kdump is even better, as it starts up on whichever CPU called panic(), and calls it CPU0.


Thanks,

James


>> How can I get cpu-mask for each cluster? from DT?

> Its not cluster you want, its the L2. Cacheinfo has this for online CPUs, and you're
> already holding the cpus_read_lock().
