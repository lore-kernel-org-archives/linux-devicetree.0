From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: kirkwood devicetree respin
Date: Tue, 20 Mar 2012 15:16:12 -0400
Message-ID: <20120320191612.GF2484@titan.lakedaemon.net>
References: <20120312214325.GD5050@titan.lakedaemon.net>
 <201203131557.49488.arnd@arndb.de>
 <20120320172238.GC2484@titan.lakedaemon.net>
 <alpine.LFD.2.02.1203201401410.24151@xanadu.home>
 <20120320182459.GD2484@titan.lakedaemon.net>
 <alpine.LFD.2.02.1203201454540.24151@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.02.1203201454540.24151-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>, michael-QKn5cuLxLXY@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 20, 2012 at 03:03:45PM -0400, Nicolas Pitre wrote:
> On Tue, 20 Mar 2012, Jason Cooper wrote:
> 
> > On Tue, Mar 20, 2012 at 02:03:23PM -0400, Nicolas Pitre wrote:
> > > On Tue, 20 Mar 2012, Jason Cooper wrote:
> > > 
> > > > I figure most folks will build orion-ehci as a module and use an initrd.
> > > 
> > > Possibly, however that doesn't mean this shouldn't be fixed anyway.
> > 
> > Yes, I didn't mean to imply otherwise.  I know new patches for v3.4 are
> > no longer being accepted (they should already be in for-next, right?)
> > So, I'm not sure what the disposition of this patch should be.
> 
> Just send it to arm-soc as usual, identifying it as a fix.
> Or, given that this is USB related, you might send it to 
> linux-usb-u79uwXL29TaiAVqoAR/hOA@public.gmane.org

Ok.

> > If it's appropriate to push it into v3.4[-rc?], great.  I just didn't
> > want to assume that and appear to be pushing patches after the for-next
> > window closed.  I'll send it whereever you guys advise.
> 
> It is always appropriate to send bug fixes.  This is the kind of patches 
> for which there is a -rc period.

good to know.

> It is too late for v3.3 now as it was released 2 days ago.  However if 
> v3.3 is also broken then the fix for v3.4-rc can carry the 
> "CC: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" annotation so it'll be picked up for 
> v3.3.1 as well.

It should only be broken for folks trying to boot a mainline u-boot and
kernel on the dreamplug without an initrd.  That requires v3.4.  There
maybe some other folks I don't know about so I'll add the CC just in
case.

Thanks for the clarification,

Jason.
