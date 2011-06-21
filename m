From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH 4/4] ARM: zImage: allow supplementing appended DTB with
	traditional ATAG data
Date: Tue, 21 Jun 2011 10:32:19 -0700
Message-ID: <8yad3i7nl98.fsf@huya.qualcomm.com>
References: <1308632955-11070-1-git-send-email-nico@fluxnic.net>
	<1308632955-11070-5-git-send-email-nico@fluxnic.net>
	<20110621070058.GA9228@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110621070058.GA9228@S2101-09.ap.freescale.net> (Shawn Guo's
	message of "Tue, 21 Jun 2011 15:00:59 +0800")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: Tony Lindgren <tony@atomide.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Nicolas Pitre <nico@fluxnic.net>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 21 2011, Shawn Guo wrote:

> On Tue, Jun 21, 2011 at 01:09:15AM -0400, Nicolas Pitre wrote:
>> From: Nicolas Pitre <nicolas.pitre@linaro.org>
>> 
>> Some old bootloaders can't be updated to a device tree capable one,
>> yet they provide ATAGs with memory configuration, the ramdisk address,
>> the kernel cmdline string, etc.  To allow a device tree enabled
>> kernel to be used with such bootloaders, it is necessary to convert those
>> ATAGs into FDT properties and fold them into the DTB appended to zImage.
>> 
>> Currently the following ATAGs are converted:
>> 
>> 	ATAG_CMDLINE
>> 	ATAG_MEM (up to 8 memory regions)
>> 	ATAG_INITRD2
>> 
>> If the corresponding information already exists in the appended DTB, it
>> is replaced, otherwise the required node is created to hold it.
>> 
>> The code looks for ATAGs at the location pointed by the value of r2 upon
>> entry into the zImage code.  If no ATAGs are found there, an attempt at
>> finding ATAGs at the typical 0x100 offset from start of RAM is made.
>> Otherwise the DTB is left unchanged.
>> 
>> Thisstarted from an older patch from John Bonesio <bones@secretlab.ca>,
>> with contributions from David Brown <davidb@codeaurora.org>.
>> 
>> Signed-off-by: Nicolas Pitre <nicolas.pitre@linaro.org>
>> ---
>
> With this patch applied, I saw nothing coming from kernel on imx51
> babbage serial port.

Can you try seeing if it works with padding in the DTB that you are
using?  Right now, I'm using something like:

/ {
	...
	memory {
		reg = <0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;
	};
	chosen {
		bootargs = "                              "; /* Enough for arg */
		linux,initrd-start = <0>;
		linux,initrd-end = <0>;
	};
};

I get problems if the fdt code tries to expand the tree, even if I add
padding when running the dtc (I've tried -p 1024).

Hopefully, I'll get some time today to try and figure out what is going
on.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
