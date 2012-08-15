From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for
 Pre-Processing.
Date: Wed, 15 Aug 2012 21:29:11 +1000
Message-ID: <20120815112911.GC4171@truffula.fritz.box>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
 <20120815011149.GF8136@truffula.fritz.box>
 <CAOZdJXUxguEBJG44kyKH0NW1999a9OBj2M=DEhmf_uSYM6nGaQ@mail.gmail.com>
 <502B70B8.1030709@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <502B70B8.1030709-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: "mmarek-AlSwsSmVLrQ@public.gmane.org" <mmarek-AlSwsSmVLrQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tabi Timur-B04825 <B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 15, 2012 at 10:49:44AM +0100, Srinivas KANDAGATLA wrote:
> On 15/08/12 03:12, Tabi Timur-B04825 wrote:
> > On Tue, Aug 14, 2012 at 8:11 PM, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org> wrote:
> >> On Mon, Aug 13, 2012 at 09:01:53AM +0100, Srinivas KANDAGATLA wrote:
> >>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> >>>
> >>> This patch add pre-processing capablity to dtc based on status property.
> >>> Now the dtc has additional option -P to enable Pre-processing based on
> >>> status property.
> >>>
> >>> The SOCS have lot of device tree infrastructure files which mark the
> >>> device nodes as disabled and the board level device tree enables them if
> >>> required. However while creating device tree blob, the compiler can
> >>> preprocess the nodes and exclude nodes marked as disabled, doing this
> >>> way will reduce the size of device tree blob.
> > IMHO, many devices that are marked as "disabled" in the DTS are
> > expecting to be enabled by the boot loader, so just because a node is
> > disabled in the DTS does not mean that it will be disabled when Linux
> > sees it.
> Good to know that,
> But some of the secured bootloaders like the one's we use don't even
> touch the dt blob.

It's not just a question of bootloaders.  Status "disabled" devices
can potentially be activated in some way by the OS.  For example ePAPR
specifies that all secondary CPUs be marked "disabled" with other
properties indicating the method by which the OS can turn them on.

> >>> In our case this has reduced the blob size from 29K to 15K.
> > I don't see that as significant.
> >
> >>> Also nodes with status="disabled" is are never probed by dt platform bus
> >>> code.
> >>>
> >>> Again, Preprocessing is optional parameter to dtc.
> > Using this option would break a lot of our device trees.
> As this is optional parameter, I did not expect it to break the
> default/existing behavior.
> Correct me am missing anything?
> >   Perhaps it
> > should be given a better name, like --strip-disabled.
> Thanks for the advice. I agree, Will be reposting the patch making this
> option as --strip-disabled with CC to Jon Loeliger (dtc maintainer).

--strip-disabled is a reasonable name, however at present dtc doesn't
support long option names, so there will be some more work enabling
that.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
