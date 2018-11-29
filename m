From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v5 0/3] arm64: dts: meson-gxl: add support for phicomm n1
Date: Wed, 28 Nov 2018 16:10:37 -0800
Message-ID: <7hsgzkd9qa.fsf@baylibre.com>
References: <20181110033904.4207-1-yangxuan8282@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181110033904.4207-1-yangxuan8282@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, carlo@caione.org, narmstrong@baylibre.com, He Yangxuan <yangxuan8282@gmail.com>
List-Id: devicetree@vger.kernel.org

He Yangxuan <yangxuan8282@gmail.com> writes:

> This patch adds support for the Phicomm N1. This device based on P230 reference design.
> The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE) to make it stable.
> And this box doesn't have cvbs, so disable related section in device tree.

Thanks for the series.

Queued for v4.21 (branch: v4.21/dt64)

Kevin
