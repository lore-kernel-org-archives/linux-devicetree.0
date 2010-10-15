From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: Device Tree questions WRT MIPS/Octeon SOCs.
Date: Thu, 14 Oct 2010 19:13:09 -0600 (MDT)
Message-ID: <20101014.191309.515504596.imp@bsdimp.com>
References: <4CB79D93.6090500@caviumnetworks.com>
	<AANLkTi=UM2p26JJMqv-cNh8xACS_KPf_dCst5cgmh5VR@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTi=UM2p26JJMqv-cNh8xACS_KPf_dCst5cgmh5VR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: prasun.kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

In message: <AANLkTi=UM2p26JJMqv-cNh8xACS_KPf_dCst5cgmh5VR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
            Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> writes:
: Overall the plan makes sense, however I would suggest the following.
: instead of 'live' modifying the tree, another option is to carry a set
: of 'stock' device trees in the kernel; one per board.  Of course this
: assumes that your current ad-hoc code is keying on the specific board.
:  If it is interpreting data provided by the firmware, then your
: suggestion of modifying a single stock tree probably makes more sense,
: or possibly a combination of the too.  In general you should avoid
: live modification as much as possible.

The one draw back on this is that there's lots of different "stock"
boards that the Cavium Octeon SDK supports.  These will be difficult
to drag along for every kernel.  And they'd be mostly the same to,
which is why I think that David is suggesting the live modification
thing...

I know that FreeBSD will have exactly the same problem as we move to
using the FDT for FreeBSD/mips' configuration.

Warner
