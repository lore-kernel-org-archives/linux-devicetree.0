From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: arm: mediatek: update for MT7623n
 SoC and relevant boards
Date: Wed, 31 May 2017 12:54:39 -0500
Message-ID: <20170531175439.bclgr4atbxrmgpna@rob-hp-laptop>
References: <cover.1495683769.git.sean.wang@mediatek.com>
 <ec281bfc67e633873bb519e607aca67213454b6d.1495683769.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ec281bfc67e633873bb519e607aca67213454b6d.1495683769.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sean.wang@mediatek.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 12:02:39PM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Because there are two versions of MT7623 SoC that is MT7623a and MT7623n
> respectively. So update the part of MT7623n bindings to allow that people
> tend to differentiate which MT7623 SoC the boards applies.
> 
> And "mediatek,mt7623-evb" can be safely changed to
> "mediatek,mt7623n-rfb-nand" because mt7623-evb is a kind of debug board
> internally in Mediatek which real users can't get. So instead we should
> indicate which variants it belongs to with more specific postfix as the
> adding here to let people easily know what board they use.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
