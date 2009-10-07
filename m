From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [microblaze-uclinux] Re: [RFC PATCH 00/12] Merge common
	OpenFirmware device tree code
Date: Wed, 07 Oct 2009 16:21:33 +0200
Message-ID: <4ACCA3ED.6090403@monstr.eu>
References: <20091007041007.16890.62194.stgit@angua>
	<fa686aa40910062149p5d7141e4x3ff849fd4d191f38@mail.gmail.com>
	<200910070209.59311.rob@landley.net>
	<fa686aa40910070702j470785d2ka2621122a8e2f1fd@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <fa686aa40910070702j470785d2ka2621122a8e2f1fd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



Grant Likely wrote:
> On Wed, Oct 7, 2009 at 1:09 AM, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org> wrote:
>> On Tuesday 06 October 2009 23:49:04 Grant Likely wrote:
>>> However, I've completely devoted to this work for at least the next
>>> two months, so there are plenty more patches to follow.  Once I've
>>> got all the common code merged between Microblaze, PowerPC and Sparc
>>> I'll be fix the endian problems and making it easily usable by other
>>> architectures like ARM and MIPS.  Lots of work to be done.
>> Is there any news on getting QEMU to parse a device tree to figure out what
>> hardware to emulate?  (I.E. using the device tree code to let qemu provide
>> configurable board emulations instead of hardwiring them in C code?)
> 
> Not that I have, but I expect that I will be hacking on QEMU as part
> of this work.

ok great. Just let us know - we will test it.

Thanks,
Michal

> 
>> Also, what would be involved in getting x86 to (at least have the option to)
>> use the device tree stuff?
> 
> It would be very easy once the endian issues are worked out since the
> device tree is just a data format to be parsed.
> 
> g.
> 

-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
