From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: dtc: Add code to make diffing trees easier
Date: Mon, 11 Oct 2010 09:23:58 -0500
Message-ID: <E1P5JIE-0002Pw-J1@jdl.com>
References: <20101011003738.GA5463@yookeroo>
	<20101011055219.GK23588@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20101011055219.GK23588-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org> 
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
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Mon, Oct 11, 2010 at 11:37:38AM +1100, David Gibson wrote:
> > This patch adds a "dtdiff" script to do a useful form diff of two
> > device trees.  This automatically converts the tree to dts form (if
> > it's not already) and uses a new "-s" option in dtc to "sort" the
> > tree.  That is, it sorts the reserve entries, it sorts the properties
> > within each node by name, and it sorts nodes by name within their
> > parent.
> > 
> > This gives a pretty sensible diff between the trees, which will ignore
> > semantically null internal rearrangements (directly diffing the dts
> > files can give a lot of noise due to the order changes).
> > 
> > Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

I am inclined to take this patch.  Any other comments?  Matt?

Thanks,
jdl
