From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 0/2] Device Tree support for CMA (Contiguous Memory
 Allocator)
Date: Mon, 18 Feb 2013 21:03:50 -0800
Message-ID: <CAOesGMjC97p_5wDCSUhv6DaHdOKJKcARdRtdt5UnYkUCuFou6g@mail.gmail.com>
References: <1360845928-8107-1-git-send-email-m.szyprowski@samsung.com>
 <20130214213013.GG1906@pengutronix.de> <511D6076.9090503@gmail.com>
 <20130215083304.GK1906@pengutronix.de> <5122AA3F.8030001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5122AA3F.8030001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michal Nazarewicz <mina86-deATy8a+UHjQT0dZR+AlfA@public.gmane.org>, linaro-mm-sig-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 18, 2013 at 2:25 PM, Sylwester Nawrocki
<sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> My context was a multiprocessor SoC, where one of the processors is somehow
> application specific (e.g. camera ISP) and can be considered as a slave
> subsystem, running it's firmware and sharing system memory with the main
> processor.
>
> The slave subsystem can have insane constraints on the memory region where
> its firmware is located and which it also uses as its generic purpose RAM.
>
> While the region assigned to such a slave device would also likely include
> a memory for its DMA buffers, the main concern here was an allocation of
> a working memory for the slave processor.
>
> Perhaps the device tree is not a perfect place for defining exact memory
> regions. If we happen to decide against it, then I guess some set of
> properties would be needed, that would allow CMA to assign appropriate
> memory region(s) to a device.

The place to add such constraints are in the bindings for the camera ISP.

This isn't that different from how dma-window properties used on some
of the PowerPC platforms; it specifies (among other things) the
available address space as seen from the bus/device side.


-Olof
