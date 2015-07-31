From: santosh shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 2/2] ARM: dts: keystone: fix dt bindings to use post div
 register for mainpll
Date: Fri, 31 Jul 2015 08:30:44 -0700
Message-ID: <55BB94A4.1010200@oracle.com>
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com>
 <1432915453-409-2-git-send-email-m-karicheri2@ti.com>
 <55BB8412.2000905@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55BB8412.2000905@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, ssantosh@kernel.org, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 7/31/2015 7:20 AM, Murali Karicheri wrote:
> On 05/29/2015 12:04 PM, Murali Karicheri wrote:
>> All of the keystone devices have a separate register to hold post
>> divider value for main pll clock. Currently the fixed-postdiv
>> value used for k2hk/l/e SoCs works by sheer luck as u-boot happens to
>> use a value of 2 for this. Now that we have fixed this in the pll
>> clock driver change the dt bindings for the same.
>>
>> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
>> ---

[..]

> Santosh,
>
> The clk driver update is already merged to v4.2-rc. Could you send this
> DT update as well for 4.2-rc?
>
Sure.

Regards,
Santosh
