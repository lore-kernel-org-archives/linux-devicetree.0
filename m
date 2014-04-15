From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 4/4] regulator: s5m8767: Use same binding for external
 control as in s2mps11
Date: Tue, 15 Apr 2014 13:26:41 +0530
Message-ID: <CAK9yfHwL4o7-7Q03dw9JdD1UDsP_v2=we1kadRXaGAuaN1de_g@mail.gmail.com>
References: <1397462949-22379-1-git-send-email-k.kozlowski@samsung.com>
	<1397462949-22379-5-git-send-email-k.kozlowski@samsung.com>
	<20140414211106.GC12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20140414211106.GC12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

On 15 April 2014 02:41, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Apr 14, 2014 at 10:09:09AM +0200, Krzysztof Kozlowski wrote:
>
>> -     - s5m8767,pmic-ext-control-gpios: (optional) GPIO specifier for one
>> +     - samsung,ext-control-gpios: (optional) GPIO specifier for one
>>               GPIO controlling this regulator (enable/disable); This is
>>               valid only for buck9.
>
> This is an incompatible change.  It's OK to deprecate the old property
> but it's bad form to just remove it.

I agree with Mark. Also, there is no need to make it generic.

-- 
With warm regards,
Sachin
