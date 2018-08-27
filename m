From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI
 support
Date: Mon, 27 Aug 2018 14:35:44 +0200
Message-ID: <20180827123544.awqip3mbevjvzh7i@verge.net.au>
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
 <fe3794e1-2452-d1af-5c30-203fcbb9932e@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <fe3794e1-2452-d1af-5c30-203fcbb9932e@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 23, 2018 at 07:59:20PM +0300, Sergei Shtylyov wrote:
> Define the Condor/V3HSK board dependent parts of the DU and  LVDS device
> nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
> Analog Devices ADV7511W HDMI transmitter...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> ---
> The patch is against the 'renesas-devel-20180822-v4.18' tag of Simon Horman's
> 'renesas.git' repo. The only driver support still unmerged seems to be the
> R8A77980 LVDS support patches...

Thanks, applied for v4.20.
