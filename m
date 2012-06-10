From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH 9/9] Kirkwood: Add basic device tree support for QNAP
 TS219.
Date: Sun, 10 Jun 2012 19:22:22 -0400
Message-ID: <20120610232222.GC14756@titan.lakedaemon.net>
References: <1339324322-29388-10-git-send-email-andrew@lunn.ch>
 <20120610172313.GA14756@titan.lakedaemon.net>
 <20120610174842.GA22507@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20120610174842.GA22507@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, machael@walle.cc
List-Id: devicetree@vger.kernel.org

On Sun, Jun 10, 2012 at 07:48:42PM +0200, Andrew Lunn wrote:
> It would be good if all the DT boards where compiled all the time.  We
> can then see build failures in kisskb.

Yep, I've included this, as well as watchdog and a few others.  The
series will also include the s/mrvl/marvell/g conversion, and the
CONFIG_ARM_PATCH_PHYS_VIRT correct answer.  Which I'm still working on.

thx,

Jason.
