From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Add binding for
 Armada framebuffer
Date: Tue, 12 Mar 2019 13:42:36 -0500
Message-ID: <20190312184236.GA12049@bogus>
References: <20190304202006.3863-1-lkundrak@v3.sk>
 <20190304202006.3863-2-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190304202006.3863-2-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

On Mon,  4 Mar 2019 21:20:02 +0100, Lubomir Rintel wrote:
> This is the binding for memory that is set aside for allocation of Marvell
> Armada framebuffer objects.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Moved from bindings/display/armada/
> - Removed the marvell,dove-framebuffer string
> - Added to the MAINTAINERS entry
> 
>  .../marvell,armada-framebuffer.txt            | 22 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/marvell,armada-framebuffer.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
