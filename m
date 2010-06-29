From: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 29 Jun 2010 10:25:03 -0600 (MDT)
Message-ID: <20100629.102503.835458634865560451.imp@bsdimp.com>
References: <AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
	<20100629012207.GG13509@yookeroo>
	<cf16ff7b-9208-4f47-8cea-ed8a8e52d30e@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cf16ff7b-9208-4f47-8cea-ed8a8e52d30e-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

In message: <cf16ff7b-9208-4f47-8cea-ed8a8e52d30e-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
            Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> writes:
: 
: >> Another question is what to do with the unflattened tree once it is
: >> unflattened.  Some of the existing code expects the node to be part of
: >> the global tree.  Those could either be refactored, or the new partial
: >> tree could be grafted into the global tree.  Grafting will have the
: >> least impact, but it probably isn't a good idea in the long term.
: >> Grafting together unrelated trees seems messy to me.
: >
: >I think I must have missed an earlier discussion.  What's the use case
: >for multiple fdt blobs?
: 
: FPGA on an add-on board in an x86 host.  Device tree fragment
: describes the fpga design.  There could be multiple boards in a
: system.

How do you imagine these fragments getting loaded into the system?

Warner
