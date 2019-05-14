From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson: nanopi k2: add sd DDR50
Date: Tue, 14 May 2019 20:05:28 +0200
Message-ID: <CAFBinCC+TKf_WO_fwqEu8Gzc7r3od6xkCyN6-9hPz9-0nmEw0g@mail.gmail.com>
References: <20190513130507.22533-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190513130507.22533-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 3:05 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add UHS ddr50 mode to the nanopi k2
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

since I'm curious: is this due to your recent meson-gx-mmc patches?
this is the first board where we enable the UHS DDR50 mode


Martin
