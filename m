From: Florian Fainelli <florian@openwrt.org>
Subject: Overriding/concatenating kernel command-line with bootargs from dtb?
Date: Fri, 08 Jun 2012 09:55:11 +0200
Message-ID: <2050174.dvvKJHKP0J@flexo>
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
To: linux-arm <linux-arm-kernel@lists.infradead.org>, device-tree <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Hi all,

I have a specific use case, where two boards using the same SoC have different 
UART speeds, which is something that I have specified in their corresponding 
dts files. In order to make sure people don't mess up the configuration, I 
prefer not to rely on the bootloader-supplied kernel-command line.

I was kind of expecting that ARM_ATAG_DTB_COMPAT + CMDLINE_EXTEND would 
actually concatenate the kernel command-line with the bootargs provided from 
dtb.

Is this something someone else would need? If so, shall we just make that 
happen when the two config symbols mentionned above are enabled, or shall we 
introduce a 4th kernel command line handling strategy?

Thank you for your answers.
-- 
Florian
