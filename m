From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/flattree: Early "find node by alias" function
Date: Fri, 21 Oct 2011 14:04:51 -0600
Message-ID: <20111021200451.GB3722@ponder.secretlab.ca>
References: <1319210219-10707-1-git-send-email-pawel.moll@arm.com>
 <4EA1A1A9.2090403@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EA1A1A9.2090403-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2011 at 09:45:29AM -0700, David Daney wrote:
> On 10/21/2011 08:16 AM, Pawel Moll wrote:
> >This patch adds a function for finding a node in flat tree
> >based on an alias name. It can be used in early boot code.
> >
> >Typical use case is a situation when early code needs data
> >from a arbitrary tree node, eg. base address of "serial0" to
> >initialise debug output or some sort of ID register to
> >probe hardware.
> >
> >The tree source could look like that:
> >
> >/ {
> >	aliases {
> >		serial0 =&uart0;
> >	};
> >
> >	uart0: uart@f0001000 {
> >		reg =<0xf0001000 0x1000>;
> >	};
> >}
> >
> >Signed-off-by: Pawel Moll<pawel.moll-5wv7dgnIgG8@public.gmane.org>
> 
> How is this patch different/better than:
> 
> 
> http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-June/005819.html

This patch operates on the flat tree; your patch operates on the
unflattened tree.

g.
