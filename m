From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] clk: Add driver for the si544 clock generator chip
Date: Mon, 19 Mar 2018 14:08:56 -0700
Message-ID: <152149373621.242365.4815290210815209160@swboyd.mtv.corp.google.com>
References: <1521114608-21967-1-git-send-email-mike.looijmans@topic.nl>
 <20180318125219.ar7f2n4o73ljz6vg@rob-hp-laptop>
 <ec813ab3-88db-f6e3-eca1-b6ea58936fcf@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ec813ab3-88db-f6e3-eca1-b6ea58936fcf@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

Quoting Mike Looijmans (2018-03-19 08:04:15)
> On 18-03-18 13:52, Rob Herring wrote:
> > On Thu, Mar 15, 2018 at 12:50:08PM +0100, Mike Looijmans wrote:
> >> +Required properties:
> >> + - compatible: One of "silabs,si514a", "silabs,si514b" "silabs,si514c" according
> >> +               to the speed grade of the chip.
> >> + - reg: I2C device address.
> >> + - #clock-cells: From common clock bindings: Shall be 0.
> >> +
> >> +Optional properties:
> >> + - clock-output-names: From common clock bindings. Recommended to be "si544".
> > 
> > What's the point if there is only 1 clock output?
> 
> I have a board with 6 of these chips, and the clock registration fails if they 
> don't have unique names. Providing a clock-output-names property was the 
> easiest way around it.
> 
> Should I just omit the line or change the wording to reflect the above or is 
> there a better solution (maybe I can use the DT node name as clock name in the 
> driver, will look into that)

I would leave clock-output-names for now. One day we can get off of
strings in CCF. Soon perhaps.

> 
> > 
> >> +
> >> +Example:
> >> +    si544: clock-generator@55 {
> > 
> > clock-controller@55 is the standard node name.
> 
> I'll change and post patch v3
> 

I made some comments on v1. Please fold those into v3.
