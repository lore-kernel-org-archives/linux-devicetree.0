From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 4/6] arm/dt: probe for platforms via the device tree
Date: Mon, 31 Jan 2011 16:03:24 -0700
Message-ID: <AANLkTi=Kfb6TVUqN9aogq8A5WskNfwW=s7Dswgf2MC8i@mail.gmail.com>
References: <20110131203626.15105.64302.stgit@localhost6.localdomain6>
	<20110131210410.15105.63595.stgit@localhost6.localdomain6>
	<alpine.LFD.2.00.1101311709280.8580@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.1101311709280.8580-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 3:27 PM, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> w=
rote:
> On Mon, 31 Jan 2011, Grant Likely wrote:
>
>> If a dtb is passed to the kernel then the kernel needs to iterate
>> through compiled-in mdescs looking for one that matches and move the
>> dtb data to a safe location before it gets accidentally overwritten by
>> the kernel.
>>
>> This patch creates a new function, setup_machine_fdt() which is
>> analogous to the setup_machine_atags() created in the previous patch.
>> It does all the early setup needed to use a device tree machine
>> description. =A0It also creates arm_unflatten_device_tree() which copies
>> the dtb into an allocated buffer and unflattens it into the live-tree
>> representation.
>>
>> v2: Changed to save the dtb by copying into an allocated buffer.
>> =A0 =A0 - Since the dtb will very likely be passed in the first 16k of r=
am
>> =A0 =A0 =A0 where the interrupt vectors live, memblock_reserve() is
>> =A0 =A0 =A0 insufficient to protect the dtb data.
>
> This is wrong. =A0The vector page can be allocated anywhere. =A0It is
> currently allocated with memblock_alloc(), so if you memblock_reserve()
> the dtb soon enough then it should be safe and the vector page or
> whatever will be allocated somewhere else.

Ah, thanks.  Did not know that.

> What was the actual problem?

I was seeing the first page in memory getting zeroed partway through
the boot process which wiped out the dtb.  I haven't yet narrowed down
to the exact point that it gets overwritten.  It is late enough that
all the early setup dt code works, but before init_machine gets
called.

I'm also seeing a problem with /proc/device-tree getting corrupted on
qemu which I cannot reproduce on Tegra hardware.  Still investigating
this one.

g.
