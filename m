From: "Milton Miller" <miltonm@bga.com>
Subject: Re: [RFC/PATCH 2/3] of: add of_lookup_stdout() utility function
Date: Thu, 07 Aug 2008 14:20:18 -0500
Message-ID: <489b4af2.199.1a42.425913876@bga.com>
Reply-To: miltonm@bga.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Timur Tabi <timur@freescale.com>, Yoder Stuart <stuart.yoder@freescale.com>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org, paulus@samba.org, miltonm@bga.com, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

TimurTabi wrote:
> Yoder Stuart wrote:
> 
> > The second was the idea that we may need a
> > /aliases/stdin as well. You could conceptually have
> > stdout be a monitor and a stdin be a keyboard.
> 
> I don't think the hypervisor console subsystem supports
> this.  I don't see any way of registering separate clients
> for input vs. output.

Why should what the hvc driver support have any effect on
what the binding should be?

And anyways, both the boot wrapper and udbg (and hence early
debug console) have totally indepenedent functions for
reading and writing.  

And for that matter, we also support output on monitor and
input on keyboard for linear frame buffer on 6xx via the
btext output (but only adb input).

milton
