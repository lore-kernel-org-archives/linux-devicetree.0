From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/5] ath9k: Make EEPROM endianness
	swapping configurable via devicetree
Date: Mon, 29 Aug 2016 23:25:37 +0200
Message-ID: <201608292325.38091.arnd@arndb.de>
References: <20160821144906.30984-1-martin.blumenstingl@googlemail.com>
	<201608291410.44338.arnd@arndb.de>
	<CAFBinCCSBE8KsLgP3t=FzB-2jgjfQBtuF+EjqQEk-7mmmps_Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <CAFBinCCSBE8KsLgP3t=FzB-2jgjfQBtuF+EjqQEk-7mmmps_Pg@mail.gmail.com>
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

On Monday 29 August 2016, Martin Blumenstingl wrote:
> > and then do a swab32() on them. I suspect these should just be __le32
> > (and __le16, respectively where needed), using appropriate accessors
> > everywhere that those fields are being read instead of having one function
> > that tries to turn them into cpu-native ordering.
> I'm not sure if we want those fields to be __le32:
> BIT(0) in the eepMisc field indicates whether to interpret the data as
> big or little endian.
> When this bit is set we would want these fields to be __be32 instead -
> so I guess the current implementation is "OK" for this specific
> use-case.

Ok, I see. It's still confusing because it's different from how other
drivers handle this (case in point: I was very confused by this). 

Do you see any downsides in changing the code to consistently annotate
the eeprom as either __le or __be (whichever is more common), using
the respective endianess accessors, and then doing the swap if the
data we read is the opposite way?

	Arnd
