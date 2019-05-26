From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: vendor: Fix simtek vendor compatible
Date: Sun, 26 May 2019 11:05:08 -0500
Message-ID: <20190526160508.GA32215@bogus>
References: <20190525134140.6220-1-maxime.ripard@bootlin.com>
 <20190525134140.6220-2-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190525134140.6220-2-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, 25 May 2019 15:41:37 +0200, Maxime Ripard wrote:
> In the text file, simtek didn't have any description and apparently this
> confused the conversion script. Fix the simtek entry and add a proper
> description.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks.

Rob
