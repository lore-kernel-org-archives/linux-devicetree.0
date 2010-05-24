From: "Edgar E. Iglesias" <edgar.iglesias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CELF Project Proposal/Add Device Tree emulation support to QEMU
Date: Mon, 24 May 2010 15:05:31 +0200
Message-ID: <20100524130531.GB9050@edde.se.axis.com>
References: <4BF9BB22.2000603@crca.org.au>
	<AANLkTilCe5FyT6Pcz61FnhpbpdLhg2EGSfk4jZlKdQKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilCe5FyT6Pcz61FnhpbpdLhg2EGSfk4jZlKdQKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nigel Cunningham <ncunningham-VWkGxi2CTS+6c6uEtOJ/EA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, May 23, 2010 at 11:20:43PM -0600, Grant Likely wrote:
> (cc'ing devicetree-discuss and others)
> 
> On Sun, May 23, 2010 at 5:32 PM, Nigel Cunningham
> <ncunningham-VWkGxi2CTS+6c6uEtOJ/EA@public.gmane.org> wrote:
> > http://elinux.org/CELF_Project_Proposal/Add_Device_Tree_emulation_support_to_QEMU
> >
> > Grant, I've joined the devicetree-discuss mailing list, and am seeking to
> > get up to speed with things, but want to find out before I get too carried
> > away what your thoughts are on Rob's proposal. In your opinion, is there a
> > useful contribution I can make in this area, or do you already have it all
> > in hand and not need any help? (I'm not sure how old Rob's proposal is).
> 
> Hi Nigel,
> 
> A bunch of work has already been done in this area, but not all of it
> has been pushed upstream.  Edgar Ingesias and John Williams
> collaborated to bring up QEMU microblaze support, including a device
> tree parser.  I believe John & Petalogix is continuing to pursue this
> work, but I don't know what the state of it is.  Much of the
> Microblaze support is in mainline, but I don't think the device tree
> parser has been pushed up yet.  John and Edgar can tell you about this
> much better than I.


Hi Grant and others,

There are many ways one could use device tree's in QEMU. In fact, upstream
QEMU already has some support for parsing and editing the device trees
prior to starting machines (e.g for kernel cmdline passing etc).

For MicroBlaze we wanted to instantiate machines based on a pre-existing
device tree format. With pre-existing format I mean that we didn't want to
create QEMU specific entries in the device tree file. We wanted to reuse
fdt files with device names and properties that were already widely used.

Our implementation is very simple but also limited, it wraps a device-tree
layer around QEMU. There are very few changes to existing QEMU code, most
of the work is done in a new machine file. QEMU takes a device tree and
instantiates the machine based on it.

The implementation is very geared towards Xilinx machines, nothing else is
supported. The machine makes lot's of hardcoded assumptions that really
should have been picked up from the device-tree. 

I'd be happy to clean the code up and also to address specific comments
people may have. At the moment though, I'm pretty chocked and cannot drive
discussions to reach wide consensus on how this thing should be properly
done & integrated to fit all archs/machines/etc in order to go upstream.

The fdt support for Xilinx MicroBlaze is available here:
git://repo.or.cz/qemu/cris-port.git

Cheers,
Edgar


> 
> Independently, Jeremy Kerr added QEMU support for passing a device
> tree to the kernel on the ARM architecture via an ATAG, and I added
> code for generating the device tree contents from the set of
> instantiated devices.  This approach is rather different from what
> John and Edgar have done as it still requires a separate method of
> configuring QEMU.  While I find it useful, this approach probably
> isn't the best long term solution.
> 
> I'm not actively working on this other than adding the bits and pieces
> I need to improve the ARM device tree support in the kernel.  You'll
> have to coordinate with John and Edgar to figure out if there is a
> useful contribution that you can make.
> 
> Cheers,
> g.
