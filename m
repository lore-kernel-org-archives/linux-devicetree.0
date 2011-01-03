From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/7] of: Fixes for OF probing on little endian systems
Date: Mon, 3 Jan 2011 12:24:12 -0700
Message-ID: <20110103192412.GA4391@angua.secretlab.ca>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
	<1289939635-30742-3-git-send-email-robherring2@gmail.com>
	<20101117052331.GA12813@angua.secretlab.ca>
	<4D221094.5070703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D221094.5070703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 03, 2011 at 12:08:20PM -0600, Rob Herring wrote:
> Grant,
> 
> On 11/16/2010 11:23 PM, Grant Likely wrote:
> >On Tue, Nov 16, 2010 at 02:33:50PM -0600, Rob Herring wrote:
> >>From: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>
> >>Fixes for sdhci-of and ipmi drivers.
> >>
> >>Auditing all drivers using of_get_property did not find other
> >>occurrences likely to be used on LE platforms.
> >>
> >>Signed-off-by: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >
> >Merged, thanks.

Hmmm, I don't know what happened there, but I've re-merged it now and
it will appear in my public tree after I run through sanity testing.

g.

> 
> I don't see this one in your tree. Are you still going to take this one?
> 
> Rob
