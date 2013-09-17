From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] clk: si570: Add a driver for SI570 oscillators
Date: Tue, 17 Sep 2013 10:14:01 -0600
Message-ID: <52387FC9.1080905@wwwdotorg.org>
References: <1379033737-30015-1-git-send-email-soren.brinkmann@xilinx.com> <1379033737-30015-2-git-send-email-soren.brinkmann@xilinx.com> <52373314.5070806@wwwdotorg.org> <20130916164927.GB21352@roeck-us.net> <5237390E.5070203@wwwdotorg.org> <20130916173540.GA3481@roeck-us.net> <52374FF7.8040604@wwwdotorg.org> <52380BD5.8080105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52380BD5.8080105@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mike Turquette <mturquette@linaro.org>, Hyun Kwon <hyunk@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 09/17/2013 01:59 AM, Sebastian Hesselbarth wrote:
> On 09/16/2013 08:37 PM, Stephen Warren wrote:
...
>> Perhaps if clock-frequency is specified, the driver should refuse to
>> provide anything else. If clock-frequency isn't specified, the driver
>> shouldn't touch the HW when it initializes, but should honor any
>> requests that come in from other drivers? That would maintain what I
>> feel is clock-frequency's connection to being a fixed clock.
> 
> For the clk-si5351 programmable clock driver in mainline, it already
> uses "clock-frequency" for initial clock setup but allows to set it
> later on. IMHO that is ok, because from a initial point-of-view, an
> initial frequency is fixed. As soon as the driver takes over, the user
> is free to do whatever he wants and should not be limited by DT.
> 
> But if we vote against that approach, we should probably also modifiy
> clk-si5351 accordingly.

I suppose that approach isn't unreasonable. So, if there's precedent for
it, this driver may as well follow it.
