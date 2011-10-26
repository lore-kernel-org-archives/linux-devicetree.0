From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/flattree: Early "find node by alias" function
Date: Wed, 26 Oct 2011 10:29:37 +0100
Message-ID: <20111026092937.GA2042@localhost.localdomain>
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

Note that unless we have reasonably standard alias names, finding nodes
by alias may recreate the same problem that it attempts to solve.

For example, how do I know which alias among serial0, serial1 etc.
should be used as the debug UART?

It feels like we either need well-defined conventions, or proper
symbolic names for aliases.  Or alternatively, the meanings of aliases
need to be documented somewhere just like the real bindings.

Of course, some alises can have board-specific meanings, but if all
alises are board-specific they become less useful.  If some alises are
board-specific and some are not, then we really need some namespacing
convention, just as for the real bindings.

Of course, this may all have been discussed before and dismissed as
overkill...

Cheers
---Dave
