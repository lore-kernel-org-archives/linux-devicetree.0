From: Timur Tabi <timur@freescale.com>
Subject: Re: [RFC/PATCH 2/3] of: add of_lookup_stdout() utility function
Date: Thu, 07 Aug 2008 14:22:49 -0500
Message-ID: <489B4B89.1010507@freescale.com>
References: <489b4af2.199.1a42.425913876@bga.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <489b4af2.199.1a42.425913876@bga.com>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: miltonm@bga.com
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org, paulus@samba.org, Yoder Stuart <stuart.yoder@freescale.com>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Milton Miller wrote:

> Why should what the hvc driver support have any effect on
> what the binding should be?

Because my hypervisor console driver uses the hypervisor console/tty subsystem.
 If the subsystem assumes one stdout/stdin device, then I must abide by that.

-- 
Timur Tabi
Linux kernel developer at Freescale
