From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v10 05/12] ARM: dts: aspeed: peci: Add PECI node
Date: Mon, 14 Jan 2019 14:12:48 -0800
Message-ID: <8e3e2dd8-b1fc-7746-f7bb-d95676b20ba0@linux.intel.com>
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-6-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf-54Q7s_z8J=ZBoYqiFuy7_QAvsDqgT2CO0LFOvx8tqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACPK8Xf-54Q7s_z8J=ZBoYqiFuy7_QAvsDqgT2CO0LFOvx8tqg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, James Feist <james.feist@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Haiyue Wang <haiyue.wang@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Joel,

On 1/13/2019 9:45 PM, Joel Stanley wrote:
> Hi Jae,
> 
> On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
>> aspeed-g4 and aspeed-g5.
> 
> This looks good, aside from the alias.
> 
> It will go via my aspeed tree once the bindings are merged. Send them
> to linux-aspeed@lists.ozlabs.org at that time.
> 
> In the future I suggest leaving the changes to arch/arm/boot/dts until
> after the bindings and driver patches have landed. They will rarely go
> in before hand as the bindings need to be agreed on.
> 

I thought that it would be helpful if it shows an actual example in this
series because it is trying to add a new subsystem. In the future, I'll
submit a dts patch separately from bindings and drivers, but I'd like
to keep this dts changes in this series because it has been already
submitted. I'll CC linux-aspeed list from the next version. Thanks!

> 
>>                  serial3 = &uart4;
>>                  serial4 = &uart5;
>>                  serial5 = &vuart;
>> +               peci0 = &peci0;
> 
> I don't think this is necessary. Can you explain why you think you need it?
> 

You are right. This alias is not necessary at all. Will drop it.

Thanks,
Jae

> Cheers,
> 
> Joel
> 
