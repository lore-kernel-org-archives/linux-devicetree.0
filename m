From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: Re: [Qemu-devel] CELF Project Proposal - Device tree support for QEMU
	system emulation.
Date: Tue, 22 Dec 2009 12:54:22 -0600
Message-ID: <200912221254.23063.rob@landley.net>
References: <200912162246.42366.rob@landley.net>
	<4B2A94BB.4020200@codemonkey.ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4B2A94BB.4020200-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Anthony Liguori <anthony-rdkfGonbjUSkNkDKm+mE6A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, CE Linux Developers List <celinux-dev-VxL1A5FK7jA05z2xGA6PZHhyD016LWXt@public.gmane.org>, Paul Brook <paul-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 17 December 2009 14:29:47 Anthony Liguori wrote:
> Rob Landley wrote:
> > For background of CELF project proposals, see:
> >
> >   http://elinux.org/CELF_Open_Project_Proposal_2010
> >
> > Summary:
> >
> > Integrate a flattened device tree parser into the emulator QEMU, so QEMU
> > can create board emulations on the fly (at runtime) from the same data
> > files the Linux kernel uses to attach drivers to hardware.
>
> See
>
> http://thread.gmane.org/gmane.comp.emulators.qemu/44869
>
> I'm not sure why Paul never pushed it but I think he was able to create
> the syborg board purely from a device tree.

He'd be a great person to sponsor to get it finished/updated and checked 
in, then.  (Or his company, code sourcry, would.)  Me, I just want to use the 
result.

By the way, device trees were a topic at this year's kernel summit, and LWN 
did an excellent write-up, as usual: http://lwn.net/Articles/357487/

(If it does get done, somebody needs to write a HOWTO...)

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
