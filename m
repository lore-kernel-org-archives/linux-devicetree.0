From: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] Correct vendor-prefix and document device isl29028
Date: Fri, 26 Sep 2014 17:54:48 +0530
Message-ID: <1411734292-10910-1-git-send-email-darshanapadmadas@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Patchset documents correct and the deprecated vendor-prefix found by checkpatch 
warning and also documents information of device isl29028 for compatibility. 
Patchset also includes corrected vendor-prefix and device name in compatible 
property for files with checkpatch warning of undocumented string "isil,isl29028".

Darshana Padmadas (4):
  Documentation: devicetree: bindings: Document correct and deprecated
    vendor-prefix of device
  Documentation: devicetree: bindings: Document deprecated vendor-prefix
    found by checkpatch.pl
  Staging: iio: light: Added correct vendor-prefix with device name in
    compatible property
  arch: arm: boot: dts: Added correct vendor-prefix with device name to
    compatible property

Changes in v2:
    - Made the commit message more clear.
    - Made cover letter more clear.

 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.txt     | 1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
 drivers/staging/iio/light/isl29028.c                      | 3 ++-
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
