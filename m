From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Device Tree questions WRT MIPS/Octeon SOCs.
Date: Sat, 16 Oct 2010 17:24:41 +1100
Message-ID: <20101016062441.GB5036@yookeroo>
References: <4CB79D93.6090500@caviumnetworks.com>
	<AANLkTi=UM2p26JJMqv-cNh8xACS_KPf_dCst5cgmh5VR@mail.gmail.com>
	<20101014.191309.515504596.imp@bsdimp.com>
	<AANLkTi=dqMHa04=-+RjnxuPGL3ZsqNCiaxUPT0VpV6kC@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D01B50901@XMB-RCD-208.cisco.com>
	<4CB89275.8020502@caviumnetworks.com>
	<7A9214B0DEB2074FBCA688B30B04400D01B50924@XMB-RCD-208.cisco.com>
	<20101016034548.GB21170@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101016034548.GB21170-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: prasun.kapoor-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 09:45:48PM -0600, Grant Likely wrote:
> [reorganized quoting]
> On Fri, Oct 15, 2010 at 12:48:55PM -0500, David VomLehn (dvomlehn) wrote:
> > 
> > David Daney wrote:
> > > On 10/15/2010 10:30 AM, David VomLehn (dvomlehn) wrote:
> > > 
> > > > If this is really a question of needing to dynamically generate the
> > > > device tree, then you have no choice. It's worth mentioning, though,
> > > > that the device tree compiler (dtc) does have the ability to include
> > > > files, making it easier to create and maintain device trees that are
> > > > static but which share devices.
> > > 
> > > Some experimentation will be necessary.  We will have to patch in some
> > > properties like the Ethernet MAC address as that is stored in a
> > > separate eeprom.  Also some boards have pluggable I/O modules, so we
> > > may not know at dtb generation time what is there.
> 
> If it touches firmware, then you'll need to be careful about getting
> painted into a corner with an over-complex boot firmware design, but
> yet this sounds like an appropriate approach.
> 
> > We're in much the same situation. Almost all of the device tree is
> > static, but we add on/overwrite little bits. I'm not the device tree
> > expert, but if I understand correctly, you can even have dtc emit labels
> > that you can reference to make the fix-up simpler.
> 
> The labels are not available at runtime, but properties in the
> 'aliases' node can (and should) be used to avoid having to depend on
> the full path to a device node.  It has been on my to-do list for a
> while to add automatic parsing of aliases when finding a node by full
> path.

Well.. the labels can be available at runtime, but only if you use
dtc's "asm" output mode and link the resulting asm code into your
kernel.  There are situations where this is a good approach, but I
suspect yours is not one of them.

libfdt already automatically expands aliases when locating a node by
full path.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
