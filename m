From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 02/11] arm: use generic infrastructure for early params
Date: Wed, 6 Jan 2010 16:27:31 +0000
Message-ID: <20100106162731.GB1728@n2100.arm.linux.org.uk>
References: <1261479296.245235.191110925832.0.gpush@pororo>
	<1261479296.246097.171417450949.2.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1261479296.246097.171417450949.2.gpush@pororo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jeremy Kerr <jeremy.kerr@canonical.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2009 at 06:54:56PM +0800, Jeremy Kerr wrote:
> The ARM setup code includes its own parser for early params, there's
> also one in the generic init code.

This is something which should be separate from the rest of the DT
patch - could we have this as a patch which can be applied to the
current kernel tree please?
