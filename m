From: Timur Tabi <timur@freescale.com>
Subject: Re: [PATCH] [v2] powerpc/fsl: add device tree binding for QE firmware
Date: Fri, 26 Mar 2010 14:50:28 -0500
Message-ID: <4BAD1004.5050507@freescale.com>
References: <1269632145-28462-1-git-send-email-timur@freescale.com>
	<fa686aa41003261245h52e151ceoa4f85e38055ae6a7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <fa686aa41003261245h52e151ceoa4f85e38055ae6a7@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: wmb@firmworks.com, linuxppc-dev@ozlabs.org, devicetree-discuss@lists.ozlabs.org, scottwood@freescale.com
List-Id: devicetree@vger.kernel.org

Grant Likely wrote:
> The node must be a child of a QE node.  A QE node can reference the
> firmware from another QE node by using the fsl,firmware-phandle
> property.

Ok.

I'll post a V3 once everyone else has a chance to comment.

-- 
Timur Tabi
Linux kernel developer at Freescale
