From: Rob Herring <robh@kernel.org>
Subject: [GIT PULL] Devicetree vendor prefix schema for 5.2
Date: Thu, 16 May 2019 15:43:27 -0500
Message-ID: <CAL_JsqLtkGfSX5bdRWy7MXM+opAd-gWzhTorUoVXOpKktN8YKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Linus,

Please pull this 1 additional commit for rc1. This had to wait for all
the merge window changes to vendor-prefixes.txt to go in to regenerate
it.

Rob


The following changes since commit 01be377c62210a8d8fef35be906f9349591bb7cd:

  Merge tag 'media/v5.2-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
(2019-05-16 11:57:16 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
tags/devicetree-for-5.2-part2

for you to fetch changes up to 8122de54602e30f0a73228ab6459a3654e652b92:

  dt-bindings: Convert vendor prefixes to json-schema (2019-05-16
15:27:21 -0500)

----------------------------------------------------------------
Conversion of vendor-prefixes.txt to json-schema

----------------------------------------------------------------
Rob Herring (1):
      dt-bindings: Convert vendor prefixes to json-schema

 .../devicetree/bindings/vendor-prefixes.txt        | 476 ----------
 .../devicetree/bindings/vendor-prefixes.yaml       | 977 +++++++++++++++++++++
 2 files changed, 977 insertions(+), 476 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/vendor-prefixes.txt
 create mode 100644 Documentation/devicetree/bindings/vendor-prefixes.yaml
