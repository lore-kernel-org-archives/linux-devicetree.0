From: Marcin Nowakowski <marcin.nowakowski@mips.com>
Subject: Re: [PATCH 1/2] nvmem: add driver for JZ4780 efuse
Date: Thu, 28 Dec 2017 08:13:33 +0100
Message-ID: <bbc64846-e12e-aea8-c516-5e03f6253fed@mips.com>
References: <20171227122722.5219-1-malat@debian.org>
 <20171227122722.5219-2-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171227122722.5219-2-malat@debian.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>, Zubair.Kakakhel@mips.com
Cc: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linus.walleij@linaro.org>, Harvey Hunt <harvey.hunt@imgtec.com>, James Hogan <jhogan@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Hi Mathieu, PrasannaKumar,

On 27.12.2017 13:27, Mathieu Malaterre wrote:
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> 
> This patch brings support for the JZ4780 efuse. Currently it only expose
> a read only access to the entire 8K bits efuse memory.
> 
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> ---

> +
> +/* main entry point */
> +static int jz4780_efuse_read(void *context, unsigned int offset,
> +					void *val, size_t bytes)
> +{
> +	static const int nsegments = sizeof(segments) / sizeof(*segments);
> +	struct jz4780_efuse *efuse = context;
> +	char buf[32];
> +	char *cur = val;
> +	int i;
> +	/* PM recommends read/write each segment separately */
> +	for (i = 0; i < nsegments; ++i) {
> +		unsigned int *segment = segments[i];
> +		unsigned int lpos = segment[0];
> +		unsigned int buflen = segment[1] / 8;
> +		unsigned int ncount = buflen / 32;
> +		unsigned int remain = buflen % 32;
> +		int j;

This doesn't look right, as offset & bytes are completely ignored. This 
means it will return data from an offset other than requested and may 
also overrun the provided output buffer?

> +		/* EFUSE can read or write maximum 256bit in each time */
> +		for (j = 0; j < ncount ; ++j) {
> +			jz4780_efuse_read_32bytes(efuse, buf, lpos);
> +			memcpy(cur, buf, sizeof(buf));
> +			cur += sizeof(buf);
> +			lpos += sizeof(buf);
> +			}
> +		if (remain) {
> +			jz4780_efuse_read_32bytes(efuse, buf, lpos);
> +			memcpy(cur, buf, remain);
> +			cur += remain;
> +			}
> +		}
> +
> +	return 0;
> +}


Marcin
