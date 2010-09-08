From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: ARM machine specific DT probing
Date: Wed, 08 Sep 2010 15:43:57 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1009081523500.19366@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

While reviewing the ARM DT patches I've come to a misunderstanding of 
how the specific machine support is meant to be matched with DT.

What Jeremy did is to add a probe_dt method in the mdesc structure, and 
then the core is calling them in sequence until one of them returns 
success.

now, the "compatible" property is explained here:

http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property

>From my understanding, this could allow for a kernel that doesn't yet 
support the specifics of a particular board to still be able to work 
using basic common support.  But for this to work, wouldn't it be 
necessary for the core code to try to find the best match itself rather 
than letting each machine's  probe_dt decide on their own?


Nicolas
