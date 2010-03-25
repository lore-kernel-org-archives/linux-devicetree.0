From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Thu, 25 Mar 2010 10:16:55 -0500
Message-ID: <4BAB7E67.6040707@freescale.com>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>	<4BAA4C8A.70104@freescale.com>
	<65327.84.105.60.153.1269481760.squirrel@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <65327.84.105.60.153.1269481760.squirrel-JorI+TVEvZrY24RiXHRV3ti2O/JbrIOy@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Segher Boessenkool wrote:
> As far as I can see, you want that indirection node so that you
> safe space in the DTB.

Probably more of a general desire to not duplicate things that don't 
need to be duplicated...  I don't think the space issue is critical in 
this particular case.

> With real OF it is trivial to not have
> multiple copies of the data if you want a few properties with
> the same data.  There is no reason this could not be done in DTB
> as well (and some way in DTS to express that, or maybe the tools
> could auto-detect it, whatever).

You object to some slight complexity in the device binding, and want to 
replace it with an incompatible, more complex change to the blob format?

>>> That is a good question.  Why is it necessary to pass the blob via the
>>> tree?
>> Because sometimes the firmware is needed before networking or serial I/O
>> can function.
> 
> Can't you link it into the kernel then?  Seems a better place for
> it to me.  Of course you said something about GPL, heh.

U-Boot needs it too.

-Scott
