From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 0/3] dts: meson: add clock controllers input clocks
Date: Tue, 04 Dec 2018 17:07:54 -0800
Message-ID: <7hmupkbx1x.fsf@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203171640.12110-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset is the first step that needs to be done so the
> amlogic clock controllers properly claim their input clocks
> through DT instead of relying on fixed names.
>
> I'll be waiting for this hit mainline before sending the related
> driver changes.

Queued for v4.21 (branch: v4.21/dt64) with Stephen's tags.

nit: $SUBJECT on this cover letter is missing arm64 prefix (v2 had it)
and, some lazy maintainenrs like me are starting to rely on the new new
patchwork-bot which will auto-superseed series when a new version is
posted, but that relies on matching subjects.

Kevin
