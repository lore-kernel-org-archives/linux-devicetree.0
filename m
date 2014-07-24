From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Subject: [PATCH] ARM: at91: at91sam9x5: sets NPCS0 (PA14) back to GPIO
Date: Thu, 24 Jul 2014 15:38:24 +0200
Message-ID: <53D10C50.50305@aksignal.cz>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com>
Reply-To: jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050705080605090202000108"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405074175-22444-1-git-send-email-voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------050705080605090202000108
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

After ROMBOOT tries boot from flash on SPI0 NPCS0, this NPCS0 (PA14) remains set to PERIPH_A.
Because of that, this pin is unusable to something else.
This patch sets it back to GPIO.

Signed-off-by: Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>


--------------050705080605090202000108
Content-Type: text/plain; charset=UTF-8;
 name="patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="patch"

LS0tIGEvbGludXgtMy4xNi1yYzYvYXJjaC9hcm0vYm9vdC9kdHMvYXQ5MXNhbTl4NS5kdHNp
CisrKyBiL2xpbnV4LTMuMTYtcmM2L2FyY2gvYXJtL2Jvb3QvZHRzL2F0OTFzYW05eDUuZHRz
aQpAQCAtNjI0LDcgKzYyNCw4IEBACiAJCQkJCQlhdG1lbCxwaW5zID0KIAkJCQkJCQk8QVQ5
MV9QSU9BIDExIEFUOTFfUEVSSVBIX0EgQVQ5MV9QSU5DVFJMX05PTkUJLyogUEExMSBwZXJp
cGggQSBTUEkwX01JU08gcGluICovCiAJCQkJCQkJIEFUOTFfUElPQSAxMiBBVDkxX1BFUklQ
SF9BIEFUOTFfUElOQ1RSTF9OT05FCS8qIFBBMTIgcGVyaXBoIEEgU1BJMF9NT1NJIHBpbiAq
LwotCQkJCQkJCSBBVDkxX1BJT0EgMTMgQVQ5MV9QRVJJUEhfQSBBVDkxX1BJTkNUUkxfTk9O
RT47CS8qIFBBMTMgcGVyaXBoIEEgU1BJMF9TUENLIHBpbiAqLworCQkJCQkJCSBBVDkxX1BJ
T0EgMTMgQVQ5MV9QRVJJUEhfQSBBVDkxX1BJTkNUUkxfTk9ORQkvKiBQQTEzIHBlcmlwaCBB
IFNQSTBfU1BDSyBwaW4gKi8KKwkJCQkJCQkgQVQ5MV9QSU9BIDE0IEFUOTFfUEVSSVBIX0dQ
SU8gQVQ5MV9QSU5DVFJMX05PTkU+OyAvKiBzZXQgZnJvbSBST01CT09UIHRvIHBlcmlwaCBB
ICovCiAJCQkJCX07CiAJCQkJfTsKCg==
--------------050705080605090202000108--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
