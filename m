From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH RESEND] arm64: dts: meson-axg: fix dtc warning about unit address
Date: Thu, 15 Nov 2018 11:49:14 -0800
Message-ID: <7hzhuadsud.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
References: <20181030150614.19461-1-jbrunet@baylibre.com> <20181108095156.26810-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108095156.26810-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> section 2.2.1 of the DT specs says: " If the node has no reg property,
> the @unit-address must be omitted and the node-name alone differentiates
> the node from other nodes at the same level in the tree"
>
> Simply replace the '@' with a '-' to fix this warning.
>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>
> Hi Kevin,
>
> I'm resending this change because I noticed the previous patch I sent had
> references to spdif input which has not been merged yet. This would have
> triggered a conflict in your tree.
>
> Hopefully, this new version will apply correctly

Thanks for the resend, this version applies (and builds) cleanly.

Queued for v4.21 with Neil's tag (branch: v4.21/dt64)

Kevin
