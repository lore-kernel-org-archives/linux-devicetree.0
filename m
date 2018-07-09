From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH RESEND] ARM64: dts: meson-axg: add the audio clock controller
Date: Mon, 09 Jul 2018 14:53:13 -0700
Message-ID: <7h7em4nkja.fsf@baylibre.com>
References: <20180706144305.30116-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180706144305.30116-1-jbrunet@baylibre.com> (Jerome Brunet's
        message of "Fri, 6 Jul 2018 16:43:05 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Carlo Caione <carlo@caione.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add the audio clock controller which is part of the audio bus
> This controller takes 8 input plls, and the usual clock gate, from the
> main clock controller. It provides the clocs for the all the devices of
> the audio subsystem, such as tdms, spdif, pdm, etc.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>
> Resend to fix typo reported by Martin in the commit description.
> (Thx Martin !)
>
> Kevin,
>
> Please note that this change depends on the axg audio clock bindings [0].
>
> It explains the problem reported by kbuild robot
> It will be part of our PR to clock in this cycle.
>
> As usual, I've prepared a topic branch with the DT changes for you.
> Please, let me know when you need a tag on it.

Unless you're expecting some more dependencies for the v4.19 cycle,
please tag it now, then I will queue it up.

Kevin
