From: "Yoder Stuart-B08248" <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: Of the device tree binary format endianness on
	little-endianplatform
Date: Wed, 18 Feb 2009 12:28:33 -0700
Message-ID: <9696D7A991D0824DBA8DFAC74A9C5FA304C9D5EA@az33exm25.fsl.freescale.net>
References: <1234975585.17001.131.camel@pc-laurentg.intra.local>
	<499C40F0.5020800@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-class: urn:content-classes:message
In-Reply-To: <499C40F0.5020800-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

 

> -----Original Message-----
> From: 
> devicetree-discuss-bounces+stuart.yoder=freescale.com@ozlabs.o
> rg 
> [mailto:devicetree-discuss-bounces+stuart.yoder=freescale.com@
ozlabs.org] On Behalf Of Mitch Bradley
> Sent: Wednesday, February 18, 2009 11:10 AM
> To: Laurent Gregoire
> Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> Subject: Re: Of the device tree binary format endianness on 
> little-endianplatform
> 
> >
> > Hi,
> >
> > We are currently investigating the use of a flattened 
> device-tree for
> > configuring some boot parameters on a new ARM platform. ARM being
> > little-endian, the first question that arise is whether we 
> should keep
> > the .dtb binary format itself big-endian or switch to little-endian?
> > Apparently the format does not specify endianness 
> specifically, and I
> > did not found any relevant information concerning this.
> >   
> 
> 
> I can't speak for flattened device trees specifically, but IEEE1275 
> (Open Firmware) specifies that integers are encoded in 
> property values 
> in big-endian byte order.  The model is 
> serialization/deserialization, 
> rather than overlaying a C struct on top of the data.
> 
> > Perhaps this has already been decided somewhere on the 
> roadmap of using
> > device-tree outside the PPC-world.

Please take a look at the ePAPR where the flattened 
device tree format is formally speced out.

http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf

Integers in property values and in the DTB structure
are all big-endian.

Stuart
