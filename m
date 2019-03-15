From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: add secure monitor and efuse
Date: Fri, 15 Mar 2019 13:45:37 -0700
Message-ID: <7h5zsjc1e6.fsf@baylibre.com>
References: <20190315134244.14141-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315134244.14141-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds the secure monitor and efuse to the g12a SoC family.
> These are sent together because the secure monitor is required for the
> efuse driver to work properly. This is probably something the bindings
> should show but it was not designed that way when the secure monitor was
> introduced ... something to look at someday.

Queued for v5.2 (branch: v5.2/dt64)

Thanks,

Kevin
