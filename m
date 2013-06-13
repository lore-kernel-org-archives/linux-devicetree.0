From: "Collins, Rod" <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org>
Subject: RE: Device tree flattening code not copying properties from blob
Date: Thu, 13 Jun 2013 18:49:04 -0400
Message-ID: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF975@corpatsmail4.corp.sensis.com>
References: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com>
 <CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Grant

What is considered the correct way to include the blob in the build so
that it is not removed?

Rod

Rod Collins
Principal Software Engineer
Saab Sensis Corporation
315-445-5784
rodc-eu1g02Y2shuDvotElmWtJA@public.gmane.org


-----Original Message-----
From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of
Grant Likely
Sent: Wednesday, June 12, 2013 12:03 PM
To: Collins, Rod
Cc: devicetree-discuss
Subject: Re: Device tree flattening code not copying properties from
blob

On Wed, Jun 12, 2013 at 3:32 PM, Collins, Rod
<Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org> wrote:
>
> I have been chasing a problem where a module device driver that uses
the device tree I install, cannot find a compatible match when I know
the device tree has the match for my driver.
>
> So I wrote a small module device driver that dumps the device tree
information. I add it to the device driver list using insmod dtdump.ko.
If I add the insmod to the start of the rc (using uCLinux distribution)
file then I get the proper contents. If I add insmod at the end of the
rc file then the device tree is bad.
>
> The problem is in the file fdt.c and the function unflatten_dt_node.
>
> When the unflattened tree is created the memory is allocated for the
nodes and the property structures, however the pointers are just
inserted into the property structure. The pointers are pointing in the
memory area freed after initialization. This will work if the embedded
__init memory is not freed but freeing this memory ends up with tree
nodes that have invalid properties and thus the device tree is no good.

If your fdt blob is getting freed, then you've got a bug. How are you
loading the device tree? Normally the device tree is passed in from the
bootloader and the kernel marks the whole region as reserved.

> I am working on a fix to the unflatten_dt_node function. Allocate
space for the property name and value and copy them in also as the node
name is done.

unflatten_dt_node is actually doing the right thing. If the dt blob is
in an __init section, then it needs to be copied into non-init memory
before unflattening.

g.
-
This message is intended only for the addressee and may contain information that is company confidential or privileged.  Any technical data in this message may be exported only in accordance with the U.S. International Traffic in Arms Regulations (22 CFR Parts 120-130) or the Export Administration Regulations (15 CFR Parts 730-774). Unauthorized use is strictly prohibited and may be unlawful. If you are not the intended recipient, or the person responsible for delivering to the intended recipient, you should not read, copy, disclose or otherwise use this message. If you have received this email in error, please delete it, and advise the sender immediately. 
-                                                                                                                                                                                                                                                       
