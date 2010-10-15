From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Fri, 15 Oct 2010 09:10:55 -0700
Message-ID: <b04d95cc-c35b-4597-8fbe-f7c48f23ef92@VA3EHSMHS036.ehs.local>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
	<21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
	<20101015151840.GB32705@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <20101015151840.GB32705-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant
Likely
> Sent: Friday, October 15, 2010 8:19 AM
> To: Stephen Neuendorffer
> Cc: David Gibson; John Bonesio; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: Re: Proposal: new device-tree syntax and semantics for
extendinginformation from included dts
> files
> 
> On Thu, Oct 14, 2010 at 09:38:44AM -0700, Stephen Neuendorffer wrote:
> [fixed quoting header]
> > On Wed, Oct 13, 2010 5:46 PM, David Gibson wrote:
> > > On Wed, Oct 13, 2010 at 04:41:59PM -0700, Stephen Neuendorffer
wrote:
> > > [snip]
> > > > Or better yet, outside of the braces?
> [...]
> > > >             /remove/ {
> > > >  				serial@2600 { };
// PSC4
> > > >
> > > >  				serial@2800 { };
// PSC5
> > > >  		};
> > >
> > > Um.. no.  That makes even less sense in the conceptual framework
of a
> > > stack of overlays.
> >
> > Why exactly?  Instead of being a stack of overlays, it seems to me
like
> > a stack of trees with operators..
> > The point is exactly that operators make most sense at the stack of
> > trees level and not
> > at the individual node level.
> 
> I don't think I'm understanding what you're trying to say.  How do you
differentiate "stack of
> overlays" and "stack of trees"?
> 
> The reason I don't like this approach is that in many cases many
> things will need to be changed by a single overlay, and not all those
> changes will be the same operation.  For example, an overlay for a
> board could add a bunch of nodes for i2c devices, and at the same time
> remove an unused spi bus device.

So why not have two trees stacked to do the job? 
 
> The "stack of overlays" conceptual model that we've settled on uses
> the concept that subsequent top level trees stack on top of the
> preceding tree and can mask out or add/change nodes and properties.
> The trees are merged together before going on to the next top level
> tree.
> 
> g.
> 

I guess I'm stuck on 'overlay' to me implies '/extend/', so I associate
the operations being on trees, not individual nodes.
(Although, there's still the tough part about /remove-node/ vs
/remove-property/,
which might meant that the operations have to be in the trees to
distinguish that).

Steve

This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
