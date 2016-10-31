From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: r8a7795: salvator-x: add bias setting for
 usb1_pins
Date: Mon, 31 Oct 2016 09:23:48 +0100
Message-ID: <20161031082347.GG18195@verge.net.au>
References: <1477564167-22422-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477564167-22422-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 27, 2016 at 07:29:27PM +0900, Yoshihiro Shimoda wrote:
> Since this board doesn't mount pull-up/down registers for
> USB1_{OVC,PWEN} pins, we should enable bias setting to pull these
> pins up/down.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, I have queued this up.
