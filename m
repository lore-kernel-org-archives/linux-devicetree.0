From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 0/2] peci: aspeed: Add AST2600 compatible
Date: Wed, 2 Oct 2019 11:11:28 -0700
Message-ID: <70044749-785b-6ff3-7a28-fb049dcfec54@linux.intel.com>
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Cc: jason.m.bills@linux.intel.com, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@aj.id.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ryan_chen@aspeedtech.com
List-Id: devicetree@vger.kernel.org

Hi Chia-Wei,

On 10/1/2019 11:11 PM, Chia-Wei, Wang wrote:
> Update the Aspeed PECI driver with the AST2600 compatible string.
> A new comptabile string is needed for the extended HW feature of
> AST2600.
> 
> Chia-Wei, Wang (2):
>    peci: aspeed: Add AST2600 compatible string
>    dt-bindings: peci: aspeed: Add AST2600 compatible
> 
>   Documentation/devicetree/bindings/peci/peci-aspeed.txt | 1 +
>   drivers/peci/peci-aspeed.c                             | 1 +
>   2 files changed, 2 insertions(+)
> 

PECI subsystem isn't in linux upstream yet so you should submit it into
OpenBMC dev-5.3 tree only.

Cheers,

Jae
