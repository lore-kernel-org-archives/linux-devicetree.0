Return-Path: <SRS0=euvp=MH=verge.net.au=horms@kernel.org>
Date: Tue, 25 Sep 2018 09:33:06 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/5] usb: renesas_usbhs: use otg mode and add support for
 R-Car E3
Message-ID: <20180925073305.ohj7vlnto6hiyvvn@verge.net.au>
References: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 21, 2018 at 09:26:27PM +0900, Yoshihiro Shimoda wrote:
> This patch set is based on the latest Greg's usb.git / usb-testing branch
> (the commit id is ae8a2ca8a2215c7e31e6d874f7303801bb15fbbc)
> 
> The previous code set the mode as peripheral mode by the UGCTRL2 register
> for R-Car D3. But, this SoC can select OTG mode in fact. So, at first,
> I'd like to revert related patches I submitted in patch 1 and 2.
> Then, in patch 3, it sets the mode as "OTG" and in patch 4 and 5, it
> supports for R-Car E3.
> 
> To use this controller for R-Car D3 and E3, we need the following
> patch set. Otherwize, the mode will not be changed to peripheral mode
> by the phy's COMMCTRL register:
>  https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=21629

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
