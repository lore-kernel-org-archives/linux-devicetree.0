From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Notes on consolidating device tree patches
Date: Wed, 17 Feb 2010 12:47:37 -0700
Message-ID: <fa686aa41002171147j67921cfhb6aa9b7bc6d24ee7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=000e0cd598a682b39c047fd120a6
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--000e0cd598a682b39c047fd120a6
Content-Type: text/plain; charset=ISO-8859-1

Hi Jeremy,

I've done some consolidation work between our two trees.  Here's the
show-branch of what I started with:

! [test-devicetree] arm/boot/hack: set uImage load address to 0x81000000
 ! [jk/versatile] arm/versatile: probe devices from device tree
--
 + [jk/versatile] arm/versatile: probe devices from device tree
 + [jk/versatile^] arm/versatile: probe via device tree
 + [jk/versatile~2] drivers/amba: probe via device tree
 + [jk/versatile~3] drivers/amba: separate periphid probe logic from
amba_device_register
 + [jk/versatile~4] arm/clkdev: lookup clocks from OF clock providers
 + [jk/versatile~5] arm/icst307: remove icst307_ps_to_vco
 + [jk/versatile~6] arm/icst307: use common struct clk, unify realview
and versatile clocks
 + [jk/versatile~7] arm/realview: use generic struct clk
 + [jk/versatile~8] arm/versatile: remove oscoff from clk_versatile
 + [jk/versatile~9] arm/versatile: use generic struct clk
 + [jk/versatile~10] of/clk: parse fixed clocks
 + [jk/versatile~11] of: add clock providers
 + [jk/versatile~12] Generic support for fixed-rate clocks
 + [jk/versatile~13] Add a common struct clk
 + [jk/versatile~14] arm-dt: add devictree node reference to dev_archdata
 + [jk/versatile~15] arm-dt: unflatten device tree
 + [jk/versatile~16] arm-dt: parse initrd from device tree
 + [jk/versatile~17] arm-dt: probe for platforms via the device tree
 + [jk/versatile~18] arm-dt: reserve bootmem containing flat device tree blob
 + [jk/versatile~19] arm-dt: parse devtree pointer on boot
 + [jk/versatile~20] of/flattree: include linux/of.h
 + [jk/versatile~21] arm-dt: postpone machine detection until
setup_arch with CONFIG_OF
+  [test-devicetree] arm/boot/hack: set uImage load address to 0x81000000
+  [test-devicetree^] arm/devicetree: Don't allow CONFIG_DEBUG_LL with
device tree
+  [test-devicetree~2] arm-dt: unflatten device tree
+  [test-devicetree~3] arm/devicetree: Reserve memory used by dtb blob
+  [test-devicetree~4] arm/devicetree: Allow .dtb to be carried in the
zImage payload
++ [jk/versatile~22] arm-dt: Allow CONFIG_OF on ARM

To start, I move some things around and split stuff out in my branch
to give you a new base point:
[test-devicetree^] Don't allow CONFIG_DEBUG_LL
  - dropped.
  - you merged this into jk/versatile~21

[test-devicetree~2] arm-dt: unflatten device tree
  - Split into new patches:
    - the of_fdt.h #if defined(CONFIG_OF_FLATTREE)
    - the extra error checking
  - You should be able to drop [jk/versatile~15] arm-dt: unflatten device tree

[test-devicetree~3] arm/devicetree: Reserve memory used by dtb blob
  - Almost identical to [jk/versatile~18] arm-dt: reserve bootmem...
  - Would you consider dropping jk/versatile~18 and replacing it with
the diff from test-devicetree~3..jk/versatile~18?  I'd like to have
the base series of patches that enables fdt support in arm to not
change the boot path.  I've attached the diff that I think you'll
need.

[test-devicetree] arm/boot/hack: set uImage load address to 0x81000000
   and
[test-devicetree~4] arm/devicetree: Allow .dtb to be carried in the
zImage payload
  - moved to the end of my queue because you don't want these in your tree.

Also, in your queue, you should be able to:

[jk/versatile~20] of/flattree: include linux/of.h
  - drop; the problem is fixed in next-devicetree
[jk/versatile~18] arm-dt: reserve bootmem containing flat device tree blob
  - replace; as mentioned above
[jk/versatile~14] arm-dt: add devictree node reference to dev_archdata
  - drop; I've picked it up into my tree
  - Although what I'd really like to do here is move the of_node
pointer into the main struct device and eliminate the archdata
entirely.  I'll see if I get time to work on this.

The showbranch now looks like this for me:

* [secretlab/test-devicetree] arm/boot/hack: set uImage load address
to 0x81000000
 ! [jk/versatile] arm/versatile: probe devices from device tree
--
*  [secretlab/test-devicetree] arm/boot/hack: set uImage load address
to 0x81000000
*  [secretlab/test-devicetree^] arm/devicetree: Allow .dtb to be
carried in the zImage payload
*  [secretlab/test-devicetree~2] arm/devicetree: Reserve memory used by dtb blob
*  [secretlab/test-devicetree~3] arm-dt: add devictree node reference
to dev_archdata
*  [secretlab/test-devicetree~4] arm-dt: unflatten device tree
*  [secretlab/test-devicetree~5] of/flattree: Make
unflatten_device_tree() safe to call from any arch
*  [secretlab/test-devicetree~6] of/flattree: make of_fdt.h safe to
unconditionally include.
 + [jk/versatile] arm/versatile: probe devices from device tree
 + [jk/versatile^] arm/versatile: probe via device tree
 + [jk/versatile~2] drivers/amba: probe via device tree
 + [jk/versatile~3] drivers/amba: separate periphid probe logic from
amba_device_register
 + [jk/versatile~4] arm/clkdev: lookup clocks from OF clock providers
 + [jk/versatile~5] arm/icst307: remove icst307_ps_to_vco
 + [jk/versatile~6] arm/icst307: use common struct clk, unify realview
and versatile clocks
 + [jk/versatile~7] arm/realview: use generic struct clk
 + [jk/versatile~8] arm/versatile: remove oscoff from clk_versatile
 + [jk/versatile~9] arm/versatile: use generic struct clk
 + [jk/versatile~10] of/clk: parse fixed clocks
 + [jk/versatile~11] of: add clock providers
 + [jk/versatile~12] Generic support for fixed-rate clocks
 + [jk/versatile~13] Add a common struct clk
 + [jk/versatile~14] arm-dt: add devictree node reference to dev_archdata
 + [jk/versatile~15] arm-dt: unflatten device tree
 + [jk/versatile~16] arm-dt: parse initrd from device tree
 + [jk/versatile~17] arm-dt: probe for platforms via the device tree
 + [jk/versatile~18] arm-dt: reserve bootmem containing flat device tree blob
 + [jk/versatile~19] arm-dt: parse devtree pointer on boot
 + [jk/versatile~20] of/flattree: include linux/of.h
 + [jk/versatile~21] arm-dt: postpone machine detection until
setup_arch with CONFIG_OF
*+ [secretlab/test-devicetree~7] arm-dt: Allow CONFIG_OF on ARM





-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.

--000e0cd598a682b39c047fd120a6
Content-Type: application/octet-stream; name=arm-reserve-dtb-rework
Content-Disposition: attachment; filename=arm-reserve-dtb-rework
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g5sjatsn0

Y29tbWl0IGU3MWU4ZGNkMGM5ZDkzZTNkOWRiYjlkMWMxNDMxM2Q3YzVlZDlhZWYKQXV0aG9yOiBH
cmFudCBMaWtlbHkgPGdyYW50Lmxpa2VseUBzZWNyZXRsYWIuY2E+CkRhdGU6ICAgV2VkIEZlYiAx
NyAxMjozMDo0MiAyMDEwIC0wNzAwCgogICAgYXJtL2R0OiByZXdvcmsgZGV2aWNlIHRyZWUgbWVt
b3J5IHJlc2VydmF0aW9uIGZvciBlYXJseSBwYXJzaW5nCiAgICAKICAgIEplcmVteSwgSSBiZWxp
ZXZlIHRoaXMgaXMgdGhlIGRpZmYgbmVlZGVkIHRvIGdvIGZyb20gbXkgYXRhZ3MgcGFyc2VkCiAg
ICBkZXZpY2UgdHJlZSBtZW1vcnkgcmVzZXJ2YXRpb24gdG8geW91cnMuICBJIGRyb3BwZWQgdGhl
IHNldHVwLmMgaHVuawogICAgYmVjYXVzZSBvZiBhIGNvbmZsaWN0LCBzbyB5b3UnbGwgbmVlZCB0
byBhZGQgaXQgYmFjay4KICAgIAogICAgZy4KCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9pbml0
LmMgYi9hcmNoL2FybS9tbS9pbml0LmMKaW5kZXggMmNlYjIxYi4uODY2YTAzOCAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vbW0vaW5pdC5jCisrKyBiL2FyY2gvYXJtL21tL2luaXQuYwpAQCAtNzQsMTQg
Kzc0LDExIEBAIF9fdGFndGFibGUoQVRBR19JTklUUkQyLCBwYXJzZV90YWdfaW5pdHJkMik7CiBz
dGF0aWMgdW5zaWduZWQgbG9uZyBwaHlzX2RldnRyZWVfc3RhcnQgX19pbml0ZGF0YSA9IDA7CiBz
dGF0aWMgdW5zaWduZWQgbG9uZyBwaHlzX2RldnRyZWVfc2l6ZSBfX2luaXRkYXRhID0gMDsKIAot
c3RhdGljIGludCBfX2luaXQgcGFyc2VfdGFnX2RldnRyZWUoY29uc3Qgc3RydWN0IHRhZyAqdGFn
KQordm9pZCBfX2luaXQgYm9vdG1lbV9yZWdpc3Rlcl9kZXZ0cmVlKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKIHsKLQlwaHlzX2RldnRyZWVfc3RhcnQgPSB0YWctPnUu
ZGV2dHJlZS5zdGFydDsKLQlwaHlzX2RldnRyZWVfc2l6ZSA9IHRhZy0+dS5kZXZ0cmVlLnNpemU7
Ci0JcmV0dXJuIDA7CisJcGh5c19kZXZ0cmVlX3N0YXJ0ID0gc3RhcnQ7CisJcGh5c19kZXZ0cmVl
X3NpemUgPSBzaXplOwogfQotCi1fX3RhZ3RhYmxlKEFUQUdfREVWVFJFRSwgcGFyc2VfdGFnX2Rl
dnRyZWUpOwogI2VuZGlmCiAKIC8qCkBAIC0yNTMsNiArMjUwLDkgQEAgc3RhdGljIGludCBfX2lu
aXQgY2hlY2tfZGV2dHJlZShzdHJ1Y3QgbWVtaW5mbyAqbWkpCiAJaWYgKChwaHlzX2RldnRyZWVf
c3RhcnQgPT0gMCkgfHwgKHBoeXNfZGV2dHJlZV9zaXplID09IDApKQogCQlnb3RvIG91dDsKIAor
CXByX2luZm8oIkRFVklDRVRSRUU6IDB4JTA4bHgrMHglMDhseCBDaGVja2luZyBtZW1vcnkgcmVn
aW9uXG4iLAorCQkgcGh5c19kZXZ0cmVlX3N0YXJ0LCBwaHlzX2RldnRyZWVfc2l6ZSk7CisKIAlu
b2RlID0gY2hlY2tfcmVnaW9uKG1pLCBwaHlzX2RldnRyZWVfc3RhcnQsIHBoeXNfZGV2dHJlZV9z
aXplKTsKIAlpZiAobm9kZSA9PSAtMSkgewogCQlwaHlzX2RldnRyZWVfc3RhcnQgPSBwaHlzX2Rl
dnRyZWVfc2l6ZSA9IDA7CkBAIC0yNjAsNiArMjYwLDggQEAgc3RhdGljIGludCBfX2luaXQgY2hl
Y2tfZGV2dHJlZShzdHJ1Y3QgbWVtaW5mbyAqbWkpCiAJCSAgICAgICAicGh5c2ljYWwgbWVtb3J5
IC0gZGlzYWJsaW5nIGRldmljZSB0cmVlXG4iLAogCQkgICAgICAgcGh5c19kZXZ0cmVlX3N0YXJ0
LCBwaHlzX2RldnRyZWVfc2l6ZSk7CiAJfQorCisJcHJfaW5mbygiREVWSUNFVFJFRTogbm9kZT0l
aVxuIiwgbm9kZSk7CiAjZW5kaWYKIAogIG91dDoKQEAgLTM1NiwxMiArMzU4LDkgQEAgc3RhdGlj
IHZvaWQgX19pbml0IGJvb3RtZW1fcmVzZXJ2ZV9kZXZ0cmVlKGludCBub2RlKQogCQkJCSAgIHBo
eXNfZGV2dHJlZV9zaXplLCBCT09UTUVNX0VYQ0xVU0lWRSk7CiAJaWYgKHJlcykgewogCQlwcl9l
cnIoIkRFVklDRVRSRUU6IDB4JTA4bHgrMHglMDhseCBvdmVybGFwcyBpbi11c2UgIgotCQkgICAg
ICAgIm1lbW9yeSByZWdpb24gLSBkaXNhYmxpbmcgZGV2aWNlIHRyZWVcbiIsCisJCSAgICAgICAi
bWVtb3J5IHJlZ2lvblxuIiwKIAkJCXBoeXNfZGV2dHJlZV9zdGFydCwgcGh5c19kZXZ0cmVlX3Np
emUpOwotCQlyZXR1cm47CiAJfQotCi0JaW5pdGlhbF9ib290X3BhcmFtcyA9ICh2b2lkICopX19w
aHlzX3RvX3ZpcnQocGh5c19kZXZ0cmVlX3N0YXJ0KTsKICNlbmRpZgogfQogCmRpZmYgLS1naXQg
YS9hcmNoL2FybS9tbS9tbS5oIGIvYXJjaC9hcm0vbW0vbW0uaAppbmRleCBhODg4MzYzLi4wZTU4
YzIwIDEwMDY0NAotLS0gYS9hcmNoL2FybS9tbS9tbS5oCisrKyBiL2FyY2gvYXJtL21tL21tLmgK
QEAgLTM1LDMgKzM1LDQgQEAgc3RydWN0IHBnbGlzdF9kYXRhOwogdm9pZCBfX2luaXQgY3JlYXRl
X21hcHBpbmcoc3RydWN0IG1hcF9kZXNjICptZCk7CiB2b2lkIF9faW5pdCBib290bWVtX2luaXQo
dm9pZCk7CiB2b2lkIHJlc2VydmVfbm9kZV96ZXJvKHN0cnVjdCBwZ2xpc3RfZGF0YSAqcGdkYXQp
Owordm9pZCBfX2luaXQgYm9vdG1lbV9yZWdpc3Rlcl9kZXZ0cmVlKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cg==
--000e0cd598a682b39c047fd120a6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--000e0cd598a682b39c047fd120a6--
