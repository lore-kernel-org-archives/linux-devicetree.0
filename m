From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: consistently name r8a77965 as M3-N
Date: Tue, 1 May 2018 08:41:03 -0500
Message-ID: <20180501134103.GA29214@rob-hp-laptop>
References: <20180424055442.19710-1-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180424055442.19710-1-horms+renesas@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 24, 2018 at 07:54:42AM +0200, Simon Horman wrote:
> There is an inconsistency between the use of M3N and M3-N.
> This patch resolves this by consistently using the latter.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on renesas-devel-20180423-v4.17-rc2
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
