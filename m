From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/2] ARM64: dts: meson-axg: enable wifi driver
Date: Wed, 09 May 2018 15:17:02 -0700
Message-ID: <7hlgcszd7l.fsf@baylibre.com>
References: <20180504094533.15588-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504094533.15588-1-yixun.lan@amlogic.com> (Yixun Lan's
        message of "Fri, 4 May 2018 09:45:31 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Yixun,

Yixun Lan <yixun.lan@amlogic.com> writes:

>  These patches try to enable the WIFI module AP6255 in Meson-AXG S400
> baord. First patch revert an error which was introduced in early commit.
>
> Hi Kevin
>  Please squash patch 1 into the commit[1] of your v4.18/dt64 branch,
> which was the error introduced there.

Thanks for the explanation, I've squashed patch 1, and applied patch 2
to v4.18/dt64.

Thanks,

Kevin
