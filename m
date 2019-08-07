From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] ARM: dts: sun8i: a83t: Enable HDMI output on Cubietruck Plus
Date: Wed, 7 Aug 2019 14:06:31 +0800
Message-ID: <CAGb2v64P6BtZp+nRSG+Qegpx3bO-ie_GHdYpRjJM3Uf0mwvTLA@mail.gmail.com>
References: <20190728145944.4091-1-wens@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190728145944.4091-1-wens@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 10:59 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> The Cubietruck Plus has an HDMI connector tied to the HDMI output of the
> SoC.
>
> Enables display output via HDMI on the Cubietruck Plus. The connector
> device node is named "hdmi-connector" as there is also a display port
> connector, which is tied to the MIPI DSI output of the SoC through a
> MIPI-DSI-to-DP bridge. This part is not supported yet.
>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied for 5.4.
