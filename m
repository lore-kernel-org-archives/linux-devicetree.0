From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH TIP 02/14] x86: Add device tree support
Date: Thu, 17 Feb 2011 12:31:02 +0100
Message-ID: <20110217113102.GB11260@www.tglx.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-3-git-send-email-bigeasy@linutronix.de>
	<20110216213126.GC22837@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110216213126.GC22837-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely | 2011-02-16 14:31:26 [-0700]:

>> +config X86_OF
>> +	bool "Support for device tree"
>> +	select OF
>> +	select OF_EARLY_FLATTREE
>> +	---help---
>> +	  Device tree support on X86.
>> +
>
>On ARM and MIPS, this is called 'config USE_OF'.  It would be nice to have
>some commonality.  Maybe I should move the user-visible option to
>drivers/of/Kconfig.  Or perhaps I should just make CONFIG_OF itself
>user visible.
>
>thoughts?

We could make CONFIG_OF depend on CONFIG_HAVE_OF_SUPPORT and let OF
select OF_EARLY_FLATTREE if ARCH_WANT_EARLY_FLATTREE for instance. So
that part would work in a generic way.

For OF-only platforms you would have to go to drivers/of
before you can enable the specific SoC/board. So it could lead to
something like "first enable scsi disk before you can enable usb
storage".

I like it :) For now I rename to USE_OF.

>
>g.

Sebastian
