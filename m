From: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 13/14] ARM: vexpress: Definition of vexpress dts
	specification
Date: Fri, 20 Aug 2010 15:03:36 -0600 (MDT)
Message-ID: <20100820.150336.619446192412742106.imp@bsdimp.com>
References: <AANLkTimb1vgf1v3TQKsBFBPGrxr9iPpKY3Z6fzfAEPgZ@mail.gmail.com>
	<977313260285850582@unknownmsgid>
	<AANLkTi=WiHd06=e4d_WdCe+HMfFhj-Q=xRS_4f-TzGUs@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=WiHd06=e4d_WdCe+HMfFhj-Q=xRS_4f-TzGUs-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Philippe.Robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

In message: <AANLkTi=WiHd06=e4d_WdCe+HMfFhj-Q=xRS_4f-TzGUs-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
            Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> writes:
: Regardless though, the linux mapping doesn't actually have any bearing
: on the device tree because the mapping from HW to linux irq number is
: all internal to the kernel.  The kernel could choose to start the
: mapping at 42 or somewhere else and it would all still work.

Some (all?) PowerPC platforms start their interrupt numbering at 16,
since interrupts 0-15 are reserved for old-school ISA interrupts from
the Super I/O chip that may (or may not) be present on these systems.
It's all handled inside the kernel, so is invisible to the
device-tree, as Grant is saying.  Also, more OSes than Linux use
device trees, so hard-coding Linux IRQ numbers would be displeasing
from that point of view.

Just to give one concrete example.

Warner
