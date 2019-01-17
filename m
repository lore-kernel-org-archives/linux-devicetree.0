From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
Date: Thu, 17 Jan 2019 12:02:57 -0800
Message-ID: <7hy37jaw7i.fsf@baylibre.com>
References: <20190116165236.8330-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116165236.8330-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> periph and hiu bus addresses/size are wrong.
> cbus, aobus and apb just don't exist in the memory map so remove them.
>
> Fixes: 9c8c52f7cb4f ("arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued as a fix for v5.0-rc (branch: v5.0/fixes)

Kevin
