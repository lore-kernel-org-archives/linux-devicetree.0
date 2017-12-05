From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] Documentation: binding: Update endianness usage
Date: Tue, 05 Dec 2017 14:07:39 -0600
Message-ID: <1512504459.10062.9.camel@buserror.net>
References: <1511954855-8593-1-git-send-email-prabhakar.kushwaha@nxp.com>
         <1512105209.10062.1.camel@buserror.net>
         <HE1PR04MB12414AFA5F8081730B89378497390@HE1PR04MB1241.eurprd04.prod.outlook.com>
         <1512165311.10062.3.camel@buserror.net>
         <HE1PR04MB1241226CD3B7ABD6D5FA2D91973C0@HE1PR04MB1241.eurprd04.prod.outlook.com>
         <1512441957.10062.6.camel@buserror.net>
         <HE1PR04MB1241ADD02E472BA492AE1C8F973D0@HE1PR04MB1241.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <HE1PR04MB1241ADD02E472BA492AE1C8F973D0-6LN7OEpIatU9TB6uw0n1oM9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-12-05 at 09:45 +0000, Prabhakar Kushwaha wrote:
> > -----Original Message-----
> > From: Scott Wood [mailto:oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org]
> > Sent: Tuesday, December 05, 2017 8:16 AM
> > To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>; linux-
> > mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> > Subject: Re: [PATCH] Documentation: binding: Update endianness usage
> > 
> > I now see your patch to of_flash_probe... where is the non-IFC-specific
> > binding that says the *parent* of a CFI node should be looked at for this?
> > Where in general are endian properties kept in the parent of the node with
> > "reg"?  The right answer is to add endianness to mtd-physmap.txt.
> > 
> 
> Flashes are always littler endian. 

We wouldn't be having this discussion if that were true...  This is about how
it presents to the CPU, not about how the actual pins on the chip are
numbered.

> It is because of IFC controller behavior, endianness is required.  
> So as per my understanding, this info should go in IFC binding. 

If the info should go in the IFC binding why is the code in a non-IFC-specific 
place?

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
