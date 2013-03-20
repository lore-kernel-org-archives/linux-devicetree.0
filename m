From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v3] clk: add si5351 i2c common clock driver
Date: Wed, 20 Mar 2013 09:20:16 +0100
Message-ID: <51497140.9020804@gmail.com>
References: <1360414772-12232-1-git-send-email-sebastian.hesselbarth@gmail.com> <1363603397-2762-1-git-send-email-sebastian.hesselbarth@gmail.com> <20130320002623.8663.55217@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130320002623.8663.55217@quantum>
Sender: linux-doc-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Dom Cobley <popcornmix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rabeeh Khoury <rabeeh@solid-run.com>, Daniel Mack <zonque@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/20/2013 01:26 AM, Mike Turquette wrote:
> Quoting Sebastian Hesselbarth (2013-03-18 03:43:17)
>> This patch adds a common clock driver for Silicon Labs Si5351a/b/c
>> i2c programmable clock generators. Currently, the driver supports
>> DT kernels only and VXCO feature of si5351b is not implemented. DT
>> bindings selectively allow to overwrite stored Si5351 configuration
>> which is very helpful for clock generators with empty eeprom
>> configuration. Corresponding device tree binding documentation is
>> also added.
>>
>> Signed-off-by: Sebastian Hesselbarth<sebastian.hesselbarth@gmail.com>
>> ---
>> Changes from v2:
>> - add curly brackets to if-else-statements (Reported by Daniel Mack)
>> - fix div-by-zero for clk6/clk7 (Reported by Daniel Mack)
>> - fix parameter address calculation for clk6/clk7
>>
>> Changes from v1:
>> - remove .is_enabled functions as they read from i2c
>>    (Reported by Daniel Mack)
>> - add CLK_SET_RATE_PARENT on clkout reparent if clkout uses
>>    its own multisync
>>
>
> I've just pushed out a new clk-next branch which includes Ulf Hansson's
> series to introduce the .is_prepared callback.  Perhaps you can use that
> where you were previously using .is_enabled?

Mike,

thanks for the info, but I think having .prepare_enable and regmap caching
is just fine for now. When .is_prepared is in mainline, I will re-add the
callbacks.

Sebastian
