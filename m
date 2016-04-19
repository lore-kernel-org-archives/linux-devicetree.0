From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] ARM: dts: r8a7791: Don't disable referenced optional clocks
Date: Tue, 19 Apr 2016 09:18:55 +0200
Message-ID: <CAMuHMdWcsi0XE6htZW=V5DDKy8LX_1rdBoo_dEeDBvLcDeMFvw@mail.gmail.com>
References: <1459947173-6664-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459947173-6664-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 6, 2016 at 2:52 PM, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
> clk_get on a disabled clock node will return EPROBE_DEFER, which can
> cause drivers to be deferred forever if such clocks are referenced in
> their clocks property.
>
> Update the various disabled external clock nodes to default to a
> frequency of 0, but don't disable them to prevent this.
>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert
