From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/3] sparc: make driver/of/pdt no longer sparc-specific
Date: Mon, 16 Aug 2010 00:22:44 -0400
Message-ID: <20100816002244.6ddf37e6@debxo>
References: <20100808231116.21c7d6f3@dev.queued.net>
	<AANLkTimG7u5eXWSn5VznKfuFcFD+evTzo1_QpAFmCdpL@mail.gmail.com>
	<20100809013245.1cefb9bf@dev.queued.net>
	<20100808.223444.62324566.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100808.223444.62324566.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, 08 Aug 2010 22:34:44 -0700 (PDT)
David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org> wrote:

> From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
> Date: Mon, 9 Aug 2010 01:32:45 -0400
> 
> > On Sun, 8 Aug 2010 23:12:21 -0600
> > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > 
> >> If you have to explicitly cast these function pointers, then you're
> >> doing it wrong.  :-)  Listen to and fix the compiler complaint
> >> here.
> >> 
> > 
> > Hm, can you please expand on that?  The reason it's necessary to
> > cast is because sparc's prom_* functions are using ints instead of
> > phandles.  I don't understand why casting is the wrong thing here.
> > 
> > I could write some 1-line wrapper functions that simply call prom_*
> > rather than casting, I suppose.
> 
> There's no reason the Sparc interfaces can't take phandles since they
> are just ints, and that would make the call signatures of these
> functions compatible with the types used by the other architectures.

You're saying to convert the sparc code to use phandles?  Doing so has
caused phandles to show up in asm/openprom.h (linux_dev_v2_funcs's
v2_inst2pkg returns a phandle, and linux_nodeops use phandles).  This
is fine, except asm/openprom.h is an exported kernel header, and
linux/of.h is not.

I'm tempted to break the phandle/device_node/property stuff out into a
separate header (that gets exported), and include that from linux/of.h
and asm/openprom.h.
