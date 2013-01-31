From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH V3] regulators: anatop: add set_voltage_time_sel interface
Date: Thu, 31 Jan 2013 14:12:50 +0800
Message-ID: <20130131061248.GF2765@S2101-09.ap.freescale.net>
References: <1359649433-3691-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1359649433-3691-1-git-send-email-b20788@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Anson Huang <b20788@freescale.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, rob@landley.net, broonie@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2013 at 11:23:53AM -0500, Anson Huang wrote:
> some of anatop's regulators(cpu, vddpu and vddsoc) have
> register settings about LDO's step time, which will impact
> the LDO ramp up speed, need to use set_voltage_time_sel
> interface to add necessary delay everytime LDOs' voltage
> is increased.
> 
> offset 0x170:
> bit [24-25]: cpu
> bit [26-27]: vddpu
> bit [28-29]: vddsoc
> 
> field definition:
> 0'b00: 64 cycles of 24M clock;
> 0'b01: 128 cycles of 24M clock;
> 0'b02: 256 cycles of 24M clock;
> 0'b03: 512 cycles of 24M clock;
> 
> Signed-off-by: Anson Huang <b20788@freescale.com>

Acked-by: Shawn Guo <shawn.guo@linaro.org>

