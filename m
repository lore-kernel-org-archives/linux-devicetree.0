From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: meson: add simple-framebuffer nodes
Date: Thu, 17 Jan 2019 12:58:04 -0800
Message-ID: <7hfttratnn.fsf@baylibre.com>
References: <20190116124030.16882-1-mjourdan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116124030.16882-1-mjourdan@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Maxime Jourdan <mjourdan@baylibre.com> writes:

> This patch series adds support for simplefb for the GXBB and GXL chips.
>
> simple-framebuffer allows sharing a framebuffer already setup by the
> firmware to the kernel for a seamless boot transition.
>
> It goes along with a u-boot patch series adding display support to
> GXBB & GXL [3].
>

Queued for v5.1 (branch: v5.1/dt64)

Kevin
