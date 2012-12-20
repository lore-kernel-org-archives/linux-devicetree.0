From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [GIT PULL] Device tree bug fixes for v3.8 merge window
Date: Thu, 20 Dec 2012 00:41:11 +0000
Message-ID: <CACxGe6s=bSa6ymfad10uP4OkgO+N7ZV0x6LrCtWXc=ww=kJi2w@mail.gmail.com>
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
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Some straight forward bug fixes. Please pull

g.

The following changes since commit 752451f01c4567b506bf4343082682dbb8fb30dd:

  Merge branch 'i2c-embedded/for-next' of
git://git.pengutronix.de/git/wsa/linux (2012-12-18 16:51:10 -0800)

are available in the git repository at:


  git://git.secretlab.ca/git/linux-2.6 tags/dt-for-linus

for you to fetch changes up to ab28698d33af05abab0bcf8021eafe38f7434f24:

  of: define struct device in of_platform.h if !OF_DEVICE and
!OF_ADDRESS (2012-12-19 16:15:17 +0000)

----------------------------------------------------------------
Device tree v3.8 bug fix branch. Fixes an undefined struct device build
error and a missing symbol export.

----------------------------------------------------------------
Grant Likely (1):
      of: Fix export of of_find_matching_node_and_match()

Jonas Gorski (1):
      of: define struct device in of_platform.h if !OF_DEVICE and !OF_ADDRESS

 drivers/of/base.c           |    2 +-
 include/linux/of_platform.h |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)


--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
