From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: display: armada: Add more compatible
 strings
Date: Thu, 28 Mar 2019 12:52:55 -0500
Message-ID: <20190328175255.GA19100@bogus>
References: <20190320082057.856943-1-lkundrak@v3.sk>
 <20190320082057.856943-5-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190320082057.856943-5-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Mar 2019 09:20:56 +0100, Lubomir Rintel wrote:
> There's a generic compatible string and the driver will work on a MMP2 as
> well, using the same binding.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v2:
> - Order marvell,armada-lcdc after the model-specific strings.
> 
> Changes since v1:
> - Added marvell,armada-lcdc compatible string.
> 
>  .../devicetree/bindings/display/marvell,armada-lcdc.txt        | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
