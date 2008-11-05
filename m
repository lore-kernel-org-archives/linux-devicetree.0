From: Jon Loeliger <jdl@jdl.com>
Subject: Re: libfdt: Fix bug in fdt_subnode_offset_namelen()
Date: Wed, 05 Nov 2008 08:15:38 -0600
Message-ID: <E1KxjAZ-0006VP-0K@jdl.com>
References: <20081030024108.GC17505@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-reply-to: <20081030024108.GC17505@yookeroo.seuss> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org
List-Id: devicetree@vger.kernel.org

> There's currently an off-by-one bug in fdt_subnode_offset_namelen()
> which causes it to keep searching after it's finished the subnodes of
> the given parent, and into the subnodes of siblings of the original
> node which come after it in the tree.
> 
> This patch fixes the bug.  It also extends the subnode_offset testcase
> (updating all of the 'test_tree1' example trees in the process) to
> catch it.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Applied.

Thanks,
jdl
