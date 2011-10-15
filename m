From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
Date: Fri, 14 Oct 2011 21:04:15 -0600
Message-ID: <20111015030415.GA8274@ponder.secretlab.ca>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
 <1318600108.12351.130.camel@sauron> <20111014142149.GA25079@totoro>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20111014142149.GA25079@totoro>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Artem Bityutskiy <dedekind1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 14, 2011 at 03:21:49PM +0100, Jamie Iles wrote:
> Hi Artem,
> 
> On Fri, Oct 14, 2011 at 04:48:20PM +0300, Artem Bityutskiy wrote:
> > On Wed, 2011-10-12 at 00:10 +0100, Jamie Iles wrote:
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id gpio_nand_id_table[] = {
> > > +	{ .compatible = "gpio-control-nand" },
> > > +	{}
> > > +};
> > > +MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
> > ...
> > > +#else /* CONFIG_OF */
> > ...
> > > +#endif /* CONFIG_OF */
> > 
> > I wonder, why it is either OF of platform data? What if I want my kernel
> > to fall-back to platform data if device tree data is absent? What is the
> > general policy? Sorry, I am not very well aware of the DT stuff. But off
> 
> I think the general policy is that for device tree everything should be 
> in the device tree.  There is a mechanism for device tree platforms to 
> pass platform data too, but I believe this is more as a tool for 
> migrating existing platforms to device tree.
> 
> Also, the device tree binding should be well documented - if the device 
> is present in the tree it should have all of the required properties.  
> If the device isn't there at all then it won't get registered.
> 
> > the top of my head, it is logical when things go like this: I have a
> > kernel with working platform data, but I can change that dynamically by
> > feeding it a device tree configuration. Hmm?
> 
> I think in general platform data and device tree should be mutually 
> exclusive.

No, Artem is correct.  It is *not* okay to break platform_data support
simply by turning on CONFIG_OF.  The driver must be able to support
both, and to choose its data source at runtime.

Essentially, turning on CONFIG_OF adds the ability to boot with a
device tree while still being able to boot on legacy platforms.

g.
