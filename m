From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] dt-bindings: usb-xhci: Add r8a774c0 support
Date: Fri, 1 Mar 2019 17:16:24 +0100
Message-ID: <20190301161624.GA19937@kroah.com>
References: <1544732471-6730-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYXPR01MB1775A4A3AF86097F284C4A08C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <TYXPR01MB1775A4A3AF86097F284C4A08C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 01, 2019 at 11:25:33AM +0000, Fabrizio Castro wrote:
> Hello Greg,
> 
> I am sorry to bother you.
> Do you think you take this patch?

device tree bindings need an ack from the DT maintainers before I can
take them.  Also, this is for xhci, the xhci maintainer is responsible
for those, not me :)

thanks,

greg k-h
