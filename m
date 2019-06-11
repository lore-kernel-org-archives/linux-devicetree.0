Return-Path: <robherring2@gmail.com>
Date: Tue, 11 Jun 2019 16:57:10 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 2/7] dt-bindings: usb: renesas_usb3: Document usb role
 switch support
Message-ID: <20190611225710.GA28189@bogus>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559296800-5610-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, 31 May 2019 10:59:55 +0100, Biju Das wrote:
> Update the DT bindings documentation to support usb role switch
> for USB Type-C connector using USB role switch class framework.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V6-->V7
>   * Incorporated shimoda-san's review comments.
>     (https://patchwork.kernel.org/patch/10944631/)
>  V5-->V6
>   * Updated description
>   * Added usb-role-switch-property
>  V4-->V5
>   * No Change
>  V3-->V4
>   * No Change
>  V2-->V3
>   * Added optional renesas,usb-role-switch property.
>  V1-->V2
>   * Added usb-role-switch-property
>   * Updated the example with usb-role-switch property.
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
