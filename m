From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: axg-tdm-formatter: add g12a reset
Date: Wed, 28 Aug 2019 08:05:38 -0700
Message-ID: <7hy2zds531.fsf@baylibre.com>
References: <20190823154432.16268-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823154432.16268-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset add the possibility to provide a reset to the tdm formatter.
> Such reset is available on the g12a SoC family and helps solve a random
> channel output shift when using more than one output lane.
>
> Changes since v1 [0]:
> - Rebased on kevin's tree

Queued for v5.4,

Thanks,

Kevin
