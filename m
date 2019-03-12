From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: display: armada: Improve the LCDC
 documentation
Date: Tue, 12 Mar 2019 13:42:52 -0500
Message-ID: <20190312184252.GA12611@bogus>
References: <20190304202006.3863-1-lkundrak@v3.sk>
 <20190304202006.3863-4-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190304202006.3863-4-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On Mon,  4 Mar 2019 21:20:04 +0100, Lubomir Rintel wrote:
> The port is a child, not a property. And should be accompanied by an
> example. Plus a pair of cosmetic changes that don't seem to deserve a
> separate commit.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Minor adjustments to the commit message wording.
> 
>  .../bindings/display/marvell,armada-lcdc.txt     | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
