From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] ARM: mach-stm32: Add Extended TrustZone Protection
 driver
Date: Tue, 27 Feb 2018 17:14:19 +0000
Message-ID: <20180227171419.3nlz23qzptvew2as@lakrids.cambridge.arm.com>
References: <20180227140926.22996-1-benjamin.gaignard@st.com>
 <20180227140926.22996-4-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180227140926.22996-4-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 27, 2018 at 03:09:26PM +0100, Benjamin Gaignard wrote:
 +
> +static const u32 stm32mp1_ip_addr[] = {
> +	0x5c008000,	/* 00 stgenc */
> +	0x54000000,	/* 01 bkpsram */
> +	0x5c003000,	/* 02 iwdg1 */
> +	0x5c000000,	/* 03 usart1 */
> +	0x5c001000,	/* 04 spi6 */
> +	0x5c002000,	/* 05 i2c4 */

...

This duplicates information that is in the DT, which is unfortunate.

Why can these not be marked disabled inthe DT instead? 

If it's dynamic form boot-to-boot, then the FW can probe this prior to
entering Linux, and patch the DT appropriately.

Thanks,
Mark.
