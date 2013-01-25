From: "Saridakis, Dean   (US SSA)" <dean.saridakis-IHqVjY1oUdQxoycv7ERPSQ@public.gmane.org>
Subject: DTs, Linux drivers & PCI Devices
Date: Fri, 25 Jan 2013 16:30:32 +0000
Message-ID: <B98BBFB67D89184E8E876F332BDBC3E0A0C06D@GLDMS85001.goldlnk.rootlnka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Language: en-US
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
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I've been diving into Linux kernel drivers & device trees for a new project & am looking for some help. 

First, is it reasonable/possible to define a PCI (PCIe) device in a device tree? Seems like you'd have to reference a BAR#s to do this (& still have addresses mapped by enumeration).  A couple reasons I'm interested in doing this:
- The PCI device logic will be migrated to a system bus
- DT properties provide a nice way to pass in driver configuration data 

It's not clear to me how the linux kernel interprets/processes the device tree. I'm working w/ powerpc (fsl QorIQ). E.g., shouldn't everything from the DT show up in /sys/bus/platform/devices ? I noticed that not everything is there, e.g., only 2 of the 4 PCIe RCs. (Noticed this after trying to add my own simple dummy entry to a reserved reg space as an experiment).

Ultimately I'd like to use the DT to describe a set of logic cores on a subordinate bus. There is also a subordinate interrupt controller, which I think I can figure out how to describe, but am not sure how kernel glue works -- somehow I'd need to bind that controller to routing code I provide. 

Documentation I've been reading includes:
- ePAPR
- DT wiki
- kernel doc (driver-model, devicetree)
- Linux DDs v3 (no coverage of platform drivers)
Any other recommended docs?

Thanks,
Dean 
