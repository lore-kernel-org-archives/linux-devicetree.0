From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: s400: fix emmc maximum rate
Date: Thu, 17 Jan 2019 12:03:41 -0800
Message-ID: <7hr2dbaw6a.fsf@baylibre.com>
References: <20190116175947.6093-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116175947.6093-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Limiting the HS200 rate on the s400 was just a way to mask that the
> tuning setting were not correct. This seems to have been fixed with
> the recent MMC driver update. We can now use HS200 at full speed.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.1,

Thanks,

Kevin
