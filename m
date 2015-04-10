From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH 2/2] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Date: Fri, 10 Apr 2015 06:36:56 +0000
Message-ID: <1428647815.5325.3.camel@synopsys.com>
References: <1428483478-22771-1-git-send-email-abrodkin@synopsys.com>
	 <1428483478-22771-2-git-send-email-abrodkin@synopsys.com>
	 <1428614903.17822.4.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428614903.17822.4.camel@x220>
Content-Language: en-US
Content-ID: <886ECAF10F280144842AAB7FDAC5B16E@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "pebolle@tiscali.nl" <pebolle@tiscali.nl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>, "Francois.Bedard@synopsys.com" <Francois.Bedard@synopsys.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Paul,

On Thu, 2015-04-09 at 23:28 +-0200, Paul Bolle wrote:
+AD4- What happened to 1/2? Whatever that was, I spotted a license mismatch in
+AD4- this 2/2.
+AD4- 
+AD4- On Wed, 2015-04-08 at 11:57 +-0300, Alexey Brodkin wrote:
+AD4- +AD4- --- /dev/null
+AD4- +AD4- +-+-+- b/drivers/mtd/nand/axs+AF8-nand.c
+AD4- +AD4- +AEAAQA- -0,0 +-1,412 +AEAAQA-
+AD4- +AD4- +-/+ACo-
+AD4- +AD4- +- +ACo- Copyright (C) 2014 Synopsys, Inc. (www.synopsys.com)
+AD4- +AD4- +- +ACo-
+AD4- +AD4- +- +ACo- Driver for NAND controller on Synopsys AXS development board.
+AD4- +AD4- +- +ACo-
+AD4- +AD4- +- +ACo- This file is subject to the terms and conditions of the GNU General Public
+AD4- +AD4- +- +ACo- License v2. See the file COPYING in the main directory of this archive for
+AD4- +AD4- +- +ACo- more details.
+AD4- +AD4- +- +ACo-/
+AD4- 
+AD4- This states the license of this file is GPL v2.
+AD4- 
+AD4- +AD4- +-MODULE+AF8-LICENSE(+ACI-GPL+ACI-)+ADs-
+AD4- 
+AD4- According to include/linux/module.h this states the license is GPL v2 or
+AD4- later.

I'm really sorry for this noise.

I meant to send a WIP patch for internal review and due to hard-coded
CCs in the patch +ACI-get send-email+ACI- automatically added all of you in the
CC field.

I'll try to be more careful next time.

And anyway I'm planning to submit this patch (probably with some more
fixes) for normal review sometime soon.

-Alexey
