From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] clk: add DT test clock consumer driver
Date: Sat, 16 Mar 2013 14:56:54 +0000
Message-ID: <201303161456.54246.arnd@arndb.de>
References: <1363439376-21294-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1363439376-21294-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Saturday 16 March 2013, Sebastian Hesselbarth wrote:
> This driver adds a DT test clock consumer that exposes debugfs files to
> enable/disable and set/get rate of the attached programmable clock.
> During development of a i2c-attached clock generator I found it useful
> to debug the clock generator's internal pll settings by enforcing clock
> rates through debugfs.
> 
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

It sounds a little clumsy to have a device driver to match a device that
you create just for matching the driver.

Would it be possible to separate the debugging logic from the platform
device logic? I think it may be useful to have a debugfs or sysfs
inteface for all clocks in the system, even if that is disabled by
default or only available after manually loading a module implementing
that functionality.

	Arnd
