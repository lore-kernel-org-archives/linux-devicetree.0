From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 2/2] powerpc: add support for MPIC message register API
Date: Sat, 18 Jun 2011 08:58:53 +1000
Message-ID: <1308351533.32158.61.camel@pasglop>
References: <1306869543-18812-1-git-send-email-meador_inge@mentor.com>
	<1306869543-18812-3-git-send-email-meador_inge@mentor.com>
	<1308288784.32158.30.camel@pasglop>
	<20110617115828.3cebd5c9@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20110617115828.3cebd5c9@schlenkerla.am.freescale.net>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Scott Wood <scottwood@freescale.com>
Cc: Meador Inge <meador_inge@mentor.com>, openmcapi-dev@googlegroups.com, devicetree-discuss@lists.ozlabs.org, Hollis Blanchard <hollis_blanchard@mentor.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, 2011-06-17 at 11:58 -0500, Scott Wood wrote:
> When did this change from "considered an internal implementation
> issue, and not really an interface" to "all new interfaces"?

Interesting blurb... that's not everybody's opinion and I would argue
that supporting AMP kernels isn't something we want to do with closed
source crap.

Ben.
