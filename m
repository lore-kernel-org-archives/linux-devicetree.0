From: Adrian Chadd <adrian@freebsd.org>
Subject: Re: [PATCH v2 0/7] ath9k: EEPROM swapping improvements
Date: Tue, 13 Dec 2016 22:45:51 -0800
Message-ID: <CAJ-Vmo=3zox7QkFUA-3yxtvSTzPT4GiFkoOUU3cPTXSN4xV8vQ@mail.gmail.com>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
	<20161002222913.12223-1-martin.blumenstingl@googlemail.com>
	<87insxg0yc.fsf@kamboji.qca.qualcomm.com>
	<871sxza9al.fsf@kamboji.qca.qualcomm.com>
	<CAFBinCC6JWBhZwma=66fBi3_to2SaHOMNDQS23jHNhcc+RUcYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <CAFBinCC6JWBhZwma=66fBi3_to2SaHOMNDQS23jHNhcc+RUcYQ@mail.gmail.com>
List-Unsubscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=unsubscribe>
List-Archive: <http://lists.ath9k.org/pipermail/ath9k-devel>
List-Post: <mailto:ath9k-devel@lists.ath9k.org>
List-Help: <mailto:ath9k-devel-request@lists.ath9k.org?subject=help>
List-Subscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=subscribe>
Sender: ath9k-devel-bounces@lists.ath9k.org
Errors-To: ath9k-devel-bounces@lists.ath9k.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath9k-devel <ath9k-devel@qca.qualcomm.com>, "Valo,
	Kalle" <kvalo@qca.qualcomm.com>, "ath9k-devel@lists.ath9k.org" <ath9k-devel@lists.ath9k.org>, "chunkeey@googlemail.com" <chunkeey@googlemail.com>, "nbd@nbd.name" <nbd@nbd.name>
List-Id: devicetree@vger.kernel.org

hi,

On 12 December 2016 at 12:05, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

>
> It seems that there are a few devices out there where the whole EEPROM
> is swab16'ed which switches the position of the 1-byte fields
> opCapFlags and eepMisc.
> those still work fine with the new code, however I had a second patch
> in LEDE [0] which results in ath9k_platform_data.endian_check NOT
> being set anymore.
> that endian_check flag was used before to swab16 the whole EEPROM, to
> correct the position of the 1-byte fields again.
> Currently we are fixing this in the firmware hotplug script: [1]
> This is definitely not a blocker for this series though (if we want to
> have a devicetree replacement for "ath9k_platform_data.endian_check"
> then I'd work on that within a separate series, but I somewhat
> consider these EEPROMs as "broken" so fixing them in
> userspace/firmware hotplug script is fine for me)

As a reference - the reference driver has been doign this for a while.
It attempts to detect the endianness by looking at the 0xa55a
signature endian and figuring out which endian the actual contents are
in.

So just FYI yeah, this is a "thing" for reasons I don't quite know.



-adrian

>
>
> Regards,
> Martin
>
>
> [0] https://git.lede-project.org/?p=source.git;a=commitdiff;h=a20616863d32d91163043b6657a63c836bd9c5ba
> [1] https://git.lede-project.org/?p=source.git;a=commitdiff;h=afa37092663d00aa0abf8c61943d9a1b5558b144
