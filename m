From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [git pull] Device tree fixes for v3.3
Date: Thu, 8 Mar 2012 11:38:45 -0700
Message-ID: <CACxGe6tGDn6JY=aqo24MkFGPTKYmq=D+OvSV2tLPHfNTRNmF5A@mail.gmail.com>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Some last bug fixes that should go in for v3.3.  Nothing terribly
exciting here.  Please pull.

The following changes since commit 6b21d18ed50c7d145220b0724ea7f2613abf0f95:

  Linux 3.3-rc5 (2012-02-25 12:18:16 -0800)

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 devicetree-for-linus

for you to fetch changes up to 29f141fed01a09050207c4d41fc5811520d81146:

  Merge branch 'fixes-for-grant' of
git://sources.calxeda.com/kernel/linux into devicetree/merge
(2012-02-27 14:04:40 -0700)

----------------------------------------------------------------

Minor bug fixes and documentation updates for v3.3-rc5

Fixes up a duplicate #include, adds an empty implementation of
of_find_compatible_node() and make git ignore .dtb files.  And fix
up bus name on OF described PHYs.  Nothing exciting here.

----------------------------------------------------------------
Baruch Siach (1):
      of/mdio: fix fixed link bus name

Danny Kukawka (1):
      of/fdt.c: asm/setup.h included twice

Dave Martin (1):
      ARM: devicetree: Add .dtb files to arch/arm/boot/.gitignore

Grant Likely (1):
      Merge branch 'fixes-for-grant' of
git://sources.calxeda.com/kernel/linux into devicetree/merge

Jamie Iles (1):
      of: add picochip vendor prefix

Shawn Guo (1):
      dt: add empty of_find_compatible_node function

Tobias Klauser (1):
      doc: dt: Fix broken reference in gpio-leds documentation

 Documentation/devicetree/bindings/gpio/led.txt     |    6 +++---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/.gitignore                           |    1 +
 drivers/of/fdt.c                                   |    1 -
 drivers/of/of_mdio.c                               |    2 +-
 include/linux/of.h                                 |    8 ++++++++
 6 files changed, 14 insertions(+), 5 deletions(-)

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
