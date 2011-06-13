From: David Brown <davidb@codeaurora.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Mon, 13 Jun 2011 16:04:57 -0700
Message-ID: <8yaaadlfi3q.fsf@huya.qualcomm.com>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612081541.GA10283@n2100.arm.linux.org.uk>
	<20110612083414.GA29516@S2100-06.ap.freescale.net>
	<20110612092131.GC10283@n2100.arm.linux.org.uk>
	<20110612095217.GD10283@n2100.arm.linux.org.uk>
	<20110612104215.GC29516@S2100-06.ap.freescale.net>
	<20110612104048.GE10283@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110612104048.GE10283@n2100.arm.linux.org.uk> (Russell King's
	message of "Sun, 12 Jun 2011 11:40:48 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Tony Lindgren <tony@atomide.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 12 2011, Russell King - ARM Linux wrote:

> On Sun, Jun 12, 2011 at 06:42:16PM +0800, Shawn Guo wrote:
>> On Sun, Jun 12, 2011 at 10:52:17AM +0100, Russell King - ARM Linux wrote:
>> > On Sun, Jun 12, 2011 at 05:38:23PM +0800, Shawn Guo wrote:
>> > > On Sun, Jun 12, 2011 at 10:21:31AM +0100, Russell King - ARM Linux wrote:
>> > > > What if your platform doesn't use uboot?
>> > > 
>> > > Add dtb parsing support with the help from libfdt, I guess.  It is
>> > > some amount of work, but it's not a rewrite of bootloader, IMHO.
>> > 
>> > I guess you're suggesting that this wrapper uses libfdt to merge
>> > the ATAGs with the DT info?
>> > 
>> No, ATAGs does not play at all in this case.  For u-boot example
>> again, if it boots a dt kernel, dtb will be parsed to get cmdline
>> node overwritten as bootargs env value, and then it boots the dt
>> kernel with this updated dtb.
>
> You've missed my point entirely.  What you're saying is that we have to
> re-build and replace the boot loader in order to pass a command line into
> a kernel using the DT wrapper.
>
> I'm saying that you shouldn't have to, and the kernel should accept the
> memory size and command line from the ATAGs _in addition_ to the
> appended DT blob, and the ATAGs in that case should take precidence.

Having just now booted an MSM target using device tree, I'm going to
agree with Russell here.  I don't really see a clean transition path for
us to hard cut over to DT, at least on existing targets.

The MSMs use a custom bootloader.  It builds ATAGS to pass in memory
information, command line arguments, and the ramdisk address.  Working
with the bootloader team just to do this was difficult; trying to
support DT in the bootloader would be even more difficult.

But, beyond this, we have to still be able to boot our production
kernels (which don't have DT support, and probably won't for quite some
time).

The steps I had to go through to boot a DT kernel were kind of
complicated:

  - Boot kernel in a debugger, and inspect the ATAGS.

  - Edit my DTS file to match the current values.

  - Compile the DTS file.

  - Load the dtb on top of the ATAGS.

Unless I'm missing something, I don't see a clean way of supporting this
that doesn't involve the kernel being able to parse the ATAGS as well.

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
