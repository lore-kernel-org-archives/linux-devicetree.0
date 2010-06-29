From: Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 29 Jun 2010 14:42:55 -0600
Message-ID: <0ee58b3d-e533-4d85-a15a-959138b0329e@email.android.com>
References: <AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
	<20100629012207.GG13509@yookeroo>
	<cf16ff7b-9208-4f47-8cea-ed8a8e52d30e@email.android.com>
	<20100629.102503.835458634865560451.imp@bsdimp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100629.102503.835458634865560451.imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



"M. Warner Losh" <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org> wrote:

>In message: <cf16ff7b-9208-4f47-8cea-ed8a8e52d30e-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
>            Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> writes:
>: FPGA on an add-on board in an x86 host.  Device tree fragment
>: describes the fpga design.  There could be multiple boards in a
>: system.
>
>How do you imagine these fragments getting loaded into the system?

I think the driver should use the firmware loading interface.

g.

-- 
Sent from my Android phone with K-9 Mail. Please excuse my brevity.
