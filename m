Return-Path: <SRS0=zIKt=ZO=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: document renesas-ostm timer
References: <20170127200215.4894-1-chris.brandt@renesas.com>
 <20170127200215.4894-2-chris.brandt@renesas.com>
 <20170201154528.r6r3walhou24wlpf@rob-hp-laptop>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d008ef1b-d229-b868-0938-524734200940@linaro.org>
Date: Wed, 1 Feb 2017 16:46:25 +0100
MIME-Version: 1.0
In-Reply-To: <20170201154528.r6r3walhou24wlpf@rob-hp-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Chris Brandt <chris.brandt@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 01/02/2017 16:45, Rob Herring wrote:
> On Fri, Jan 27, 2017 at 03:02:14PM -0500, Chris Brandt wrote:
>> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> v3:
>> * changed ostm@fcfec000 to timer@fcfec000 in example
>> * added power-domains in example
>> v2:
>> * remove sw implementation specific portions
>> ---
>>  .../devicetree/bindings/timer/renesas,ostm.txt     | 30 ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
> 
> I see this is already applied, but for the record:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, I will update the tag.


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
