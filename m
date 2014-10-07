From: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/4] Correct vendor-prefix and document device isl29028
Date: Tue,  7 Oct 2014 17:15:04 +0530
Message-ID: <1412682308-8784-1-git-send-email-darshanapadmadas@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Patchset documents correct and the deprecated vendor-prefix found by checkpatch 
warning and also documents information of device isl29028 for compatibility. 
Patchset also includes corrected vendor-prefix and device name in compatible 
property for files with checkpatch warning of undocumented string "isil,isl29028". 

Darshana Padmadas (4):
  Documentation: devicetree: bindings: Document correct and deprecated
    vendor-prefix with device isl29028
  Documentation: devicetree: bindings: Document deprecated device vendor
    name to fix related warning
  Staging: iio: light: Added correct vendor-prefix for device isl29028
  arch: arm: boot: dts: Added correct vendor-prefix with device name to
    compatible property  
  
Changes in v3: 
    - In PATCH 1/4 corrected alphabetical order of vendor-prefix and device name. 
    - In PATCH 2/4 inserted deprecated vendor-prefix in list in alphabetical order 
      and edited vendor/chip string. 
    - In PATCH 4/4 dropped deprecated string "isil,isl29028" and included correct 
      vendor-prefix isl with isl29028 to give "isl,isl29028" for device's compatible 
      property.
      
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.txt     | 1 +
 drivers/staging/iio/light/isl29028.c                      | 3 ++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
