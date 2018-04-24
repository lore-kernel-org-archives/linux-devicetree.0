From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 03/10] drivers/peci: Add support for PECI bus driver
 core
Date: Tue, 24 Apr 2018 19:01:57 +0300
Message-ID: <1524585717.21176.504.camel@linux.intel.com>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
         <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180410183212.16787-4-jae.hyun.yoo@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Fengguang Wu <fengguang.wu@intel.com>, Greg KH <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>, Julia Cartwright <juliac@eso.teric.us>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>, Stef van Os <stef.van.o>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-04-10 at 11:32 -0700, Jae Hyun Yoo wrote:
> This commit adds driver implementation for PECI bus core into linux
> driver framework.
> 

All comments you got for patch 6 are applicable here.

And perhaps in the rest of the series.

The rule of thumb: when you get even single comment in a certain place,
re-check _entire_ series for the same / similar patterns!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
