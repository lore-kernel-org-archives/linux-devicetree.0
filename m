From: venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org
Subject: [PATCH 0/4] arm: dts: imx28: imx28-evk device tree cleanup
Date: Fri,  1 Dec 2017 12:08:27 +0530
Message-ID: <1512110311-15788-1-git-send-email-venkataravi.e@techveda.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, karthik-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org, shrikant.maurya-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org, Ravi Eluri <venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ravi Eluri <venkataravi.e-fINqtvHxh+hg9hUCZPvPmw@public.gmane.org>

Removed lot of redundant device tree syntax from imx28-evk device tree
to make it more robust and readable.

Total four changesets and are described as follows:

Changeset 1 removes unit addresses for all peripherals of imx28 in
imx28-evk DT as they are already defined in the corresponding dtsi file.
Make use of phandles reference peripheral nodes in dts files.

Changeset 2 removes unit addresses for the system buses of imx28 as they
are already defined in the corresponding dtsi file.

Changeset 3 rearranges nodes for better readability.

Changeset 4 does DT cleanup (whitespaces, tabs ...)

Note:
- Changesets were compile tested and built(ARCH=arm, imx28) on linux-next 
  (latest).
- No build issues reported.
- Please discard this changesets, if this is not making any better."

Ravi Eluri (4):
  arm: dts: imx28: Use phandles instead of unit addresses
  arm: dts: imx28: Remove system bus unit addresses
  arm: dts: imx28: Rearrange nodes for better readability
  arm: dts: imx28: Device tree cleanup

 arch/arm/boot/dts/imx28-evk.dts | 503 ++++++++++++++++++++--------------------
 1 file changed, 247 insertions(+), 256 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
