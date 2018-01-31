From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 0/5] ARM64: dts: meson-axg: UART DT updates
Date: Tue, 30 Jan 2018 16:22:41 -0800
Message-ID: <CAOi56cW4ufsegpy7heK1+pCxvZ2gz5Lf3dkUgxkZCgMq5oBzSA@mail.gmail.com>
References: <20180111023401.125658-1-yixun.lan@amlogic.com> <7hr2q6c2r4.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hr2q6c2r4.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 30, 2018 at 4:04 PM, Kevin Hilman <khilman@baylibre.com> wrote:
> Yixun Lan <yixun.lan@amlogic.com> writes:
>
>> HI Kevin
>>  These are the UART DT updates for the Meson-AXG platform.
>>
>>  The patch 1 is a general fix.
>> Other patches are about adding clock & pinctrl info, then using them.
>> Last patch enable UART_A which connect to a BT module on the S400 board.
>
> Applied to v4.16/dt64,

Oops, I meant v4.17.

Kevin
