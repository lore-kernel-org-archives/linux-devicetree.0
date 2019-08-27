From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 05/20] dt-bindings: phy-mmp3-usb: Add bindings
Date: Tue, 27 Aug 2019 17:24:27 -0500
Message-ID: <20190827222427.GA16221@bogus>
References: <20190822092643.593488-1-lkundrak@v3.sk>
 <20190822092643.593488-6-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190822092643.593488-6-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Aug 2019 11:26:28 +0200, Lubomir Rintel wrote:
> This is the PHY chip for USB OTG on MMP3 platform.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - s/usbphy@/usb-phy@/
> - Dropped a reference to Documentation/phy.txt
> 
>  .../devicetree/bindings/phy/phy-mmp3-usb.txt        | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
