From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson: disable sd-uhs modes on the libretech-cc
Date: Fri, 27 Apr 2018 12:15:39 -0700
Message-ID: <7hvacczcis.fsf@baylibre.com>
References: <20180426105046.14817-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180426105046.14817-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Thu, 26 Apr 2018 12:50:46 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> There is a problem with the sd-uhs mode when doing a soft reboot.
> Switching back from 1.8v to 3.3v messes with the card, which no longer
> respond (timeout errors). According to the specification, we should
> perform a card reset (power cycling the card) but this is something we
> cannot control on this design.
>
> Then the only solution to restore the communication with the card is an
> "unplug-plug" which is not acceptable
>
> Until we find a solution, if any, disable the sd-uhs modes on this design.
> For the people using uhs at the moment, there will a performance drop as
> a result.
>
> Fixes: 3cde63ebc85c ("ARM64: dts: meson-gxl: libretech-cc: enable high speed modes")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to v4.17/fixes, and adding a Cc to stable.

Thanks,

Kevin
