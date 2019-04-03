From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH] dt-bindings: cpu: Fix JSON schema
Date: Wed, 3 Apr 2019 10:29:27 +0900
Message-ID: <c08031d4-d719-b91b-8789-b526ee80efe4@socionext.com>
References: <20190318100521.29109-1-maxime.ripard@bootlin.com>
 <CAL_JsqJ_LYycXazkdP2Q=e-jynKiX+z5En0bz0AWpDjsevwQTg@mail.gmail.com>
 <20190401091050.cwph7xlpv3pmkwnq@flea>
 <78bb248e-56b8-b825-e763-583f75148eb3@socionext.com>
 <20190401113546.d6p2mg2y47abhumz@flea>
 <b6cb709b-7b1a-6bab-6f93-bcb565be18fb@socionext.com>
 <b3ecf5c5-9b1a-eb8b-95c2-c30a94c8bdd8@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b3ecf5c5-9b1a-eb8b-95c2-c30a94c8bdd8@socionext.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 2019/04/02 20:42, Sugaya, Taichi wrote:
> Hi,
> 
> On 2019/04/01 22:02, Sugaya, Taichi wrote:
>> Hi,
>>
>> On 2019/04/01 20:35, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, Apr 01, 2019 at 07:52:06PM +0900, Sugaya, Taichi wrote:
>>>> On 2019/04/01 18:10, Maxime Ripard wrote:
>>>>> Hi Sugaya, Arnd, Olof,
>>>>>
>>>>> On Thu, Mar 28, 2019 at 02:35:54PM -0500, Rob Herring wrote:
>>>>>> +arm-soc
>>>>>>
>>>>>> On Mon, Mar 18, 2019 at 5:05 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>>>>>>>
>>>>>>> Commit fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for
>>>>>>> Milbeaut") added support for a new cpu enable-method, but did so using
>>>>>>> tabulations to ident. This is however invalid in the syntax, and resulted
>>>>>>> in a failure when trying to use that schemas for validation.
>>>>>>>
>>>>>>> Use spaces instead of tabs to indent to fix this.
>>>>>>>
>>>>>>> Fixes: fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for Milbeaut")
>>>>>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>>>>>> ---
>>>>>>>    Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>>>
>>>>>> This should be applied to arm-soc tree having the commit.
>>>>>
>>>>> Could you pick up that patch?
>>>>
>>>> I got it.
>>>> My mission is to resubmit your fix-patch added my singned-off tag and
>>>> Rob's reviewed tag...right?
>>>
>>> If you are part of arm-soc and send your pull requests to Arnd and
>>> Olof, simply pick it up in the same branch than the initial patch was
>>> in. And when you apply that patch, you indeed need to add your
>>> Signed-off-by (note that most commands to commit have an option to do
>>> that automatically: -s and that includes git am) and the Rob's
>>> reviewed-by.
>>>
>>> Then, send a new pull request to arm-soc.
>>>
>>
>> Okay, thanks for your suggestion.
>> I try to make pull request!
>>
> 
> Sorry I realized that I couldn't make a private repository, so I'll send my Ack instead.

One correction: "a public repository"

> 
> Acked-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> 
>> Thanks,
>> Sugaya Taichi
>>
>>> Maxime
>>>
>>> -- 
>>> Maxime Ripard, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>>
