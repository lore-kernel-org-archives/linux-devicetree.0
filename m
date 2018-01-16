From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: meson-axg: enable hardware rng
Date: Tue, 16 Jan 2018 15:42:18 -0800
Message-ID: <7hinc1cqw5.fsf@baylibre.com>
References: <20171218113546.13116-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171218113546.13116-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Mon, 18 Dec 2017 12:35:46 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Enable the hardware random generator
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Hi Kevin,
>
> This patch depends on the changes adding the ethernet controller [0],
> for including the axg clock binding header.

Thanks for describing the dependencies.

Queueing for v4.17 (branch: v4.17/dt64)

Kevin
