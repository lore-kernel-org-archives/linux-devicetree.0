From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: atmel_nand: make PMECC lookup table and offset
 property optional
Date: Fri, 19 Sep 2014 09:34:31 -0700
Message-ID: <20140919163431.GE1193@ld-irv-0074>
References: <1408345720-5402-1-git-send-email-josh.wu@atmel.com>
 <20140918003258.GD1193@ld-irv-0074>
 <541A92E3.60906@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <541A92E3.60906-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 18, 2014 at 04:08:03PM +0800, Josh Wu wrote:
> On 9/18/2014 8:32 AM, Brian Norris wrote:
> >On Mon, Aug 18, 2014 at 03:08:40PM +0800, Josh Wu wrote:
> >>+static int pmecc_build_galois_table(int mm,
> >>+		int16_t *index_of, int16_t *alpha_to)
> >>+{
...
> >>+}
> >Is this algorithm documented? How did you come up with this?
> 
> It is not documented in datasheet. It is based BCH algorithm. But do
> you know if the soft BCH use a same table like this?

I haven't delved into the algorithms here too much. Other BCH/ECC codes
do similar steps, but either (1) there's usually a few comments about
their origin or else (2) they're transparently handled by hardware ECC
engines and software doesn't need to care about the details much.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
