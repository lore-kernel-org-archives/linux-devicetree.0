From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] of: Add vendor prefix for Xen hypervisor
Date: Mon, 09 Sep 2013 10:05:32 -0600
Message-ID: <522DF1CC.9050500@wwwdotorg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>, Rob Herring <rob.herring@calxeda.com>, xen-devel@lists.xen.org
List-Id: devicetree@vger.kernel.org

On 09/07/2013 10:49 AM, Ian Campbell wrote:
> I suppose vendors of virtual hardware ought to be listed here as well.

Makes sense to me. (and vendors of firmware in some cases)

Acked-by: Stephen Warren <swarren@nvidia.com>
