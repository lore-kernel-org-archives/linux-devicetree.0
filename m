From: "Sugaya, Taichi" <sugaya.taichi@socionext.com>
Subject: Re: [PATCH] dt-bindings: cpu: Fix JSON schema
Date: Mon, 1 Apr 2019 19:52:06 +0900
Message-ID: <78bb248e-56b8-b825-e763-583f75148eb3@socionext.com>
References: <20190318100521.29109-1-maxime.ripard@bootlin.com>
 <CAL_JsqJ_LYycXazkdP2Q=e-jynKiX+z5En0bz0AWpDjsevwQTg@mail.gmail.com>
 <20190401091050.cwph7xlpv3pmkwnq@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401091050.cwph7xlpv3pmkwnq@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, ARM-SoC Maintainers <arm@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Thanks for pointing my bug.

On 2019/04/01 18:10, Maxime Ripard wrote:
> Hi Sugaya, Arnd, Olof,
> 
> On Thu, Mar 28, 2019 at 02:35:54PM -0500, Rob Herring wrote:
>> +arm-soc
>>
>> On Mon, Mar 18, 2019 at 5:05 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>>>
>>> Commit fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for
>>> Milbeaut") added support for a new cpu enable-method, but did so using
>>> tabulations to ident. This is however invalid in the syntax, and resulted
>>> in a failure when trying to use that schemas for validation.
>>>
>>> Use spaces instead of tabs to indent to fix this.
>>>
>>> Fixes: fd73403a4862 ("dt-bindings: arm: Add SMP enable-method for Milbeaut")
>>> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>>> ---
>>>   Documentation/devicetree/bindings/arm/cpus.yaml | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> This should be applied to arm-soc tree having the commit.
> 
> Could you pick up that patch?
> 

I got it.
My mission is to resubmit your fix-patch added my singned-off tag and
Rob's reviewed tag...right?

Thanks,
Sugaya Taichi

> Thanks!
> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
