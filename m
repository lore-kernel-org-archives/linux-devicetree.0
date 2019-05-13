From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 5/5] arm64: dts: meson: sei510: add network support
Date: Mon, 13 May 2019 09:31:30 -0700
Message-ID: <7hftpico4d.fsf@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com> <20190510164940.13496-6-jbrunet@baylibre.com> <7ho94ac4jn.fsf@baylibre.com> <bf1360ab62a4e7bd3928052ebb6c969e8059f29e.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bf1360ab62a4e7bd3928052ebb6c969e8059f29e.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Fri, 2019-05-10 at 15:45 -0700, Kevin Hilman wrote:
>> Jerome Brunet <jbrunet@baylibre.com> writes:
>> 
>> > Enable the network interface of the SEI510 which use the internal PHY.
>> > 
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> 
>> I tried testing this series on SEI510, but I must still be missing some
>> defconfig options, as the default defconfig doesn't lead to a working
>> interface.
>
> That's weird. AFAICT, the net part has hit Linus's tree.

Ah, that's the key ingredient.  I was testing with a v5.1 baseline (not
linus/master) along with all my queued up changes.  I just pulled in
linus/master to test this series, and indeed, everything works, and I
don't need my config fragment either.

Thanks for clarifying.

If repost needed, feel free to add

Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin
