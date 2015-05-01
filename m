From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 0/4] clk: si5351: Some fixes
Date: Fri, 01 May 2015 11:30:18 +0200
Message-ID: <554347AA.3070502@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com> <20150501111406.0aa23c7b@armhf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150501111406.0aa23c7b@armhf>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Welling <mwelling@ieee.org>, Russell King <rmk+linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01.05.2015 11:14, Jean-Francois Moine wrote:
> On Thu, 30 Apr 2015 19:45:50 +0200
> Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com> wrote:
>> For Si5351 clock driver, Michael Welling and Jean-Francois Moine reported
>> issues with recent v4.x kernels due to broken/missing/wrong parent clock
>> claming. This patch set now deals with the issues reported.
>>
>> Patch 1 amends the binding documentation mention clock-names property
>> for the "xtal" and "clkin" parent clock inputs of Si5351 variants.
>>
>> Patch 2 adds the clock-names property for the SolidRun CuBox using Si5351
>> with a fixed oscillator connected to "xtal" input.
>>
>> Patch 3 reworks the way we claim parent clocks by using devm_clk_get()
>> for both DT and platform_data based registration. Also, properly check
>> for errors returned by devm_clk_get() and prepare/enable the parent clocks.
[...]
>
> I applied the patches 2 and 3, and the audio and video in the Cubox
> work fine again. Thanks.

Ok, good. You mentioned that on v3.19-rc1 it still "works" i.e. despite
the broken/missing clk_get/clk_prepare_enable?

Can you check the stable (v3.19, v4.0) versions and see how far we
should backport the fix?

Sebastian
