From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH nand-next 0/2] meson-nand: support for older SoCs
Date: Tue, 19 Mar 2019 21:27:54 +0100
Message-ID: <CAFBinCA7LLK6K3ZqauJy2N-z5-kTfuTztmoSQ=Bk4A5Xagxddw@mail.gmail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
 <98776767-c4d7-1207-6d42-97105f289bec@amlogic.com> <CAFBinCC7P40sqrDGTuM8M=jVOFTgZLDUK6rGdNpigFoepyCASw@mail.gmail.com>
 <20190307140959.10092d45@xps13> <ccb95e75-e62f-c510-cabd-853481f77fc8@amlogic.com>
 <CAFBinCBd=dOZjv4KEDY9ODOONDO=WtaBqAMRi_a+gH3_iZEAHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="000000000000b308a20584785793"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCBd=dOZjv4KEDY9ODOONDO=WtaBqAMRi_a+gH3_iZEAHQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liang Yang <liang.yang@amlogic.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--000000000000b308a20584785793
Content-Type: text/plain; charset="UTF-8"

Hello Liang,

On Sat, Mar 16, 2019 at 11:55 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > Martin, Now i am not sure whether NFC driver leads to kernel panic when
> > calling kmem_cache_alloc_trace.
> thank you for confirming that it works for you on GXL
>
> I'm not sure that this is a NFC driver problem.
> after enabling CONFIG_SLAB_FREELIST_HARDENED in my kernel config the
> crash moves. it's now crashing in slub.c's kfree() at
> BUG_ON(!PageCompound(page));
I added some debug prints in meson_nfc_read_buf() to get some details
about the info buffer before the crash,
format is: meson_nfc_read_buf <virtual address> <physical address>

during my first test three different addresses are used:
- meson_nfc_read_buf e9e6c640 0x29e6c640 (works fine)
- meson_nfc_read_buf e9e6c680 0x29e6c680 (works fine)
- meson_nfc_read_buf ee39a34b 0x2e39a34b (crashes during kfree)

so I tried playing around with the allocation size (see the attached
patch) and changed it to:
  kzalloc(PER_INFO_BYTE + 64, GFP_KERNEL)
this results in the following addresses being used:
- meson_nfc_read_buf e9ea4280 0x29ea4280 (works fine)
- meson_nfc_read_buf e9ea4300 0x29ea4300 (works fine)
(there is no crash anymore)

Liang, are there any special requirements on the "info address" like
the alignment?
also do you know why the PER_INFO_BYTE buffer is allocated dynamically
in meson_nfc_read_buf() instead of allocating it at initialization?
I'm not saying that it should be changed! I'm curious because there's
per-meson_nfc_nand_chip info and data buffers which are allocated at
initialization time.


meson_nfc_read_buf debug log with PER_INFO_BYTE allocation:
[    2.032914] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.033005] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.037717] meson_nfc_read_buf: about to kfree info
[    2.042535] meson_nfc_read_buf: kfree'd info
[    2.046794] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.051552] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.056261] meson_nfc_read_buf: about to kfree info
[    2.061086] meson_nfc_read_buf: kfree'd info
[    2.065356] meson_nfc_read_buf e9e6c680 0x29e6c680
[    2.070102] meson_nfc_dma_buffer_setup 0x29e6c680
[    2.074810] meson_nfc_read_buf: about to kfree info
[    2.079635] meson_nfc_read_buf: kfree'd info
[    2.083978] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.088684] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.093334] meson_nfc_read_buf: about to kfree info
[    2.098199] meson_nfc_read_buf: kfree'd info
[    2.102446] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.107208] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.111883] meson_nfc_read_buf: about to kfree info
[    2.116765] meson_nfc_read_buf: kfree'd info
[    2.120996] meson_nfc_read_buf e9e6c640 0x29e6c640
[    2.125762] meson_nfc_dma_buffer_setup 0x29e6c640
[    2.130433] meson_nfc_read_buf: about to kfree info
[    2.135294] meson_nfc_read_buf: kfree'd info
[    2.139545] Could not find a valid ONFI parameter page, trying
bit-wise majority to recover it
[    2.148173] ONFI parameter recovery failed, aborting
[    2.153058] meson_nfc_read_buf e9e6c680 0x29e6c680
[    2.157831] meson_nfc_dma_buffer_setup 0x29e6c680
[    2.162527] meson_nfc_read_buf: about to kfree info
[    2.167369] meson_nfc_read_buf: kfree'd info
[    2.171611] meson_nfc_read_buf ee39a34b 0x2e39a34b
[    2.176383] meson_nfc_dma_buffer_setup 0x2e39a34b
[    2.181076] meson_nfc_read_buf: about to kfree info
[    2.185932] ------------[ cut here ]------------
[    2.190503] kernel BUG at mm/slub.c:3950!
[    2.194491] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
...

meson_nfc_read_buf debug log with PER_INFO_BYTE+64 allocation:
[    2.033019] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.033112] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.037847] meson_nfc_read_buf: about to kfree info
[    2.042642] meson_nfc_read_buf: kfree'd info
[    2.046909] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.051659] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.056374] meson_nfc_read_buf: about to kfree info
[    2.061192] meson_nfc_read_buf: kfree'd info
[    2.065461] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.070208] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.074922] meson_nfc_read_buf: about to kfree info
[    2.079742] meson_nfc_read_buf: kfree'd info
[    2.084087] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.088789] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.093440] meson_nfc_read_buf: about to kfree info
[    2.098303] meson_nfc_read_buf: kfree'd info
[    2.102553] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.107316] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.111990] meson_nfc_read_buf: about to kfree info
[    2.116870] meson_nfc_read_buf: kfree'd info
[    2.121103] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.125868] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.130540] meson_nfc_read_buf: about to kfree info
[    2.135400] meson_nfc_read_buf: kfree'd info
[    2.139652] Could not find a valid ONFI parameter page, trying
bit-wise majority to recover it
[    2.148276] ONFI parameter recovery failed, aborting
[    2.153165] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.157938] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.162634] meson_nfc_read_buf: about to kfree info
[    2.167475] meson_nfc_read_buf: kfree'd info
[    2.171717] meson_nfc_read_buf e9ea4280 0x29ea4280
[    2.176489] meson_nfc_dma_buffer_setup 0x29ea4280
[    2.181183] meson_nfc_read_buf: about to kfree info
[    2.186025] meson_nfc_read_buf: kfree'd info
[    2.190265] nand: device found, Manufacturer ID: 0xad, Chip ID: 0xde
[    2.196598] nand: Hynix NAND 8GiB 3,3V 8-bit
[    2.200840] nand: 8192 MiB, MLC, erase size: 4096 KiB, page size:
16384, OOB size: 1280
[    2.208829] meson_nfc_read_buf e9ea4300 0x29ea4300
[    2.213581] meson_nfc_dma_buffer_setup 0x29ea4300
[    2.218291] meson_nfc_read_buf: about to kfree info
[    2.223115] meson_nfc_read_buf: kfree'd info
[    2.227374] ------------[ cut here ]------------
[    2.231968] WARNING: CPU: 1 PID: 1 at
drivers/mtd/nand/raw/nand_base.c:5503 nand_scan_with_ids+0x1718/0x171c
[    2.241760] No oob scheme defined for oobsize 1280
...
(the "No oob scheme defined for oobsize 1280" message is expected)


Regards
Martin

--000000000000b308a20584785793
Content-Type: text/x-patch; charset="US-ASCII"; name="meson-nfc-debug-prints.patch"
Content-Disposition: attachment; filename="meson-nfc-debug-prints.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jtg81v7a0>
X-Attachment-Id: f_jtg81v7a0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L21lc29uX25hbmQuYwppbmRleCBiNDlhNDVmMjU1ZjguLmNkYzQyNmNkMGE0
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCisrKyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwpAQCAtNDkzLDYgKzQ5Myw3IEBAIHN0YXRp
YyBpbnQgbWVzb25fbmZjX2RtYV9idWZmZXJfc2V0dXAoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwg
dTggKmRhdGFidWYsCiAKIAlpZiAoaW5mb2J1ZikgewogCQluZmMtPmlhZGRyID0gZG1hX21hcF9z
aW5nbGUobmZjLT5kZXYsIGluZm9idWYsIGluZm9sZW4sIGRpcik7CisJCXByaW50aygiJXMgMHgl
MDh4XG4iLCBfX2Z1bmNfXywgbmZjLT5pYWRkcik7CiAJCXJldCA9IGRtYV9tYXBwaW5nX2Vycm9y
KG5mYy0+ZGV2LCBuZmMtPmlhZGRyKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2VycihuZmMtPmRl
diwgIkRNQSBtYXBwaW5nIGVycm9yXG4iKTsKQEAgLTUyOCwxMCArNTI5LDEwIEBAIHN0YXRpYyBp
bnQgbWVzb25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGlu
dCBsZW4pCiAJdTMyIGNtZDsKIAl1OCAqaW5mbzsKIAotCWluZm8gPSBremFsbG9jKFBFUl9JTkZP
X0JZVEUsIEdGUF9LRVJORUwpOworCWluZm8gPSBremFsbG9jKFBFUl9JTkZPX0JZVEUgKyA2NCwg
R0ZQX0tFUk5FTCk7CiAJaWYgKCFpbmZvKQogCQlyZXR1cm4gLUVOT01FTTsKLQorcHJpbnRrKCIl
cyAlcHggMHglMDh4XG4iLCBfX2Z1bmNfXywgaW5mbywgdmlydF90b19waHlzKGluZm8pKTsKIAly
ZXQgPSBtZXNvbl9uZmNfZG1hX2J1ZmZlcl9zZXR1cChuYW5kLCBidWYsIGxlbiwgaW5mbywKIAkJ
CQkJIFBFUl9JTkZPX0JZVEUsIERNQV9GUk9NX0RFVklDRSk7CiAJaWYgKHJldCkKQEAgLTU0NSw3
ICs1NDYsOSBAQCBzdGF0aWMgaW50IG1lc29uX25mY19yZWFkX2J1ZihzdHJ1Y3QgbmFuZF9jaGlw
ICpuYW5kLCB1OCAqYnVmLCBpbnQgbGVuKQogCW1lc29uX25mY19kbWFfYnVmZmVyX3JlbGVhc2Uo
bmFuZCwgbGVuLCBQRVJfSU5GT19CWVRFLCBETUFfRlJPTV9ERVZJQ0UpOwogCiBvdXQ6Citwcmlu
dGsoIiVzOiBhYm91dCB0byBrZnJlZSBpbmZvXG4iLCBfX2Z1bmNfXyk7CiAJa2ZyZWUoaW5mbyk7
CitwcmludGsoIiVzOiBrZnJlZSdkIGluZm9cbiIsIF9fZnVuY19fKTsKIAogCXJldHVybiByZXQ7
CiB9Cg==
--000000000000b308a20584785793--
