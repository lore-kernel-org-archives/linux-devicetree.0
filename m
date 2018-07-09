From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/3] ARM64: dts: meson-axg: first round of daughter card updates
Date: Mon, 09 Jul 2018 14:46:07 -0700
Message-ID: <7hsh4snkv4.fsf@baylibre.com>
References: <20180628095054.13433-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628095054.13433-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Thu, 28 Jun 2018 11:50:51 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds a speaker amplifier and some leds present on daughter
> cards which are connected to the s400 board.
>
> Kevin, please note that the bindings documentation update for the tas5707
> has been queued for next in Mark Brown's ASoC tree. Not having it won't
> break anything but you may get checkpatch warning.

Thanks for the warning.

Series applied to v4.19/dt64,

Kevin
