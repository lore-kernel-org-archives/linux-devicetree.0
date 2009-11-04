From: Nathan Fontenot <nfont@austin.ibm.com>
Subject: [RFC PATCH 0/5] Merge common dynamic OF device tree code
Date: Wed, 04 Nov 2009 16:07:37 -0600
Message-ID: <4AF1FB29.50905@austin.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: devicetree-discuss@lists.ozlabs.org, linuxppc-dev@ozlabs.org, microblaze-uclinux@itee.uq.edu.au
List-Id: devicetree@vger.kernel.org

This is a follow on to Grant Likely's patches, attempting to merge the common
pieces of dynamic OF device tree updating.  These patches move the common
code for adding and removing nodes and properties from the device tree to
drivers/of/of_dynamic.c and wraps them under the new OF_DYNAMIC config
option.  Additionally this makes the necessary updates to powerpc and
microblaze arch's for this move.

Nathan Fontenot (5)
	- Move the declaration of devtree_lock and allnodes to linux/of.h
	- Create drivers/of/of_dynamic.c from common code.
	- powerpc and pseries updates
	- microblaze updates
	- powerpc/iseries updates
