From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 3/3] ARM64: dts: meson-gxbb: Add GXBB AO Clock and Reset node
Date: Mon, 29 Aug 2016 12:37:37 -0500
Message-ID: <m260qjjx26.fsf@baylibre.com>
References: <1471514928-3341-1-git-send-email-narmstrong@baylibre.com>
        <1471514928-3341-4-git-send-email-narmstrong@baylibre.com>
        <7hk2fc76xx.fsf@baylibre.com>
        <147208015014.66208.14165603610884470316@resonance>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <147208015014.66208.14165603610884470316@resonance> (Michael
        Turquette's message of "Wed, 24 Aug 2016 16:09:10 -0700")
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Michael Turquette <mturquette@baylibre.com> writes:

> Quoting Kevin Hilman (2016-08-19 15:03:06)
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>> 
>> > Add the AO clock controller node for the AmLogic GXBB SoC.
>> >
>> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> > ---
>> 
>> Applying this to the amlogic tree, but will need to wait a cycle due to
>> include dependencies on the bindings, which are going through the clock
>> tree.
>
> FYI, for picked patches, Stephen and I create a stable branch for each
> platform. You can pull this into your tree if you want, just let us know
> so we'll be sure not to rebase:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-meson-gxbb-ao
>

OK, I'll be using clk-meson-gxb and clk-meson-gxbb-ao.

Thanks,

Kevin
