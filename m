From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] soc: amlogic: clk-measure: fix-up some clock definitions
Date: Thu, 07 Feb 2019 16:52:48 -0800
Message-ID: <7hr2cjf6e7.fsf@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com> <20190207132603.694-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207132603.694-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> As pointed out in review, a few clock are not properly defined.
>
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Fixes: 2a4c63e080cd ("soc: amlogic: clk-measure: add axg and g12a support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

I squashed this with the original too.

In doing so, I noticed I (mis)applied this to my dt64 branch, so while
sqaushing, I also moved it to my drivers branch.

Thanks,

Kevin
