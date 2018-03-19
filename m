From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-gx: make efuse read-only
Date: Mon, 19 Mar 2018 16:44:50 -0700
Message-ID: <7h370vsk99.fsf@baylibre.com>
References: <20180316145021.8517-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180316145021.8517-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Fri, 16 Mar 2018 15:50:21 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> efuse is one time programmable, so it is safer to deny write request
> to this memory, unless the user is savvy enough to remove the read-only
> flag from DTB
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to v4.17/dt64,

Thanks,

Kevin
