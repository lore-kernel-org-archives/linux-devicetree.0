From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [PATCH] of: Add vendor prefix for Xen hypervisor
Date: Mon, 9 Sep 2013 11:31:59 +0100
Message-ID: <alpine.DEB.2.02.1309091131480.6397@kaball.uk.xensource.com>
References: <1378572566-12688-1-git-send-email-ian.campbell@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xen-devel-bounces@lists.xen.org>
In-Reply-To: <1378572566-12688-1-git-send-email-ian.campbell@citrix.com>
List-Unsubscribe: <http://lists.xen.org/cgi-bin/mailman/options/xen-devel>,
	<mailto:xen-devel-request@lists.xen.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xen.org>
List-Help: <mailto:xen-devel-request@lists.xen.org?subject=help>
List-Subscribe: <http://lists.xen.org/cgi-bin/mailman/listinfo/xen-devel>,
	<mailto:xen-devel-request@lists.xen.org?subject=subscribe>
Sender: xen-devel-bounces@lists.xen.org
Errors-To: xen-devel-bounces@lists.xen.org
To: Ian Campbell <ian.campbell@citrix.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, xen-devel@lists.xen.org
List-Id: devicetree@vger.kernel.org

On Sat, 7 Sep 2013, Ian Campbell wrote:
> I suppose vendors of virtual hardware ought to be listed here as well.
> 
> Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
> Cc: Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: devicetree@vger.kernel.org

ack


>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 366ce9b..4e4768d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -69,4 +69,5 @@ via	VIA Technologies, Inc.
>  wlf	Wolfson Microelectronics
>  wm	Wondermedia Technologies, Inc.
>  winbond Winbond Electronics corp.
> +xen	Xen Hypervisor
>  xlnx	Xilinx
> -- 
> 1.7.10.4
> 
