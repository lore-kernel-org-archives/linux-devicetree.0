From: Jeremy Kerr <jeremy.kerr@canonical.com>
Subject: [PATCH 0/3] Build fixes for test-devicetree
Date: Wed, 23 Dec 2009 09:45:18 +0800
Message-ID: <1261532718.575048.365032094903.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

A small series of patches to fix minor build breakages when compiling
gcl's test-devicetree tree on ARM.

I've CC-ed lkml & linuxppc-dev for the fs/proc/ changes, but these
patches are only applicable to gcl's tree at present.

Cheers,


Jeremy

---
Jeremy Kerr (3):
      of: include linux/proc_fs.h
      of: make set_node_proc_entry private to proc_devtree.c
      proc_devtree: include linux/of.h
