From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dtc: Support character literals in bytestrings
Date: Thu, 8 Sep 2011 00:07:16 -0700
Message-ID: <20110908070716.GC15955@ponder.secretlab.ca>
References: <1315437340-1661-1-git-send-email-robotboy@chromium.org>
	<1315437340-1661-4-git-send-email-robotboy@chromium.org>
	<20110908035149.GO30278@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110908035149.GO30278-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2011 at 01:51:49PM +1000, David Gibson wrote:
> On Wed, Sep 07, 2011 at 04:15:40PM -0700, Anton Staaf wrote:
> > With this patch the following property assignment:
> > 
> >     property = ['a' 2b '\r'];
> > 
> > is equivalent to:
> > 
> >     property = [61 2b 0d];
> 
> So, I still have some reservations about this syntax.
> 
> It occurred to me: do you actually need to intermix character and
> hexbyte values that much?  Could I suggest an alternate sytax as:
> 
> 	property = 'a', [2b], 'r';
> 
> The new character literals sufficiently distinct not to cause problems
> here, and it maintains the , == bytestring append behaviour we already
> have.
> 
> Thoughts?

Does it matter much?  I'm happy with either.  Is there a downside to
the first syntax?

g.
