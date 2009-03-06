From: Laurent Gregoire <laurent.gregoire-Jdzig1fPfSTQT0dZR+AlfA@public.gmane.org>
Subject: cross-compiled dtc on arm-gnueabi with gcc 4.2.1 issue
Date: Fri, 06 Mar 2009 14:54:31 +0100
Message-ID: <1236347671.17001.524.camel@pc-laurentg.intra.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


FYI, we recently cross-compiled the dtc binary for ARM, using gcc 4.2.1
(target arm-gnu-eabi). A bug appears in calling function
write_tree_source_node(), the two last parameters are mangled. Latest
gcc 4.3.3 does not exhibit the issue.

The problem is due to gcc (a very small fragment of code exhibit the
same problem), and is probably related to the bug described below:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=36527
(Fixed in gcc 4.3.1)

As a workaround, using -O2 instead of -Os solves the issue on the
specific dtc case.

HTH,

Laurent GREGOIRE
Embedded Software Engineering | TomTom | www.tomtom.com
