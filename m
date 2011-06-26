From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: "Early" devices and the DT
Date: Sun, 26 Jun 2011 15:22:39 -0400
Message-ID: <4E0786FF.9010002@firmworks.com>
References: <1308924659-31894-1-git-send-email-marc.zyngier@arm.com>	<1308924659-31894-3-git-send-email-marc.zyngier@arm.com>	<20110625204742.GB15026@ponder.secretlab.ca>	<4E06513B.4030706@gmail.com>
	<BANLkTimy6iyQyyvNUK3Kc6skSKyVxBwWPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTimy6iyQyyvNUK3Kc6skSKyVxBwWPA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some solutions to the early device problem

a) Most complex:  Use new properties to create a dependency graph.  This 
is probably the most general solution, but also probably the hardest for 
people to think about and maintain.

b) Define a set of init phases 0,1,2,...  and mark each early device 
node with a phase number property.  Scan the tree for each phase and 
handle only the devices with that phase number.  Unmarked nodes are 
handled last.

c) Similar to b, but instead of properties in nodes, have properties 
like "linux-phase0", "linux-phase1", etc in /chosen, whose values are 
lists of phandles.

Admittedly, this is to some extent Linux-specific, but there is a fair 
chance that it would be useful to other OSs, as most OSs have similar 
ordering requirements for certain core devices.  I know that Windows 
works this way - the Windows kernel startup code scans the NT device 
tree multiple times, picking off different devices in different phases.

Some devices might appear in multiple phases.  For example, you might 
want to init a serial device in phase 0, in a simplified mode that 
doesn't depend on interrupts, then do the interrupt controller in phase 
1, then do the timer in phase 2 and also reinit the serial port to use 
interrupts in phase 2.
