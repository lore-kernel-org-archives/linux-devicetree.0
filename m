From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V2] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Thu, 15 Feb 2018 19:25:14 +0100
Message-ID: <20180215182514.jaixuo5wrmlylucj@verge.net.au>
References: <20180215100301.24744-1-marek.vasut+renesas@gmail.com>
 <20180215100936.dz62mm3h2zbsuf2j@katana>
 <4dfaaccb-c384-c640-d801-116e01410c22@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4dfaaccb-c384-c640-d801-116e01410c22@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 15, 2018 at 11:11:51AM +0100, Marek Vasut wrote:
> On 02/15/2018 11:09 AM, Wolfram Sang wrote:
> > 
> >> +		stdout-path = "serial0:38400n8";
> > 
> > Didn't you want to change U-Boot to 115200?
> 
> I did, do we care about compatibility with whatever the board comes with
> though or not ?

The practice adopted for upstream DTS for Reneas SoCs
is to use 115200 if it can be used by the board,
regardless of what the default setting of the board is
out-of-the-box.

So please change this to 115200.
