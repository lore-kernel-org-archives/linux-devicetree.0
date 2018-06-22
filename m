From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [Dev] [PATCH 0/5] RFC: Mezzanine handling for 96boards
Date: Fri, 22 Jun 2018 15:08:25 +0200
Message-ID: <616e99d3-b43e-58ca-aa82-eaf41f618682@xilinx.com>
References: <20180618074556.6944-1-linus.walleij@linaro.org>
 <CAK8P3a2KqoX-squhGc8TBuJ==8xxELsuy-H+c1+C7Fu7Z4OjDA@mail.gmail.com>
 <CAKv+Gu-gAkfRsEUOc=iyxi6Twvg9cbvWNqNHRS2HzUDZg8xUhg@mail.gmail.com>
 <CAMuUZTG0q4f2T=+HjEijUCLb7KNXok9RJHOXOKNs2iap5p7m5Q@mail.gmail.com>
 <CAKv+Gu_Dq1uY0wHRyREmCmQdSRSJbNheF1ZsrNhibKOZowvf+g@mail.gmail.com>
 <CAMuUZTHOuzQm3y-yF6cad9y1UgsK+6R2w7vSzz7MkkYCdYd3hA@mail.gmail.com>
 <CAKv+Gu80zzaahJhoMScvZ9dS31QobMa0+JFjaOo-GxD+4XsuWQ@mail.gmail.com>
 <CAMuUZTH8wXhoBSKwsCFBRBzAvvBBTUTnkmwKEpq=56=URo7kjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuUZTH8wXhoBSKwsCFBRBzAvvBBTUTnkmwKEpq=56=URo7kjQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yang Zhang <yang.zhang@96boards.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>, dev <dev@lists.96boards.org>, Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy@infradead.org>, Frank Rowand <frowand.list@gmail.com>, rubini@gnudd.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 19.6.2018 17:32, Yang Zhang wrote:
> On 19 June 2018 at 16:30, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> 
>> On 19 June 2018 at 17:26, Yang Zhang <yang.zhang@96boards.org> wrote:
>>> Yes.
>>>
>>> https://github.com/96boards/documentation/blob/master/
>> mezzanine/files/mezzanine-design-guidelines.pdf
>>>
>>> Under Configuration data section
>>>
>>
>> OK, fair enough. Do any such mezzanines exist yet? Should we offer
>> more guidance on how exactly this discovery should be implemented?
>>
>>
> I can't be sure, could look into it - I know there were couple of from
> Arrow and ST were supporting this.
> 
> Yes, more details guidance of "How to" is always welcome :-).

Unfortunately this is not saying i2c address and also how to handle
stacked solution.

I have told to Linus what Xilinx is using for FMC connector present on
the most of xilinx development boards.
These on board FMC eeproms contain information in FRU format.
Also there incomplete support fmc support in the kernel in drivers/fmc
which was added by Alessandro Rubini in 2013.

At least these eeprom could reuse FRU data format.

Thanks,
Michal
