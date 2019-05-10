From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a board node order
Date: Fri, 10 May 2019 14:46:47 -0700
Message-ID: <7hzhnuc794.fsf@baylibre.com>
References: <20190510155327.5759-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510155327.5759-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The order of the nodes in the u200 and sei510 is bit fancy.
> Order nodes by address, then node name, then aliases.
>
> This makes rebasing is little less painful

Fully agree.  Thanks for the cleanup.

Queued for v5.3 (branch: v5.3/dt64)

Kevin
