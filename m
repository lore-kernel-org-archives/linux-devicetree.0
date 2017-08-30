From: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: device-tree issue: .probe never called
Date: Wed, 30 Aug 2017 08:32:10 +0200
Message-ID: <CA+7wUsztRN9TWritCLE70qhtpG=WeqkbhJfp2jVNPVq03VKH0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I am trying to test the following patch series (1) & (2). I am
reproducing the context here (fixed the minor typo "ingenic,jz480-rng"
-> "ingenic,jz4780-rng"):

  cgu: jz4780-cgu@10000000 {
- compatible = "ingenic,jz4780-cgu";
+ compatible = "ingenic,jz4780-cgu", "syscon";
  reg = <0x10000000 0x100>;

  clocks = <&ext>, <&rtc>;
  clock-names = "ext", "rtc";

  #clock-cells = <1>;
+
+ rng: rng@d8 {
+ compatible = "ingenic,jz4780-rng";
+ };
  };

and

+static const struct of_device_id jz4780_rng_dt_match[] = {
+ {
+ .compatible = "ingenic,jz4780-rng",
+ },
+ { },
+};
+MODULE_DEVICE_TABLE(of, jz4780_rng_dt_match);
+
+static struct platform_driver jz4780_rng_driver = {
+ .driver = {
+ .name = "jz4780-rng",
+ .of_match_table = jz4780_rng_dt_match,
+ },
+ .probe = jz4780_rng_probe,
+ .remove = jz4780_rng_remove,
+};



However even after fixing the small typo, I cannot get the probe
function to ever be called (I added a dev_err message).

How should I proceed to track this issue of module not being loaded ?

>From my running system, I see:

ci20@ci20:/$ find /sys/bus/*/drivers/  | grep jz4780-rng
/sys/bus/platform/drivers/jz4780-rng
/sys/bus/platform/drivers/jz4780-rng/bind
/sys/bus/platform/drivers/jz4780-rng/unbind
/sys/bus/platform/drivers/jz4780-rng/uevent

and

ci20@ci20:/$ find /sys/firmware/devicetree/base/ | grep jz
/sys/firmware/devicetree/base/jz4780-cgu@10000000
/sys/firmware/devicetree/base/jz4780-cgu@10000000/compatible
/sys/firmware/devicetree/base/jz4780-cgu@10000000/clocks
/sys/firmware/devicetree/base/jz4780-cgu@10000000/rng@d8
/sys/firmware/devicetree/base/jz4780-cgu@10000000/rng@d8/compatible
/sys/firmware/devicetree/base/jz4780-cgu@10000000/rng@d8/name
/sys/firmware/devicetree/base/jz4780-cgu@10000000/clock-names
/sys/firmware/devicetree/base/jz4780-cgu@10000000/#clock-cells
/sys/firmware/devicetree/base/jz4780-cgu@10000000/phandle
/sys/firmware/devicetree/base/jz4780-cgu@10000000/reg
/sys/firmware/devicetree/base/jz4780-cgu@10000000/linux,phandle
/sys/firmware/devicetree/base/jz4780-cgu@10000000/name


Where:

$ cat /sys/firmware/devicetree/base/jz4780-cgu@10000000/rng@d8
ingenic,jz4780-rng
$ cat /sys/firmware/devicetree/base/jz4780-cgu@10000000/rng@d8/name
rng

But crypto framework does not see the new rng:

ci20@ci20:/$ cat /proc/crypto | grep driver
driver       : jitterentropy_rng
driver       : drbg_nopr_hmac_sha256
driver       : drbg_nopr_hmac_sha512
driver       : drbg_nopr_hmac_sha384
driver       : drbg_nopr_hmac_sha1
driver       : drbg_pr_hmac_sha256
driver       : drbg_pr_hmac_sha512
driver       : drbg_pr_hmac_sha384
driver       : drbg_pr_hmac_sha1
driver       : lzo-generic
driver       : crc32c-generic
driver       : deflate-generic
driver       : aes-generic
driver       : sha224-generic
driver       : sha256-generic
driver       : sha1-generic
driver       : md5-generic
driver       : digest_null-generic
driver       : compress_null-generic
driver       : ecb-cipher_null
driver       : cipher_null-generic


What should I try next ?

Thanks,


(1) https://patchwork.kernel.org/patch/9916499/
(2) https://patchwork.kernel.org/patch/9916501/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
