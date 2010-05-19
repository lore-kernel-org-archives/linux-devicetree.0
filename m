From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Boot interface for device trees on ARM
Date: Wed, 19 May 2010 13:08:43 +0100
Message-ID: <20100519120843.GB24520@n2100.arm.linux.org.uk>
References: <201005181054.32325.jeremy.kerr@canonical.com>
	<alpine.LFD.2.00.1005172341200.12758@xanadu.home>
	<AANLkTilJl9_NHiT1LITG7UbA9S7OYsnGMcDAsFEEx5Ob@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilJl9_NHiT1LITG7UbA9S7OYsnGMcDAsFEEx5Ob@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: nicolas.pitre@canonical.com, Jeremy Kerr <jeremy.kerr@canonical.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Nicolas Pitre <nico@fluxnic.net>
List-Id: devicetree@vger.kernel.org

On Wed, May 19, 2010 at 05:57:55AM -0600, Grant Likely wrote:
> side question: Do recent ARM SoCs provide any facility to reliably
> detected the silicon at run time?  ie. like the processor (unique to
> core) and system (unique to SoC) id registers on PowerPC.

No.

Every SoC is effectively unique in all aspects.  There is no common
physical memory layout, no common interrupt controller, no common
timer, etc.  The base addresses for everything is also SoC specific,
so it's a catch-22 situation - you need to know what the SoC is to
be able to find out where various registers and memory is located.
