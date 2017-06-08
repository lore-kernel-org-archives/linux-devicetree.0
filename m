From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/15] clk: Add Ingenic jz4770 CGU driver
Date: Thu, 08 Jun 2017 23:10:06 +0200
Message-ID: <f2ef2abdef9054e9916e10f588e8fec4@crapouillou.net>
References: <20170607200439.24450-1-paul@crapouillou.net>
 <20170607200439.24450-5-paul@crapouillou.net>
 <20170607205943.GO20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170607205943.GO20170@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

>> +	register_syscore_ops(&jz4770_cgu_pm_ops);
>> +#endif
>> +}
>> +CLK_OF_DECLARE(jz4770_cgu, "ingenic,jz4770-cgu", jz4770_cgu_init);
> 
> Any reason this can't be a platform driver? Please add a comment
> above CLK_OF_DECLARE describing what is preventing that.

It would probably be possible, if we cared about having a platform 
driver.
But we will only ever probe it from devicetree, just like with the
already existing jz4740-cgu and jz4780-cgu drivers.

>> diff --git a/include/dt-bindings/clock/jz4770-cgu.h 
>> b/include/dt-bindings/clock/jz4770-cgu.h
>> new file mode 100644
>> index 000000000000..54b8b2ae4a73
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/jz4770-cgu.h
> 
> Can you split this file off into a different patch? That way clk
> tree can apply clk patches on top of a stable branch where this
> file lives by itself.

Sure.

Thanks,
- Paul
