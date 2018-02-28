From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 3/3] mailbox: sunxi-msgbox: Add a new mailbox driver
Date: Wed, 28 Feb 2018 11:19:11 -0600
Message-ID: <fdf86770-6f45-3b3c-50ea-7a8363894639@sholland.org>
References: <20180228022714.30068-1-samuel@sholland.org>
 <20180228022714.30068-4-samuel@sholland.org>
 <20180228083214.h4oi2kmjjqmoyfhn@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228083214.h4oi2kmjjqmoyfhn@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 02/28/18 02:32, Maxime Ripard wrote:
> On Tue, Feb 27, 2018 at 08:27:14PM -0600, Samuel Holland wrote:
>> +	/*
>> +	 * The failure path should not disable the clock or assert the reset,
>> +	 * because the PSCI implementation in firmware relies on this device
>> +	 * being functional. Claiming the clock in this driver is required to
>> +	 * prevent Linux from turning it off.
>> +	 */
>> +	ret = clk_prepare_enable(clk);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable bus clock: %d\n", ret);
>> +		return ret;
>> +	}
> 
> You don't need it to be always on though. You only need it to be
> enabled when you access the registers (on both sides I guess?). So you
> could very well enable the clock in your registers accessors in Linux,
> and do the same in the ARISC firmware. That should work.

It does need to always be on because the *PSCI* implementation (ATF) also uses
SCPI concurrently with Linux (on a separate channel). Turning off the clock
anywhere in Linux could turn it off in the middle of a PSCI SCPI call on a
different CPU, causing ATF to hang in EL3 (which would be very bad).

> Maxime

Regards,
Samuel
