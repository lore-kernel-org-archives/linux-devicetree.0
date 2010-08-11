From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: olpc ofw question
Date: Tue, 10 Aug 2010 20:40:10 -0400
Message-ID: <20100810204010.134618fb@dev.queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I've run a comparison between OLPC's old OFW code (which mounts the
device-tree at /ofw, and makes use of the sparc code) versus the code
which I'm planning to send upstream (which mounts the device-tree
at /proc/device-tree, and makes use of PROC_DEVTREE).  The results are
here:

http://dev.queued.net/~dilinger/dt.diff

That's from running:

find /proc/device-tree -type f | sort | while read f; do echo $f | sed 's#/proc/device-tree##'; sudo od -c $f; done > ~/dt-proc
find /ofw -type f | sort | while read f; do echo $f | sed 's#/ofw##'; sudo od -c $f; done > ~/dt-ofw
diff -u dt-ofw dt-proc > dt.diff

Note that this was run on two different OLPC XO-1 machines, hence the
difference in serial numbers, mfg-data, and other such things.

There are two things I'm concerned about; the first is that device names
are mangled.  For some things (ie, "/battery@0/name" => "/battery/name"),
I don't particularly care; for others ("/pci/audio@f,3/device-id"
=> "/pci/audio/device-id"), it's kind of annoying to lose that extra
bit of information.  What's the purpose being the mangling that
happens w/ /proc/device-tree?  I the following comment in proc_devtree.c:

 * For a node with a name like "gc@10", we make symlinks called "gc"
 * and "@10" to it.

However, I'm not seeing *any* symlinks at all in /proc/device-tree.

My second concern is the renaming of /pci/usb@f,4 (the ohci device)
to /pci/usb.  I'm not sure if that's due to a bug in the devtree code,
OFW, or my patch.  Note that the kernel spits out the following messages
while populating /proc/device-tree:


[    0.130869] device-tree: Duplicate name in /pci, renamed to "usb#1"
[    0.131589] device-tree: Duplicate name in /, renamed to "dropin-fs#1"

I'm assuming that the code first renamed the ohci device from
/pci/usb@f,4 to /pci/usb, attempted to then rename the
wireless chip from /pci/usb@f,5 to /pci/usb, and spit out
that error.  That seems.. odd.

Any insight into the reasoning for this mangling?
