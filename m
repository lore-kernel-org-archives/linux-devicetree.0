From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH RESEND 05/12] drivers: clk: st: STiH407:
 Support for clockgenA0
Date: Fri, 27 Jun 2014 13:47:31 +0200
Message-ID: <CAG374jA7AWUod3vugJC1H5YEVE1XG5HLgCkgc=aQP5s+JSGZag@mail.gmail.com>
References: <1401892320-18211-1-git-send-email-gabriel.fernandez@linaro.org>
	<1401892320-18211-6-git-send-email-gabriel.fernandez@linaro.org>
	<20140605115714.GA2294@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140605115714.GA2294@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Mike Turquette <mturquette@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@stlinux.com" <kernel@stlinux.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Olivier Bideau <olivier.bideau@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 5 June 2014 13:57, Peter Griffin <peter.griffin@linaro.org> wrote:
> Hi Gabi,
>
> On Wed, 04 Jun 2014, Gabriel FERNANDEZ wrote:
>
>> The patch added support for DT registration of ClockGenA0
>> It includes c32 type PLL.
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
>> Signed-off-by: Olivier Bideau <olivier.bideau@st.com>
>> ---
>>  drivers/clk/st/clkgen-pll.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
>> index d8b9b1a..6916cfa 100644
>> --- a/drivers/clk/st/clkgen-pll.c
>> +++ b/drivers/clk/st/clkgen-pll.c
>> @@ -180,6 +180,18 @@ static struct clkgen_pll_data st_pll1200c32_gpu_416 = {
>>       .ops            = &st_pll1200c32_ops,
>>  };
>>
>> +static struct clkgen_pll_data st_pll3200c32_407_a0 = {
>> +     /* 407 A0 */
>> +     .pdn_status     = CLKGEN_FIELD(0x2a0,   0x1,                    8),
>> +     .locked_status  = CLKGEN_FIELD(0x2a0,   0x1,                    24),
>> +     .ndiv           = CLKGEN_FIELD(0x2a4,   C32_NDIV_MASK,          16),
>> +     .idf            = CLKGEN_FIELD(0x2a4,   C32_IDF_MASK,           0x0),
>> +     .num_odfs = 1,
>> +     .odf            = { CLKGEN_FIELD(0x2b4, C32_ODF_MASK,           0) },
>> +     .odf_gate       = { CLKGEN_FIELD(0x2b4, 0x1,                    6) },
>> +     .ops            = &stm_pll3200c32_ops,
>> +};
>> +
>>  /**
> I think these could be 'static const' as well, with some fixups in the function protoypes
> which use it.
>
Done
Thanks Peter

> Apart from that : -
>  Acked-by: Peter Griffin <peter.griffin@linaro.org>
>
> Regards,
>
> Peter
