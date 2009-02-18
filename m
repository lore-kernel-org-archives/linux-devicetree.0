From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: Of the device tree binary format endianness on little-endian
	platform
Date: Wed, 18 Feb 2009 07:10:08 -1000
Message-ID: <499C40F0.5020800@firmworks.com>
References: <1234975585.17001.131.camel@pc-laurentg.intra.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <1234975585.17001.131.camel-AlTa8cHOufjkPJRI6LV1/EZjUo8kaGiB@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

>
> Hi,
>
> We are currently investigating the use of a flattened device-tree for
> configuring some boot parameters on a new ARM platform. ARM being
> little-endian, the first question that arise is whether we should keep
> the .dtb binary format itself big-endian or switch to little-endian?
> Apparently the format does not specify endianness specifically, and I
> did not found any relevant information concerning this.
>   


I can't speak for flattened device trees specifically, but IEEE1275 
(Open Firmware) specifies that integers are encoded in property values 
in big-endian byte order.  The model is serialization/deserialization, 
rather than overlaying a C struct on top of the data.

> Perhaps this has already been decided somewhere on the roadmap of using
> device-tree outside the PPC-world.
>
> Any comments welcomed,
>
> Laurent GREGOIRE
> Embedded Software Engineering | TomTom | www.tomtom.com
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
> https://ozlabs.org/mailman/listinfo/devicetree-discuss
>   
