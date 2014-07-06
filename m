From: Grant Likely <grant.likely@linaro.org>
Subject: [GIT PULL] bug fix for devicetree memory parsing
Date: Sun, 6 Jul 2014 10:37:58 +0100
Message-ID: <CACxGe6vFHADzsE7_69B+jjT3kwX_3kOdUBzjtSVEYETwR7HY3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Rob Herring <rob.herring@linaro.org>, Laura Abbott <lauraa@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Can you pull this bug fix into your tree please?

Thanks,
g.

The following changes since commit a497c3ba1d97fc69c1e78e7b96435ba8c2cb42ee:

  Linux 3.16-rc2 (2014-06-21 19:02:54 -1000)

are available in the git repository at:

  git://git.secretlab.ca/git/linux tags/dt-for-linus

for you to fetch changes up to a67a6ed15513541579d38bcbd127e7be170710e5:

  of: Check for phys_addr_t overflows in early_init_dt_add_memory_arch
(2014-06-26 17:28:28 +0100)

----------------------------------------------------------------
Devicetree bugfixe for v3.16

Important bug fix for parsing 64-bit addresses on 32-bit platforms.
Without this patch the kernel will try to use memory ranges that cannot
be reached.

----------------------------------------------------------------
Laura Abbott (1):
      of: Check for phys_addr_t overflows in early_init_dt_add_memory_arch

 drivers/of/fdt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
