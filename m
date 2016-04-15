From: Mauro Carvalho Chehab <m.chehab@samsung.com>
Subject: Re: [PATCH] Add EDAC peripheral init functions & Ethernet EDAC.
Date: Fri, 15 Apr 2016 06:40:42 -0300
Message-ID: <20160415064042.330406ab.m.chehab@samsung.com>
References: <1460499181-23080-1-git-send-email-tthayer@opensource.altera.com>
 <20160414143501.GA25212@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20160414143501.GA25212@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, bp@alien8.de, tthayer@opensource.altera.com, dougthompson@xmission.com, grant.likely@linaro.org, dinguyen@opensource.altera.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Em Thu, 14 Apr 2016 09:35:01 -0500
Rob Herring <robh@kernel.org> escreveu:

> On Tue, Apr 12, 2016 at 05:12:55PM -0500, tthayer@opensource.altera.com wrote:
> > This patch set adds the memory initialization functions for Altera's
> > Arria10 peripherals, the first of which is the Ethernet EDAC. The
> > first 3 patches add the memory initialization functionality. The
> > last 3 patches add Ethernet EDAC support.  
> 
> The ethernet part seems a bit strange to me to put under EDAC as EDAC 
> is primarily memory controller ECC (and caches to some extent). Also you 
> would not halt the system in case of an UC, but rather just drop the 
> frame. This would need to be part of the ethernet driver in that case.
>  
> Of course, given that ethernet frames already have a CRC, ECC of the 
> FIFO seems a bit redundant.

Actually, EDAC was conceived to be a way to report hardware errors, and,
although the main use case is for memory and CPU errors, there are a few
drivers that report errors at PCI bus. So, I don't see much problems using
it to report other hardware errors, like the ones associated with the
Ethernet hardware.

That's said, things like Ethernet frame errors are better handled via the
network drivers. I would report via EDAC only errors associated with the
Ethernet hardware that would cause the hardware to malfunction.

Btw, an UC error won't cause the system to halt, except if a UC memory
error happens and the EDAC core is loaded with an special modprobe
parameter (edac_mc_panic_on_ue = 1).

-- 
Thanks,
Mauro
