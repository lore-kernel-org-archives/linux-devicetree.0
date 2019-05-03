From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/dts/fsl: add crypto node alias for B4
Date: Fri,  3 May 2019 16:59:09 +1000 (AEST)
Message-ID: <44wNK93JC5z9sNm@ozlabs.org>
References: <20190320125516.12277-1-horia.geanta@nxp.com>
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20190320125516.12277-1-horia.geanta@nxp.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
To: =?utf-8?q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Scott Wood <oss@buserror.net>, devicetree@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-03-20 at 12:55:16 UTC, =?utf-8?q?Horia_Geant=C4=83?= wrote:
> crypto node alias is needed by U-boot to identify the node and
> perform fix-ups, like adding "fsl,sec-era" property.
> 
> Signed-off-by: Horia GeantÄ <horia.geanta@nxp.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/32eebf96669568014b79b83a03f7895f

cheers
