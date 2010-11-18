From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/5] scripts: dtc: Merge in changes from the dtc repository
Date: Thu, 18 Nov 2010 14:41:45 +1100
Message-ID: <20101118034145.GB7256@yookeroo>
References: <20101116204917.12146.39851.stgit@riker>
	<20101116204951.12146.21084.stgit@riker>
	<20101117045935.GA12084@angua.secretlab.ca>
	<E1PIkEl-0006Zt-W7@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1PIkEl-0006Zt-W7-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 17, 2010 at 09:47:55AM -0600, Jon Loeliger wrote:
> > On Tue, Nov 16, 2010 at 12:49:51PM -0800, John Bonesio wrote:
> > > Pull in recent changes from the main dtc repository. These changes primarily
> > > allow multiple device trees to be declared which are merged by dtc. This
> > > feature allows us to include a basic dts file and then provide more informatio
> > n
> > > for the specific system through the merging functionality.
> > > 
> > > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > 
> > Jon & David, I'll need your input on whether or not this is the best
> > way to handle updating the dtc copy in the kernel tree.
> > 
> > g.
> 
> Grant,
> 
> Yeah, I wondered too. :-)  David added it and updated
> in the kernel last round, so he may have some good notion
> of what would be best there.

For now I think just a direct diff updating the in-kernel dtc to
current upstream is the simplest approach.  This is how I made the
original commit.

There may be better methods to directly arrange for pulling of the dtc
git tree into the kernel git tree, but I have not had time to
investigate and set up such a scheme.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
