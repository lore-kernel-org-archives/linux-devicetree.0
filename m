From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: libfdt shared library
Date: Tue, 18 Nov 2008 12:47:52 -0500
Message-ID: <20081118174752.GA2332@yoda.jdub.homelinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Cc: hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

There's been a bug open for a while to get a libfdt shared
library built in Fedora:

http://bugzilla.redhat.com/show_bug.cgi?id=443882

This would have benefits for things like qemu and other
applications that don't really need to statically link the
libfdt.a into the binary itself.

The reason we're waiting is because it would be best to
have the upstream project define the soname and versioning
that would be used.  As mentioned in the bug, it could be
as simple as using the base dtc version that it is split
from, but for commonality reasons we'd want to settle on
a single way to do it.  That belongs upstream.

So this is my plea for coming up with a solution.  I can
code up patches, but I thought some discussion would be
proper first.

josh
