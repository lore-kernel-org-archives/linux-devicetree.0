From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add reset control properties
 for audio
Date: Wed, 14 Jun 2017 11:00:48 +0200
Message-ID: <20170614090047.GE26958@verge.net.au>
References: <1497259937-9387-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1497259937-9387-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 12, 2017 at 11:32:15AM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Morimoto-san,
> 
> This patch series describes all resets wired to the audio modules on
> R-Car Gen3 SoCs, following the DT binding update in commit
> 5f440c48c5d5a11f ("ASoC: rsnd: Document optional reset properties") in
> sound-asoc/for-next.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   arm64: dts: r8a7795: Add reset control properties for audio
>   arm64: dts: r8a7796: Add reset control properties for audio

Thanks, I have queued these up for v4.13.
