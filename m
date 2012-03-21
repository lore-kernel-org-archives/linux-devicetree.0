From: Sylwester Nawrocki <snjw23@gmail.com>
Subject: Handling device shared SFR on dt platform
Date: Wed, 21 Mar 2012 23:38:11 +0100
Message-ID: <4F6A5853.9090809@gmail.com>
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
To: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Hello,

I'm working on adding the device tree support for two devices that
share some IO registers. Exactly, there is one shared SFR that 
contains a common bit to enable two PHY devices, and another two
bits, each to separately reset each PHY.

Currently this shared register is statically memory mapped and it is
handled by a platform specific callback, that both drivers use to
control their corresponding (sub)devices in synchronised manner.

The two devices are a MIPI-CSI2 receiver and a MIPI-DSI transmitter, 
and the common register is there to control the camera and the display 
port PHY. The hardware design is a bit unfortunate, but there is not
much I could do about it.

The callback can be looked at at:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=arch/arm/plat-s5p/setup-mipiphy.c

I have been trying to find method to handle this on a dt platform. 
Has anyone faced similar issue before ? I would appreciate any ideas
or suggestions.

One of ideas was to create some sort of PHY framework, similar to
clock API, and perhaps handle such platform quirks outside DT.

--

Thanks,
Sylwester
