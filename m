From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Device tree with early buffer allocations and aliased memory
Date: Thu, 18 Nov 2010 14:08:27 -0800
Message-ID: <20101118220827.GA6180@dvomlehn-lnx2.corp.sa.net>
References: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
	<AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv@mail.gmail.com>
	<20101103205037.GA15096@dvomlehn-lnx2.corp.sa.net>
	<20101110042537.GA4110@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101110042537.GA4110-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 09, 2010 at 10:25:37PM -0600, Grant Likely wrote:
> On Wed, Nov 03, 2010 at 01:50:37PM -0700, David VomLehn wrote:
> > This got eaten as junk mail, so pardon the slow response. Also, Stuart
...
> > On Sat, Oct 30, 2010 at 10:57:34PM -0500, Grant Likely wrote:
> > > On Wed, Oct 27, 2010 at 2:49 PM, David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org> wrote:
...
> > This still leaves the question of buffers. Buffers with statically and
> > dynamically assigned addresses need some sort of identifier so that
> > they can be referenced by device drivers. There may be more than one
> > buffer per device and a single device may use buffers with statically
> > assigned addresses and buffers with dynamically assigned addresses.
> > Buffers with statically assigned buffers addresses could be handled
> > with something like:
> > 
> > 	device-s {
> > 		compatible = "cisco,device-s";
> > 		cisco,static-buffers = 
> > 			"device-s-b1",<0x24000000 0x00100000>,
> > 			"device-s-b2",<0x60000000 0x00200000>;
> 
> Or, simply:
> 	cisco,static-buffer-b1 = <0x24000000 0x00100000>;
> 	cisco,static-buffer-b2 = <0x60000000 0x00200000>;
> 
> Try to avoid mixing string and cell values in the same property where
> appropriate.  Sometimes doing so is the best binding, but those cases
> are rare.

I started implementing the 'cisco,static-buffer-b1' solution and it feels pretty awkward.
When I want to get the property value, I have to know not only the constant property
name but also a buffer name. The buffer name is really one of the pieces of data I
want to get. I can, of course, write code to scan the node and do a partial match on
the property name, but that doesn't feel like the rest of the DT API.

Not only does this have me doing odd things to property names, but I have a number of
devices. If I should want another buffer, I must create another property name.
This solution has me creating a bunch of property names, which all I really
want is two: "cisco,static-buffers" and "cisco,dynamic-buffers".

I think this is an occasion where it makes sense to mix string and cell values in the
same property.

> g.

-- 
David VL
