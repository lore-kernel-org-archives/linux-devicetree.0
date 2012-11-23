From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [GIT PULL] devicetree fix for v3.7
Date: Fri, 23 Nov 2012 22:33:57 +0000
Message-ID: <CACxGe6v-VAEDnOYtnRaYtNf_3njjbN4ZG42h6uPXO=VUJsn7-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Here's is a device tree build regression fix that I've just received.
Please pull.

Thanks,
g.

The following changes since commit 26d29d06ea020411559f75ec908db235ca1838d9:

  Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input (2012-11-22
21:45:34 -1000)

are available in the git repository at:


  git://git.secretlab.ca/git/linux-2.6 tags/devicetree-for-linus

for you to fetch changes up to 0e622d39197f0b64b9e043fe75ac3634bf9f3a05:

  of/address: sparc: Declare of_iomap as an extern function for sparc
again (2012-11-23 22:01:15 +0000)

----------------------------------------------------------------
Device tree regression fix for v3.7

Simple build regression fix for DT device drivers on Sparc. An earlier
change had masked out the of_iomap() helper on SPARC.

----------------------------------------------------------------
Andreas Larsson (1):
      of/address: sparc: Declare of_iomap as an extern function for sparc again

 arch/sparc/include/asm/prom.h |    5 ++++-
 include/linux/of_address.h    |    2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
