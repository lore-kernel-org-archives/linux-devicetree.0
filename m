From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Implements new features for updating existing device
	tree nodes.
Date: Tue, 19 Oct 2010 12:06:51 +1100
Message-ID: <20101019010651.GG5512@yookeroo>
References: <20101016010732.4855.52273.stgit@riker>
	<AANLkTimx4z-YkH+PXcnKYJpq3MEd3oJZ+ow7mWJzn1BN@mail.gmail.com>
	<1287199277.4535.1423.camel@riker> <20101016064744.GD5036@yookeroo>
	<20101016081012.GH653@angua.secretlab.ca>
	<1287236747.4535.1424.camel@riker>
	<20101016183217.GA3774@angua.secretlab.ca>
	<20101018001135.GA4922@yookeroo>
	<20101018160115.GN19399@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101018160115.GN19399-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 18, 2010 at 10:01:15AM -0600, Grant Likely wrote:
[snip]
> It means only the /remove-node/ keyword needs to be defined.  However,
> it does mean that the syntax for full path references must be defined
> immediately before it is useful.

Actually, because of the way DT_REF is lexed, I believe

&{/some/path} {
	prop = "new-value";
};

Will work already.

Or do you mean implementing references to a label + relative path?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
