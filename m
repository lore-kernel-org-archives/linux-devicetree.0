From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/fsl: add device tree binding for QE firmware
Date: Wed, 24 Mar 2010 13:27:58 -0500
Message-ID: <20100324182757.GA25270@loki.buserror.net>
References: <1269380552-10418-1-git-send-email-timur@freescale.com>
	<fa686aa41003232307s39af071bn6377800951d6615c@mail.gmail.com>
	<ed82fe3e1003240505h59d29c83x6948f8b3b70c4570@mail.gmail.com>
	<90D93687-940F-47FB-8CEA-F3C065EA611D@kernel.crashing.org>
	<fa686aa41003241007mf6052d5s4643795f4a87cdcf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <fa686aa41003241007mf6052d5s4643795f4a87cdcf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 24, 2010 at 11:07:42AM -0600, Grant Likely wrote:
> On Wed, Mar 24, 2010 at 11:00 AM, Segher Boessenkool
> <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> >>> Why the phandle redirection? =A0Why not just put the firmware blob in=
to
> >>> a property in the QE node, or as a subnode?
> >>
> >> Because there might be multiple QE devices on a single chip, and each
> >> will need to upload the same firmware. =A0So instead of embedding the
> >> firmware multiple times, just embed it once, and have a pointer.
> >
> > You're messing up the binding because of a (perceived) deficiency in
> > the DTB format? =A0Or maybe just the DTS format. =A0Or maybe you should=
n't
> > even care about size here. =A0Or really, the device tree is the wrong
> > place to store firmware blobs at all.
> =

> That is a good question.  Why is it necessary to pass the blob via the
> tree?

We previously put the firmware in flash, and passed a pointer on the kernel
command line.  Not only is that more complicated and error prone, it
requires that virtualized guests be granted access to the flash.

> Also, depending on firmware to correctly squirt the firmware blob into
> the dtb at boot is risky.  Even when firmware is buggy, there is
> resistance to upgrading firmware =


We need to use different terms for the boot firmware and the device
firmware. :-)

> on working boards because it could result in a bricked board.  In fact,
> every time we depend on firmware to modify the dtb at boot is risky, so it
> should only be done when strictly necessary (I would even say that to date
> we've probably been rather too liberal about getting u-boot to modify the
> device tree).

On p4080 we've gone much farther down that road, a large chunk of the device
tree content is generated dynamically by u-boot.  Being able to use the
device tree to move information from the firmware to the OS is one of the
big benefits of using the tree, IMHO.  If you end up in a situation where
you just can't use the firmware's tree for whatever reason, ignore it and
use a kernel-provided tree and you'll be no worse off than what you'd have
us do all the time.

And it's not even really relevant to whether the firmware goes in the dtb --
you could just as easily stick it in there statically with a binary include
in the dts.

> I would say that either the firmware should be loaded via the existing
> (non-dt) firmware loading mechanism, or it should be built into the
> static dtb blob.  Don't try to add it at runtime.

The binding should only be concerned with what's in the tree, not how it
gets there.

-Scott
