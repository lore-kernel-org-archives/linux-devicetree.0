From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Sun, 12 Jun 2011 02:06:37 -0400
Message-ID: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
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
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: John Bonesio <bones@secretlab.ca>, Tony Lindgren <tony@atomide.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

This is a resend of those patches with fixups after the latest changes
in mainline.

[PATCH 1/3] ARM: zImage: ensure it is always a multiple of 64 bits in size
This one is new and trivial.

[PATCH 2/3] ARM: zImage: Allow the appending of a device tree binary
Mostly John Bonesio's version with some adjustments and cleanups.

[PATCH 3/3] ARM: zImage: make sure appended DTB doesn't get overwritten by kernel .bss
New, simpler alternative to Tony Lindgren's version.


Nicolas
