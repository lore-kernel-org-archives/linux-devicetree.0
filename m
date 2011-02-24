From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 02/10] MIPS: Octeon: Add device tree source files.
Date: Fri, 25 Feb 2011 10:19:23 +1100
Message-ID: <20110224231923.GB18233@yookeroo>
References: <1298408274-20856-1-git-send-email-ddaney@caviumnetworks.com>
	<1298408274-20856-3-git-send-email-ddaney@caviumnetworks.com>
	<20110223000759.GA26300@yookeroo>
	<4D653CF1.30009@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D653CF1.30009-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 23, 2011 at 08:59:29AM -0800, David Daney wrote:
> On 02/22/2011 04:07 PM, David Gibson wrote:
> >On Tue, Feb 22, 2011 at 12:57:46PM -0800, David Daney wrote:
> >>Signed-off-by: David Daney<ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> >>---
> >>  arch/mips/cavium-octeon/.gitignore      |    2 +
> >>  arch/mips/cavium-octeon/Makefile        |   13 ++
> >>  arch/mips/cavium-octeon/octeon_3xxx.dts |  314 +++++++++++++++++++++++++++++++
> >>  arch/mips/cavium-octeon/octeon_68xx.dts |   99 ++++++++++
> >>  4 files changed, 428 insertions(+), 0 deletions(-)
> >>  create mode 100644 arch/mips/cavium-octeon/.gitignore
> >>  create mode 100644 arch/mips/cavium-octeon/octeon_3xxx.dts
> >>  create mode 100644 arch/mips/cavium-octeon/octeon_68xx.dts
> >>
> [...]
> 
> >>+    };
> >>+  };
> >
> >Uh.. where are the CPUs?
> >
> 
> The number and type of CPUs can be (and is) probed.  There is an
> existing mechanism for the bootloader to communicate which CPUs
> should be used.

Hrm, ok.

Grant,

We've seen this now on both MIPS and ARM - dts files with no cpus, on
the grounds that those can be runtime probed.  I guess it makes sense,
although a dts without cpus looks very, very odd to me.  What are your
thoughts on this?

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
