From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: SPDX-License-Identifier
Date: Wed, 04 Feb 2015 17:41:08 +0100
Message-ID: <54D24BA4.3070509@denx.de>
References: <774153d4-d33f-4bb4-813b-582762bc3af9@TX2EHSMHS021.ehs.local> <20140220182257.GF23217@saruman.home> <5306F458.9010706@monstr.eu> <20140221160442.GA17506@kroah.com> <5307790A.4050806@monstr.eu> <20140221161246.GM31902@saruman.home> <53077C5F.9000407@monstr.eu> <54CF9B12.2070807@denx.de> <20150202160622.GA9852@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150202160622.GA9852-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02.02.2015 17:06, Greg Kroah-Hartman wrote:
> On Mon, Feb 02, 2015 at 04:43:14PM +0100, Stefan Roese wrote:
>> On 21.02.2014 17:18, Michal Simek wrote:
>>> On 02/21/2014 05:12 PM, Felipe Balbi wrote:
>>>> On Fri, Feb 21, 2014 at 05:04:26PM +0100, Michal Simek wrote:
>>>>> On 02/21/2014 05:04 PM, Greg Kroah-Hartman wrote:
>>>>>> On Fri, Feb 21, 2014 at 07:38:16AM +0100, Michal Simek wrote:
>>>>>>> BTW: u-boot started to use SPDX-License-Identifier
>>>>>>> which will be nice to start to use.
>>>>>>
>>>>>> I agree, feel free to start sending patches to use this type of
>>>>>> identifier for drivers.
>>>>>
>>>>> But we probably need to add that Licenses to one location.
>>>>> Documentation/Licenses?
>>>>
>>>> Just add to the drivers themselves, just like u-boot is doing. A simple:
>>>>
>>>> 	$ git grep -e SPDX-License-Identifier
>>>>
>>>> will tell you filename and license. Or did I misunderstand your question ?
>>>
>>> But for doing this it is probably necessary to have location where
>>> you will place that licenses and you will explain what it is how
>>> it is done by Wolfgang in this commit.
>>>
>>> http://git.denx.de/?p=u-boot.git;a=commitdiff;h=eca3aeb352c964bdb28b8e191d6326370245e03f
>>>
>>> Then yes, adding one line is enough.
>> I would like to revive this thread regarding SPDX license identifiers in the
>> Linux kernel. And check how to best start / proceed with the integration
>> now.
>
> Why do you want to do this?

The main idea behind these SPDX license tags in the source files is, 
that it makes license clearing for projects easier. As those tags 
simplify the automated tools that scan all source files of projects, in 
this case the Linux kernel. One of the problems with the current 
licenses in the files is, that even the same licenses are referred to by 
a number of slightly varying text blocks (full, abbreviated, different 
indentation, line wrapping and/or white space, with obsolete address 
information, ...) which makes automatic processing a nightmare.

Please note that we don't want to "disturb" any kernel developers in 
their work with this SPDX license ID addition. The licenses will not be 
changed in any way. We only want to make life easier for users that need 
to run such automated license clearing tools on the source code that 
they embed / ship / deploy. And this one additional line in the header 
is here definitely helpful.

>> Greg, if you are open to patches adding this one-line SPDX license tag to
>> the source code, how should I begin with such a task in your opinion? Should
>> I add those tags for just one driver directory (e.g. drivers/base/*) first?
>> And send those patches to the list(s) for review. Or do you have other
>> suggestions on how to start with this task?
>
> Is one tag per directory sufficient?  Is one tag per file sufficient?
> How about one tag per package?  If package, then isn't a single tag for
> the whole kernel source tree sufficient, as we all know the overall
> license for the kernel source tree.

We really need one tag per file. Of course the resulting license for the 
Linux kernel is clear. But there are many things to take into account 
here. Some of them are (I'm not telling you something new, I know - just 
a summary of arguments):

- The Linux source code is not homogeneous and neither perfect nor
   without errors. Who ensures that all parts of the kernel really
   are GPLv2 compatible?

- Some parts of the Linux source code are also used by other projects.
   Or are derived from other projects. Because of this they are
   explicitly licensed under different licenses than the GPLv2
   (compatible to it though of course). Or are dual-licensed. So that
   they can be used by these other projects.

For example "Documentation/SubmittingDrivers" mentions:

   	The code must be released to us under the
	GNU General Public License. We don't insist on any kind
	of exclusive GPL licensing, and if you wish the driver
	to be useful to other communities such as BSD you may well
	wish to release under multiple licenses.
	See accepted licenses at include/linux/module.h

Because of this it is really important to know the exact license(s) for 
each and every file. And they can vary very much. Here some examples:

GPL v3 or later:

	Documentation/filesystems/cifs/winucase_convert.pl
	scripts/dtc/dtc-parser.tab.c_shipped
	scripts/dtc/dtc-parser.tab.h_shipped
	scripts/kconfig/zconf.tab.c_shipped
	scripts/genksyms/parse.tab.h_shipped
	scripts/genksyms/parse.tab.c_shipped
	drivers/staging/lustre/lustre/include/lustre_dlm_flags.h

So there seems to be problem with this lustre code.

Dual BSD/GPL:

	crypto/aes_generic.c
	crypto/cts.c
	crypto/fcrypt.c
	drivers/block/skd_main.c
	drivers/block/xen-blkback/blkback.c
	...

Dual MIT/GPL:

	lib/glob.c

Dual MPL/GPL:

	drivers/ide/ide-cs.c
	drivers/isdn/hisax/elsa_cs.c
	drivers/isdn/hisax/sedlbauer_cs.c
	drivers/mtd/ftl.c
	drivers/net/ethernet/xircom/xirc2ps_cs.c
	...

and so on...

So we have many different licenses and perhaps even incompatible ones in 
the kernel right now. The SPDX license tags can definitely help sorting 
this out. And as mentioned above, will make the life for users running 
automated license clearing tools easier.

Thanks,
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
