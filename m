From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5.1 2/2] ARM: dts: meson6: use stable UART bindings
Date: Tue, 08 Aug 2017 14:49:47 -0700
Message-ID: <7hwp6dn30k.fsf@baylibre.com>
References: <1498056132-18508-1-git-send-email-narmstrong@baylibre.com>
        <1498056132-18508-3-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498056132-18508-3-git-send-email-narmstrong@baylibre.com> (Neil
        Armstrong's message of "Wed, 21 Jun 2017 16:42:12 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: hgkr.klein@gmail.com, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The UART bindings needs specifying a SoC family, use the meson6 family
> for the UART nodes like the other nodes.
> Switch to the stable UART bindings for meson6 by adding a XTAL node and
> using the proper compatible strings.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to v4.14/dt,

Thanks,

Kevin
