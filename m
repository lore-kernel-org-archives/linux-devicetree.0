From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [GIT PULL] devicetree for v3.8 part 2
Date: Fri, 14 Dec 2012 22:43:00 +0000
Message-ID: <CACxGe6u56QU8RdJNvq=1qSESj9g=Hh_12zP_Astr1pcP1gs=LA@mail.gmail.com>
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

Here's a couple more devicetree changes that I missed in the first
pull by putting the tag in the wrong place. Please pull.

g.

The following changes since commit 58fea354d887fddddd342a8d14b02069161ca904:

  arm64: Fix the dtbs target building (2012-12-10 20:24:57 -0600)

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 tags/devicetree-for-linus

for you to fetch changes up to 93c667ca2598bd84f1bd3f2fa176af69707699fe:

  of: *node argument to of_parse_phandle_with_args should be const
(2012-12-11 17:30:16 +0000)

----------------------------------------------------------------
Two minor devicetree fixups for v3.8. Addition of dummy inlines and
constification of node argument to of_parse_phandle_with_args().

----------------------------------------------------------------
Guennadi Liakhovetski (2):
      of/i2c: add dummy inline functions for when
CONFIG_OF_I2C(_MODULE) isn't defined
      of: *node argument to of_parse_phandle_with_args should be const

 drivers/of/base.c      |    2 +-
 include/linux/of.h     |    2 +-
 include/linux/of_i2c.h |   12 ++++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)


--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
