From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] ARM64: dts: meson-gx: increase default shared CMA pool size
Date: Wed, 12 Sep 2018 20:59:54 -0700
Message-ID: <7hd0tixd1h.fsf@baylibre.com>
References: <1536085844-29328-1-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536085844-29328-1-git-send-email-christianshewitt@gmail.com>
        (Christian Hewitt's message of "Tue, 4 Sep 2018 22:30:43 +0400")
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> Devices using the new V4L2 mem2mem vdec require a larger CMA pool. As
> nearly all GX* devices are video/media focused and will use it, set a
> larger (256MB) default value.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Applied to v4.20/dt64,

Kevin
