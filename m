From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/5] ath9k: Make EEPROM endianness
	swapping configurable via devicetree
Date: Tue, 30 Aug 2016 09:57:24 +0200
Message-ID: <201608300957.24770.arnd@arndb.de>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
	<201608292325.38091.arnd@arndb.de>
	<CAFBinCCXqX1F3XpU-DFLLB5ZNjU1XVNiTLR-ZB34QgrL8uyv8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <CAFBinCCXqX1F3XpU-DFLLB5ZNjU1XVNiTLR-ZB34QgrL8uyv8Q@mail.gmail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, robh+dt@kernel.org, ath9k-devel@lists.ath9k.org, chunkeey@googlemail.com, kvalo@codeaurora.org, nbd@nbd.name
List-Id: devicetree@vger.kernel.org

On Tuesday 30 August 2016, Martin Blumenstingl wrote:
> new logic (assuming that we went for __le16/__le32 fields):
> - reading data: use le16_to_cpu and le32_to_cpu for all fields
> 
> LE system:
> - LE EEPROM -> no swap will be applied
> - BE EEPROM -> be16_to_cpu / be32_to_cpu (or swab16 / swab32 as before)
> BE system:
> - LE EEPROM -> le16_to_cpu / le32_to_cpu (or swab16 / swab32 as before)
> - BE EEPROM -> no swap will be applied

I think this should be:

LE and BE systems:
 - LE EEPROM -> no swap will be applied
 - BE EEPROM -> or swab16 / swab32

The upside of this is that we no longer care about what the CPU is,
and in my opinion that makes the code easier to understand.

> There is one downside of the "new approach" I can think of: you need
> to swap the data twice in some cases (BE EEPROM on a BE machine).
> - first swap while writing the data to __le16/__le32 fields
> - second swap while reading the data from the __le16/__le32 fields
> If you forget to swap a field in either place then things will be broken.

Correct. Fortunately, "make C=1" with sparse helps you find those bugs
at compile time.

> Maybe someone else wants to state his/her opinion on this - I guess
> some fresh thoughts could help us a lot!

Yes, that would be helpful. It's possible I'm missing something here,
or that changing this will just add confusion with other people.

	Arnd
