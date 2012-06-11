From: Florian Fainelli <florian@openwrt.org>
Subject: Re: Overriding/concatenating kernel command-line with bootargs from
 dtb?
Date: Mon, 11 Jun 2012 19:51:30 +0200
Message-ID: <1424241.AIpjaKT9XL@bender>
References: <2050174.dvvKJHKP0J@flexo> <4FD601F9.8020201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4FD601F9.8020201@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, device-tree <devicetree-discuss@lists.ozlabs.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Monday 11 June 2012 09:34:33 Rob Herring wrote:
> On 06/08/2012 02:55 AM, Florian Fainelli wrote:
> > Hi all,
> > 
> > I have a specific use case, where two boards using the same SoC have 
different 
> > UART speeds, which is something that I have specified in their 
corresponding 
> > dts files. In order to make sure people don't mess up the configuration, I 
> > prefer not to rely on the bootloader-supplied kernel-command line.
> > 
> > I was kind of expecting that ARM_ATAG_DTB_COMPAT + CMDLINE_EXTEND would 
> > actually concatenate the kernel command-line with the bootargs provided 
from 
> > dtb.
> > 
> > Is this something someone else would need? If so, shall we just make that 
> > happen when the two config symbols mentionned above are enabled, or shall 
we 
> > introduce a 4th kernel command line handling strategy?
> > 
> > Thank you for your answers.
> 
> There was a patch to do this:
> 
> http://www.mail-archive.com/devicetree-
discuss@lists.ozlabs.org/msg10448.html
> 
> Please comment if this works for you.

This patch indeeds work fine for me when I disable ARM_ATAG_DTB_COMPAT. If I 
let it turned on the chosen node is correctly scanned, but its value, is the 
one coming from tag_cmdline() which is actually the bootloader supplied 
commad-line. I will cook up a patch for this, because I expect the 3 command-
lines to be concatened in the end (built-in, atag and dtb).

I don't see any comments from Ben or anyone after Doug sent his version 2 of 
the patch, is there any reason not to merge it?
-- 
Florian
