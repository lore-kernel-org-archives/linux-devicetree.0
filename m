From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Thu, 25 Oct 2018 14:47:59 +0100
Message-ID: <d0e76752-1b31-e9e3-d684-9d78ddc98172@opensource.cirrus.com>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-2-ckeepax@opensource.cirrus.com>
 <20181025074459.GF4939@dell> <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025114205.GC4870@dell> <20181025124905.GF16508@imbe.wolfsonmicro.main>
 <20181025132043.GG16508@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025132043.GG16508@imbe.wolfsonmicro.main>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Lee Jones <lee.jones@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 25/10/18 14:20, Charles Keepax wrote:
> On Thu, Oct 25, 2018 at 01:49:05PM +0100, Charles Keepax wrote:
>> On Thu, Oct 25, 2018 at 12:42:05PM +0100, Lee Jones wrote:
>>> On Thu, 25 Oct 2018, Richard Fitzgerald wrote:
>>>> On 25/10/18 09:26, Charles Keepax wrote:
>>>>> On Thu, Oct 25, 2018 at 08:44:59AM +0100, Lee Jones wrote:
>>>>>> On Mon, 08 Oct 2018, Charles Keepax wrote:
>>>>>>> From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
>>>>> I really feel this isn't the driver you are objecting to as such
>>>>> but the way regmap operates and also we seem to always have the same
>>>>> discussions around regmap every time we push a driver.
>>>
>>> Absolutely.  I didn't like it before.  I like it even less now.
>>>
>>
>> I guess the question from my side becomes do you want to block
>> this driver pending on major refactoring to regmap? I will have a
>> think about what I can do but its going to affect a LOT of drivers.
>>
> 
> Actually one more thought, perhaps as a halfway for now i could
> look into removing the readables

Be careful with that, there are some addresses that are illegal to
access. What does regmap debugfs do if you don't have a readables
list? Just reading a debugfs shouldn't be able to kill the hardware.
You might need to add a precious list which is more error prone
than listing the valid readables we are using.

  and defaults. We lose some things
> like error checking that we are reading real registers but as
> this driver doesnt currently do cache syncs we might be able to
> get away with this for now.
> 
> Unless anyone strenuously objects i will have a look at the
> options there. As well as looking at wider refactoring but aiming
> further out.
> 
> Thanks,
> Charles
> 
