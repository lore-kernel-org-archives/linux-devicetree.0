From: Grant Likely <grant.likely@secretlab.ca>
Subject: [RFC 0/8] Initial DT clock bindings
Date: Tue,  8 Nov 2011 18:19:35 -0700
Message-ID: <1320801583-12774-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hey all, here is an initial implementation of the DT clock bindings
with the versatile platform modified to use them.  I'm fairly happy
with how this has turned out, although I'll probably roll the clock
lookup stuff directly into drivers/clk/clkdev.c which will simplify
things a bit.  Please take a look and comment.

You'll also notice that I've started adding selftests to the
devicetree code, which turned out to be pretty useful for debugging.
I think I want to do this for a lot of the dt infrastructure.

The first 5 patches are probably pretty close to ready to be merged,
the last 3 I expect to still need work.

g.
