From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] of/device: Don't register disabled devices
Date: Thu, 6 Jan 2011 10:35:35 +1100
Message-ID: <20110105233535.GB8846@yookeroo>
References: <20110103230122.25772.72990.stgit@localhost6.localdomain6>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA8E5@na3-mail.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <DD7A9A95166BF4418C4C1EB2033B6EE2038FA8E5-1KJr3DFo5IITHwIYFunNKKbYDNqAj0Ws@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 05, 2011 at 02:53:27PM -0800, Blanchard, Hollis wrote:
> On 01/03/2011 03:01 PM, Grant Likely wrote:
> > Device nodes with the property status="disabled" are not usable and so
> > don't register them when parsing the device tree for devices.
> >
> This is great and all, but a fair amount of driver code explicitly 
> searches the tree, rather than registering a probe function. That's why 
> our earlier patches in this area were more comprehensive.
> 
> What are your thoughts on handling those cases?

One by one.  Trying to handle the explicit searches automagically is
just asking for trouble.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
