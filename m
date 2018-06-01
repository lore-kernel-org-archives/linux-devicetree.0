From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH 2/3] clk: bcm: Update and add tingray clock entries
Date: Fri, 1 Jun 2018 10:56:27 -0700
Message-ID: <a354f3d1-051d-8b68-e6b3-ce7a739c10c9@broadcom.com>
References: <1527266717-8406-1-git-send-email-ray.jui@broadcom.com>
 <1527266717-8406-3-git-send-email-ray.jui@broadcom.com>
 <20180531162556.GA955@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180531162556.GA955@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pramod Kumar <pramod.kumar@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 5/31/2018 9:25 AM, Rob Herring wrote:
> On Fri, May 25, 2018 at 09:45:16AM -0700, Ray Jui wrote:
>> Update and add Stingray clock definitions and tables so they match the
>> binding document and the latest ASIC datasheet
>>
>> Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
>> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
>> ---
>>   drivers/clk/bcm/clk-sr.c           | 135 ++++++++++++++++++++++++++++++++-----
>>   include/dt-bindings/clock/bcm-sr.h |  24 +++++--
> 
> This goes in the 1st patch.

Please help to confirm. You want 1st patch and 2nd patch to be combined 
into a single patch?

Thanks.

> 
>>   2 files changed, 137 insertions(+), 22 deletions(-)
