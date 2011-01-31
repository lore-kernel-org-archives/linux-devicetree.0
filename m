From: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/6] arm/dt: probe for platforms via the device tree
Date: Mon, 31 Jan 2011 17:27:20 -0500 (EST)
Message-ID: <alpine.LFD.2.00.1101311709280.8580@xanadu.home>
References: <20110131203626.15105.64302.stgit@localhost6.localdomain6>
	<20110131210410.15105.63595.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110131210410.15105.63595.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lennert Buytenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 31 Jan 2011, Grant Likely wrote:

> If a dtb is passed to the kernel then the kernel needs to iterate
> through compiled-in mdescs looking for one that matches and move the
> dtb data to a safe location before it gets accidentally overwritten by
> the kernel.
> 
> This patch creates a new function, setup_machine_fdt() which is
> analogous to the setup_machine_atags() created in the previous patch.
> It does all the early setup needed to use a device tree machine
> description.  It also creates arm_unflatten_device_tree() which copies
> the dtb into an allocated buffer and unflattens it into the live-tree
> representation.
> 
> v2: Changed to save the dtb by copying into an allocated buffer.
>     - Since the dtb will very likely be passed in the first 16k of ram
>       where the interrupt vectors live, memblock_reserve() is
>       insufficient to protect the dtb data.

This is wrong.  The vector page can be allocated anywhere.  It is 
currently allocated with memblock_alloc(), so if you memblock_reserve() 
the dtb soon enough then it should be safe and the vector page or 
whatever will be allocated somewhere else.

What was the actual problem?


Nicolas
