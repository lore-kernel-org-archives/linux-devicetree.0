From: Amit Nischal <anischal@codeaurora.org>
Subject: Re: [PATCH v1 0/2] Add QCOM video clock controller driver
Date: Tue, 08 May 2018 10:23:23 +0530
Message-ID: <8ac8a361a7dc69cce1e7498f1473bad8@codeaurora.org>
References: <1525350925-16006-1-git-send-email-anischal@codeaurora.org>
 <152545146453.138124.2471609033510400995@swboyd.mtv.corp.google.com>
 <09ac2bd5eab25cfc70a1c5dc7b0f90ed@codeaurora.org>
 <20180507171121.GA22656@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507171121.GA22656@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-05-07 22:41, Rob Herring wrote:
> On Mon, May 07, 2018 at 04:16:53PM +0530, Amit Nischal wrote:
>> On 2018-05-04 22:01, Stephen Boyd wrote:
>> > Quoting Amit Nischal (2018-05-03 05:35:23)
>> > > Changes in v1:
>> > >    https://lkml.org/lkml/2018/4/24/545
>> > > Addressed below review comments given by Rob
>> > > - Change the compatible property as per '<vendor>,<soc>-<block>'
>> > > format.
>> > > - Add header definitions for resets and power-domain cells.
>> >
>> > You didn't add any reset definitions though?
>> 
>> We haven't added the reset definitions for videocc as there is no
>> video reset client.
> 
> So? You don't know what resets there are?
> 

We know the resets, but video driver doesn't do any block resets
prior to accessing the video subsystem so that's the reason we do
not want to expose the resets in videocc driver.

> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
