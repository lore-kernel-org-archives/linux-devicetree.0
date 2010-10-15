From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: Re: Device Tree questions WRT MIPS/Octeon SOCs.
Date: Fri, 15 Oct 2010 10:42:13 -0700
Message-ID: <4CB89275.8020502@caviumnetworks.com>
References: <4CB79D93.6090500@caviumnetworks.com>
	<AANLkTi=UM2p26JJMqv-cNh8xACS_KPf_dCst5cgmh5VR@mail.gmail.com>
	<20101014.191309.515504596.imp@bsdimp.com>
	<AANLkTi=dqMHa04=-+RjnxuPGL3ZsqNCiaxUPT0VpV6kC@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D01B50901@XMB-RCD-208.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <7A9214B0DEB2074FBCA688B30B04400D01B50901-2KNrN6/GZtCQwNoRDPPJJaBKnGwkPULj@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: prasun.kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/15/2010 10:30 AM, David VomLehn (dvomlehn) wrote:

> If this is really a question of needing to dynamically generate the
> device tree, then you have no choice. It's worth mentioning, though,
> that the device tree compiler (dtc) does have the ability to include
> files, making it easier to create and maintain device trees that are
> static but which share devices.

Some experimentation will be necessary.  We will have to patch in some
properties like the Ethernet MAC address as that is stored in a
separate eeprom.  Also some boards have pluggable I/O modules, so we
may not know at dtb generation time what is there.

David Daney


>> -----Original Message-----
>> From: linux-mips-bounce-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org [mailto:linux-mips-bounce@linux-
>> mips.org] On Behalf Of Grant Likely
>> Sent: Thursday, October 14, 2010 6:29 PM
>> To: Warner Losh
>> Cc: ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org; prasun.kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org; linux-
>> mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: Device Tree questions WRT MIPS/Octeon SOCs.
>>
>> On Thu, Oct 14, 2010 at 7:13 PM, Warner Losh<imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>  wrote:
>>> In message:<AANLkTi=UM2p26JJMqv-
>> cNh8xACS_KPf_dCst5cgmh5VR-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
>>>             Grant Likely<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>  writes:
>>> : Overall the plan makes sense, however I would suggest the
>> following.
>>> : instead of 'live' modifying the tree, another option is to carry a
>> set
>>> : of 'stock' device trees in the kernel; one per board.  Of course
>> this
>>> : assumes that your current ad-hoc code is keying on the specific
>> board.
>>> :  If it is interpreting data provided by the firmware, then your
>>> : suggestion of modifying a single stock tree probably makes more
>> sense,
>>> : or possibly a combination of the too.  In general you should avoid
>>> : live modification as much as possible.
>>>
>>> The one draw back on this is that there's lots of different "stock"
>>> boards that the Cavium Octeon SDK supports.  These will be difficult
>>> to drag along for every kernel.  And they'd be mostly the same to,
>>> which is why I think that David is suggesting the live modification
>>> thing...
>>
>> Okay.  Do what makes the most sense for your platform.
>>
>> g.
>
>
