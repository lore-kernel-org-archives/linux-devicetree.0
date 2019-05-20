From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: meson: u200: add internal network
Date: Mon, 20 May 2019 19:38:32 +0200
Message-ID: <CAFBinCAuPqRtWydk=gbB-H1iMGOR-HbMAo6NnM=6Xyi784LV2Q@mail.gmail.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com> <20190520131401.11804-5-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190520131401.11804-5-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 20, 2019 at 3:14 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The u200 is the main mother board for the S905D2. It can provide
> both the internal and external network. However, by default the
> resistance required for the external RGMII bus are not fitted, so
> enable the internal PHY.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
I don't have this board but it looks sane so:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
