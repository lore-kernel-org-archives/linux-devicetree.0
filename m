From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device Tree questions WRT MIPS/Octeon SOCs.
Date: Thu, 14 Oct 2010 18:32:00 -0600
Message-ID: <AANLkTi=UM2p26JJMqv-cNh8xACS_KPf_dCst5cgmh5VR@mail.gmail.com>
References: <4CB79D93.6090500@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4CB79D93.6090500-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Prasun Kapoor <prasun.kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-mips <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David.

On Thu, Oct 14, 2010 at 6:17 PM, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wr=
ote:
[...]
> I want to convert this to use the device tree and related functions.
>
> Since none of the existing hardware has an existing device tree I plan on
> taking a two pronged approach.
>
> Modify platform drivers to get configuration information from the device
> tree. =A0Then:
>
> 1) Load and use a dtb blob as specified on the kernel command line.
>
> 2) If no command line dtb specified, use a default dtb embedded in the
> kernel image and then edit or patch it using of_attach_node(),
> of_detach_node(), prom_remove_property(), and prom_add_property() based on
> some of the the same ad hoc code we currently use.
>
> Q: As a very high level plan does this make any sense?

Overall the plan makes sense, however I would suggest the following.
instead of 'live' modifying the tree, another option is to carry a set
of 'stock' device trees in the kernel; one per board.  Of course this
assumes that your current ad-hoc code is keying on the specific board.
 If it is interpreting data provided by the firmware, then your
suggestion of modifying a single stock tree probably makes more sense,
or possibly a combination of the too.  In general you should avoid
live modification as much as possible.

g.
