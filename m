From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] ARM: dts: iwg22d: Enable SDHI0 controller
Date: Mon, 25 Sep 2017 09:18:00 +0200
Message-ID: <20170925071800.GF1019@verge.net.au>
References: <TY1PR06MB0702E99A48352C055705E3A9B7670@TY1PR06MB0702.apcprd06.prod.outlook.com>
 <1506085262-13639-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR06MB08955E235768A72D33FE2AD3C0670@TY1PR06MB0895.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB08955E235768A72D33FE2AD3C0670@TY1PR06MB0895.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 01:33:39PM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> just to clarify the changes between v1 and v2, we can't use SDR50 and SDR104 (due to an HW issue) therefore the pinctrl for UHS has been removed and we dropped property "sd-uhs-sdr104". High Speed has been tested, therefore if you are happy with the patch I guess you can update the following page accordingly:
> http://elinux.org/index.php?title=Renesas-MMC-Enabled-Speeds&type=revision&diff=451426&oldid=451421
> 
> Although (due to a bug) sdhi0 may not hold a reference to "vccq_sdhi0", the gpio regulator will initialize "SDHI0 VccQ" at 3.3V.
> I have sent another patch (mmc: tmio: check mmc_regulator_get_supply return value) to start a discussion about a possible fix for the bug.
> 
> Let me know if you need more information.

Thanks again for following up on this.

I have applied the patch with Geert's tag.

I have also updated the Wiki at the URL above,
feel free to make any further updates there as appropriate.
