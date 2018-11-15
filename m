From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-axg: s400: add cts-rts to the bluetooth uart
Date: Thu, 15 Nov 2018 11:55:56 -0800
Message-ID: <7htvkidsj7.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
References: <20181108095640.27876-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108095640.27876-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The uart used with bluetooth chipset on the s400 has flow control
> available. Let's enable it.

Queued for v4.21 with Neil's tag (branch: v4.21/dt64)

Kevin
