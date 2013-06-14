From: "Collins, Rod" <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org>
Subject: RE: Device tree flattening code not copying properties from blob
Date: Fri, 14 Jun 2013 11:55:49 -0400
Message-ID: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEFA19@corpatsmail4.corp.sensis.com>
References: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com>
 <CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg@mail.gmail.com>
 <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF975@corpatsmail4.corp.sensis.com>
 <CACxGe6s+Br8mYDfULsDcA9Ym3mqtyXZ41uK1un-nzcZH0BHtDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <CACxGe6s+Br8mYDfULsDcA9Ym3mqtyXZ41uK1un-nzcZH0BHtDg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant

That makes perfect sense, but I find that the DTB is included in the
vmlinux.lds.h file which lives in source/include/asm-generic.

This seems to always want to put the dtb in the init section which gets
removed. To fix this the asm-generic/vmlinux.lds.h file would need to be
changed.

Forgive me ahead of time for not understanding all of the versions and
the intents. We are using the 3.7 kernel in the uCLinux distribution.

It seems to me that it should always be added to rodata when linked in,
unless it is passed as a command line parameter?

Rod


/* init and exit section handling */
#define INIT_DATA
\
	*(.init.data)
\
	DEV_DISCARD(init.data)
\
	CPU_DISCARD(init.data)
\
	MEM_DISCARD(init.data)
\
	KERNEL_CTORS()
\
	MCOUNT_REC()
\
	*(.init.rodata)
\
	FTRACE_EVENTS()
\
	TRACE_SYSCALLS()
\
	DEV_DISCARD(init.rodata)
\
	CPU_DISCARD(init.rodata)
\
	MEM_DISCARD(init.rodata)
\
	KERNEL_DTB()

#define RO_DATA(align)  RO_DATA_SECTION(align)

Change to

#define RO_DATA(align)  RO_DATA_SECTION(align) \
	KERNEL_DTB()

Rod Collins
Principal Software Engineer
Saab Sensis Corporation
315-445-5784
rodc-eu1g02Y2shuDvotElmWtJA@public.gmane.org


-----Original Message-----
From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
Grant Likely
Sent: Thursday, June 13, 2013 7:48 PM
To: Collins, Rod
Cc: devicetree-discuss
Subject: Re: Device tree flattening code not copying properties from
blob

On Thu, Jun 13, 2013 at 11:49 PM, Collins, Rod
<Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org> wrote:
> Grant
>
> What is considered the correct way to include the blob in the build so

> that it is not removed?

Don't put it in an __init section.  :-p

However, I realized that the .dtb.S target does exactly that under the
assumption that multiple blobs may be linked into the kernel, but only
one actually used. The correct thing to do in your case is indeed copy
the blob at boot.

Actually, the best thing to do is to not link the dtb into the kernel at
all. Either append it as another payload or pass it in via the
bootloader and make the kernel mark the dtb memory as reserved.
Statically linking into the kernel proper means the kernel needs to be
rebuilt for each and every target which neuters one of the reasons for
using device tree in the first place.

g.
-
This message is intended only for the addressee and may contain information that is company confidential or privileged.  Any technical data in this message may be exported only in accordance with the U.S. International Traffic in Arms Regulations (22 CFR Parts 120-130) or the Export Administration Regulations (15 CFR Parts 730-774). Unauthorized use is strictly prohibited and may be unlawful. If you are not the intended recipient, or the person responsible for delivering to the intended recipient, you should not read, copy, disclose or otherwise use this message. If you have received this email in error, please delete it, and advise the sender immediately. 
-                                                                                                                                                                                                                                                       
