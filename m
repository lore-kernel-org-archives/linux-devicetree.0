From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v3] clk: add si5351 i2c common clock driver
Date: Sat, 23 Mar 2013 11:07:16 +0100
Message-ID: <514D7ED4.2030205@metafoo.de>
References: <1360414772-12232-1-git-send-email-sebastian.hesselbarth@gmail.com> <1363603397-2762-1-git-send-email-sebastian.hesselbarth@gmail.com> <514B4CBF.7070106@metafoo.de> <514B7C80.2070008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <514B7C80.2070008@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Dom Cobley <popcornmix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rabeeh Khoury <rabeeh@solid-run.com>, Daniel Mack <zonque@gmail.com>, Jean-Francois Moine <moinejf@free.fr>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/21/2013 10:32 PM, Sebastian Hesselbarth wrote:
>>> +
>>> +    dev_info(&client->dev, "registered si5351 i2c client\n");
>>> +
>>
>> That's just noise, imagine every driver would print such a line, your bootlog
>> would be scrolling for hours ;) I'd either remove it or make it dev_dbg
> 
> Actually, I understand not to have it, but if you don't want it you can still
> boot with "quiet", can't you? Having one single line that helps you see it has
> been probed helps a lot. But, I don't have a strong opinion on that and can
> make it dev_dbg.

It is useful during development, but in my opinion only as long as not every
other driver does this as well. If you want to check whether a device has
been probed you can easily do this by checking the drivers sysfs node.

- Lars
