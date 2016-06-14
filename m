From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 00/19] ARM: dts: renesas: Name pfc subnodes after device
 names
Date: Tue, 14 Jun 2016 09:13:14 +0900
Message-ID: <20160614001313.GB6456@verge.net.au>
References: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1465563665-2231-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 03:00:46PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> Currently board DTS files use various naming conventions for the Pin
> Function Controller subnodes.  This may cause conflicts when enabling
> support for more instances later, either directly in board DT files, or
> in DT overlays.  These conflicts are most likely to happen for devices
> that use/require aliases (e.g. "serial1"), or when using generic and
> indexless names (e.g. "mmc").  Hence this series changes the names of
> (most of) the submodes, to match the corresponding device names, which
> are unique on a specific SoC.
> 
> I did not change the following node names:
>   - "sdX", as they always matched the corresponding "sdhiX" name,
>   - "touchscreen", as there's not much opportunity for conflicts,
>   - "mmc", for "mmcif_pins" on sh73a0/kzm9g (which has a single mmc
>     instance),
>   - "sounda" for fsia_pins on SH-Mobile,
> If you think these should be changed too, please let me know.

Thanks, I think this looks good, I have queued up this series.

I don't see any pressing need to rename the nodes you mention above
and we can always do so later if the need arises.
