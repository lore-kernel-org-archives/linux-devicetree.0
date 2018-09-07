From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: Split up name & type in modalias generation
Date: Fri, 7 Sep 2018 12:56:09 -0700
Message-ID: <32ff0b7e-a710-2c23-75ad-8c527d3453c7@gmail.com>
References: <20180907142247.2931-1-thierry.reding@gmail.com>
 <CAL_JsqJ0VZftZ+Qve+=91tbvgYof68NW+dBf4bPv+b8uQ0y1hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ0VZftZ+Qve+=91tbvgYof68NW+dBf4bPv+b8uQ0y1hg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/07/18 11:49, Rob Herring wrote:
> On Fri, Sep 7, 2018 at 9:22 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>
>> From: Thierry Reding <treding@nvidia.com>
>>
>> The kernel's vsnprintf() implementation discards all alpha-numeric
>> characters following a %p conversion specifier. This is done in order to
>> generically skip any of the various modifiers that the kernel supports.
>> Unfortunately, the OF modalias is generated with a format string that
>> violates the assumption made by vsnprintf():
>>
>>         of:N%pOFnT%s
>>
>> While processing the above format string, vsnprintf() will eat the 'T'
>> character, assuming that it belongs to the preceeding %p specifier. This
>> results in a modalias with an incompatible format, which in turn causes
>> the automatic loading of drivers based on modalias to no longer work.
>>
>> To fix this, split up the generation of the name & type fields into two
>> separate snprintf() calls to avoid confusing the parser.
>>
>> Fixes: 73813f8483b1 ("of: Convert to using %pOFn instead of device_node.name")
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>> Note that a more elegant fix would be to make the %p format specifier
>> parser report back the exact number of characters consumed. I briefly
>> tried to implement it, but quickly ran into numerous special cases
>> that make this solution rather involved.
>>
>> I can spend some more time to improve this in general if that's what we
>> ultimately want, but I think this patch is a better short-term fix to
>> workaround the issue.
> 
> See my reply on the original patch. I've updated the patch in my
> dt/next branch with the fix to use %c.
> 
> Rob
> 

Agreed, your updated patch is more compact and looks cleaner.

-Frank
