From: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH v9 7/9] pinctrl: madera: Add DT bindings for Cirrus Logic
 Madera codecs
Date: Tue, 17 Apr 2018 09:53:04 +0100
Message-ID: <bc752fb8-8f2f-70bc-e786-221eb39c618b@opensource.cirrus.com>
References: <20180313131904.13700-1-rf@opensource.cirrus.com>
 <20180313131904.13700-8-rf@opensource.cirrus.com>
 <CACRpkdZspUbmCk7OwA-rva6zd89TZXt45t5mFes0feuRyOUp9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZspUbmCk7OwA-rva6zd89TZXt45t5mFes0feuRyOUp9w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27/03/18 12:29, Linus Walleij wrote:
> On Tue, Mar 13, 2018 at 2:19 PM, Richard Fitzgerald
> <rf@opensource.cirrus.com> wrote:
> 
>> This is the binding description of the pinctrl driver for Cirrus Logic
>> Madera codecs. The binding uses the generic pinctrl binding so  the main
>> purpose here is to describe the device-specific names for groups and
>> functions.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I can also just apply this if you want, as it has no dependencies to
> anything else. I just assume you want to keep it together with the
> rest of this complex series.
> 
> Yours,
> Linus Walleij
> 

Linus,

What is your opinion of the i.MX6 pinctrl failure after my bugfix patch
for the hogs?
If you would want to revert my patch I would need to change this pinctrl
driver so it has its own child node as a workaround to the hog bug.

Or do you think it is more likely a bug in the i.MX6 pinctrl driver?
