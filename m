From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4][v4] dt-bindings: mtd-physmap: Add endianness supports
Date: Mon, 19 Feb 2018 08:34:31 -0600
Message-ID: <20180219143431.ulznksgjv6ng5e6p@rob-hp-laptop>
References: <20180215114904.23627-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180215114904.23627-1-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, boris.brezillon@free-electrons.com, leoyang.li@nxp.com, oss@buserror.net, linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 15, 2018 at 05:19:04PM +0530, Prabhakar Kushwaha wrote:
> Connection between flash and controller is not necessary to be always
> of same type. It may varies from platform to platform.
> 
> Adding endianness (optional) property to provide connection type
> information.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
> Changes for v2: updated subject
> Changes for v3: fixed typo for "big-endian"
> Changes for v4: Moved binding definition in mtd-physmap.txt
> as discussed at https://patchwork.ozlabs.org/patch/842543/
> 
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
