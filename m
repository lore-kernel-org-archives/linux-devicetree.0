From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v8 0/4] FPGA Manager Framework
Date: Mon, 12 Jan 2015 14:50:27 +0100
Message-ID: <2ea77cba43724d5ab5aff54cec9fae98@BL2FFO11FD043.protection.gbl>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <20150110181120.GA26067@t400> <alpine.DEB.2.10.1501111004580.2556@shineypoop>
 <20150111162426.GC26067@t400> <20150111195219.GA25760@amd>
 <20150111205800.GD26067@t400> <20150111213146.GA16524@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150111213146.GA16524@amd>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pavel Machek <pavel@denx.de>, Konrad Zapalowicz <bergo.torino@gmail.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, iws@ovro.caltech.edu, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, atull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, akpm@linux-foundation.org, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, davem@davemloft.net, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, dinguyen@opensource.altera.com, delicious.quinoa@gmail.com, m.chehab@samsu
List-Id: devicetree@vger.kernel.org

On 01/11/2015 10:31 PM, Pavel Machek wrote:
> On Sun 2015-01-11 21:58:00, Konrad Zapalowicz wrote:
>> On 01/11, Pavel Machek wrote:
>>> On Sun 2015-01-11 17:24:26, Konrad Zapalowicz wrote:
>>>> On 01/11, atull wrote:
>>>>> On Sat, 10 Jan 2015, Konrad Zapalowicz wrote:
>>>>>
>>>>>> On 01/06, atull@opensource.altera.com wrote:
>>>>>>> From: Alan Tull <atull@opensource.altera.com>
>>>>>>
>>>>>> Alan, there is something wrong with your email client configuration
>>>>>> and you need to fix.
>>>>>>
>>>>>> thanks,
>>>>>> konrad
>>>>>
>>>>> Hi Konrad,
>>>>>
>>>>> Can you be more specific?  What problem are you seeing?  Is it a problem 
>>>>> with the original patch  post or when I reply?  When I a post, I'm using
>>>>> 'git send-email' with sendmail and when I am replying, I am using alpine.
>>>>
>>>> I think that because you email client configuration sets the 'From'
>>>> header to "atull@..." and at the same time you sign-off messages with
>>>> "Alan Tull atull@..." the "From" is added at the beginning of the
>>>> message to indicate the original author.
>>>>
>>>> This should be fixed as the "from" is not welcomed in the body of the
>>>> commit message.
>>>
>>> Actually, why not? Tools should know to look at From: in the
>>> commit. AFAICT, Alan has it set up correctly.
>>
>> I think he has not. I suspect that the sendmail configuration in the git
>> config might be wrong. The 'from' must contain the same data as the git
>> is configured for the user.name and user.email options. Otherwise the
>> send-email is adding the "From: ..." to the message body.
> 
> And what is the problem with From: in the message body? Tools should
> handle that ok.

Konrad: Problem is probably just on your end. I have also no problem to handle
these patches.
Alan: From my point of view you don't need to change anything.

Thanks,
Michal
