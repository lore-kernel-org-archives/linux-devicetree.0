From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 1/2] clk: keystone: add support for post divider register
 for main pll
Date: Thu, 18 Jun 2015 15:55:32 -0700
Message-ID: <55834C64.6020703@oracle.com>
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com>
 <20150618223728.9112.75331@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150618223728.9112.75331@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@linaro.org>, Murali Karicheri <m-karicheri2@ti.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ssantosh@kernel.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 6/18/2015 3:37 PM, Michael Turquette wrote:
> Quoting Murali Karicheri (2015-05-29 09:04:12)
>> Main PLL controller has post divider bits in a separate register in
>> pll controller. Use the value from this register instead of fixed
>> divider when available.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>
> Applied to clk-next.
>
Thanks Mike !!
