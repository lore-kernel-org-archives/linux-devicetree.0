From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 3/3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Thu, 28 Aug 2014 01:09:14 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E980AF7@SHSMSX101.ccr.corp.intel.com>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com>
 <1409161588-19417-4-git-send-email-alvin.chen@intel.com>
 <alpine.DEB.2.02.1408271103120.11131@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1408271103120.11131@atx-linux-37>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, "yvanderv@opensource.altera.com" <yvanderv@opensource.altera.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

> 
> Hi Weike,
> 
> I tried out these patches on the current master branch (v3.17-rc2-9-g68e3702)
> with a socfpga cyclone5 board.
> 
> If I apply all 3 patches, the kernel doesn't boot.
> 
> If I rebuild with only the first patch, I get only one gpio block showing up (should
> have 3 for this board) and these messages:
> 
> 
> How are you testing this?
The patches try to not change the current OF flow, and from the log message, the other two GPIO registered failed due to duplicate name.
Let me check the code to see what happen.


> 
> Alan
