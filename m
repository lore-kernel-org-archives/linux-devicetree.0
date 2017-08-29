From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-binding: net/phy: fix interrupts description
Date: Tue, 29 Aug 2017 12:14:27 -0500
Message-ID: <20170829171427.dna6qfg4ceqwuj33@rob-hp-laptop>
References: <b3756346473feadfeba70ecb71960cad48e66621.1503468660.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b3756346473feadfeba70ecb71960cad48e66621.1503468660.git.baruch@tkos.co.il>
Sender: netdev-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Mark Rutland <mark.rutland@arm.com>, "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 23, 2017 at 09:11:00AM +0300, Baruch Siach wrote:
> Commit b053dc5a722ea (powerpc: Refactor device tree binding) split the
> Ethernet PHY binding documentation out of the big booting-without-of.txt
> file, leaving a dangling reference to "section 2" in the 'interrupts'
> property description. Drop that reference, and make the description look
> more like the rest.
> 
> While at it, make the example interrupt-parent phandle look more like a
> real world phandle, and use an IRQ_TYPE_ macro for the 'interrupts'
> type.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Documentation/devicetree/bindings/net/phy.txt | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Applied.

Rob
