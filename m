From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Power.org:parch] devicetree: Musings on reserved regions
Date: Mon, 7 Feb 2011 15:46:36 -0600
Message-ID: <20110207154636.450b093c@udp111988uds>
References: <AANLkTinjPk1rJp1pCvM3ZTsLnEym57qU6u72vL8JQ1V3@mail.gmail.com>
	<1297114766.14982.76.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1297114766.14982.76.camel@pasglop>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org" <parch-QRwYI7m9GJLYtjvyW6yDsg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, Stuart Yoder <b08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 8 Feb 2011 08:39:26 +1100
Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:

> 
> > In addition to the reserved regions block in the header, define a set
> > of properties in the memory node that specify the reserved regions
> > with the name reflecting the usage.
> > For example:
> > 
> > 	memory@0 {
> > 		device_type = "memory";
> > 		reg = <0 0x40000000>;
> > 		reserved-ramdisk = <0xc00000 0x200000>; /* 2MB ramdisk */
> > 		reserved-dtb = <0xbf0000 0x1000>; /* devicetree */
> > 		reserved-fb0 = 0x1000000 0x400000>; /* framebuffer */
> > 	};
> > 
> > Each reserved property would start with "reserved-" followed by a
> > name.  reserved-ramdisk and reserved-dtb would be reserved for ramdisk
> > and dtb images respectively.  Other names could also be defined; for
> > example, reserved-openfirmware.
> 
> I very much dislike the list of properties with magic names. I'd rather
> have a pair of properties containing lists (reserved-names and
> reserved-ranges).

How about a node:

memory@0 {
	device_type = "memory";
	reg = <0 0x40000000>;

	reserved {
		ramdisk = <0xc00000 0x200000>; /* 2MB ramdisk */
		dtb = <0xbf0000 0x1000>; /* devicetree */
		fb0 = <0x1000000 0x400000>; /* framebuffer */
		something-fragmented = <0x800000 0x100000 0xa00000 0x100000>;
	};
};

Or is the objection to any use of the property name to indicate reservation type,
rather than the magic "reserved-" prefix?

-Scott
