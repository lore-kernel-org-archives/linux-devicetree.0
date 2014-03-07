From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: [PATCH v3 0/4] checkpatch: enhance compatible string checking
Date: Fri,  7 Mar 2014 14:26:07 +0100
Message-ID: <1394198771-25913-1-git-send-email-florian.vaussard@epfl.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

This series proposes a number of fixes and enhancements to the checks
performed on compatible strings:

1) Fix vendor check for strings with dashes
2) Fix spurious vendor warning, when there is no vendor
3) Check for compatible strings in .c and .h files too
4) Match only at the begining of each line in vendor-prefixes.txt

Joe: I have split your patch to perform atomic changes. I also
merged one part into one of my patch. I added your S-o-B on the
corresponding patches, I let you check if you are OK with the changes.

Regards,
Florian


Since v2 [2]:
- Merged changes proposed by Joe Perches
1) check compatible also in .[ch] files
2) match strings at the begining of vendor-prefixes.txt
3) minor cleanups

Since v1 [1]:
- Add check for vendors with '-', as suggested by Joe Perches

[1] http://thread.gmane.org/gmane.linux.drivers.devicetree/63770
[2] http://thread.gmane.org/gmane.linux.kernel/1657871

Florian Vaussard (2):
  checkpatch: check vendor compatible with dashes
  checkpatch: fix spurious vendor compatible warnings

Joe Perches (2):
  checkpatch: check compatible strings in .c and .h too
  checkpatch: improve the compatible vendor match

 scripts/checkpatch.pl | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

-- 
1.8.5.3
