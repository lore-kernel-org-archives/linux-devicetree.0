From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/5] arm64: dts: meson: audio updates
Date: Tue, 24 Sep 2019 11:34:51 -0700
Message-ID: <7hk19x7dbo.fsf@baylibre.com>
References: <20190905125956.4384-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190905125956.4384-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The patchset features a few updates to prepare the addition of the audio
> on sm1. It fixes the register range of audio fifo which was incorrect.
>
> It also create another layer of dtsi, common to g12a and g12b but not sm1.
> The audio related device are moved to this file.
>
> This was done because the audio bus, which was at 0xff642000 on g12, has
> moved 0xff660000 on sm1. Overwriting the reg property was option but it
> would have left confusing node names on the sm1.
>
> Jerome Brunet (5):
>   arm64: dts: meson: axg: fix audio fifo reg size
>   arm64: dts: meson: g12: fix audio fifo reg size
>   arm64: dts: meson: g12: add a g12 layer
>   arm64: dts: meson: g12: factor the power domain.
>   arm64: dts: meson: g12: move audio bus out of g12-common

Queued for v5.5,

Kevin
