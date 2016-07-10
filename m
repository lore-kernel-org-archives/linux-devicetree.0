From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 1/3] Documentation: dt: net: add ath9k
	wireless device binding
Date: Sun, 10 Jul 2016 22:54:50 +0200
Message-ID: <CAFBinCBbzMM0Pz8s444YE+NSN+035+o8PtNBoUn4v8yPMzG9Mw@mail.gmail.com>
References: <20160624123430.4097-1-martin.blumenstingl@googlemail.com>
	<20160709232834.31654-1-martin.blumenstingl@googlemail.com>
	<20160709232834.31654-2-martin.blumenstingl@googlemail.com>
	<1746957.vJhcHQMZVi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ath9k-devel-bounces@lists.ath9k.org>
In-Reply-To: <1746957.vJhcHQMZVi@wuerfel>
List-Unsubscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=unsubscribe>
List-Archive: <http://lists.ath9k.org/pipermail/ath9k-devel>
List-Post: <mailto:ath9k-devel@lists.ath9k.org>
List-Help: <mailto:ath9k-devel-request@lists.ath9k.org?subject=help>
List-Subscribe: <https://lists.ath9k.org/mailman/listinfo/ath9k-devel>,
	<mailto:ath9k-devel-request@lists.ath9k.org?subject=subscribe>
Sender: ath9k-devel-bounces@lists.ath9k.org
Errors-To: ath9k-devel-bounces@lists.ath9k.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arend.vanspriel@broadcom.com, pawel.moll@arm.com, mcgrof@do-not-panic.com, julian.calaby@gmail.com, ijc+devicetree@hellion.org.uk, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, robh+dt@kernel.org, ath9k-devel@lists.ath9k.org, galak@codeaurora.org, chunkeey@googlemail.com, kvalo@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 10, 2016 at 10:52 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Sunday, July 10, 2016 1:28:32 AM CEST Martin Blumenstingl wrote:
>> +- qca,check-eeprom-endianness: When enabled, the driver checks if the
>> +                               endianness of the EEPROM (based on the two
>> +                               magic bytes at the start of the EEPROM)
>> +                               matches the host system's native endianness.
>> +                               The data will be swapped accordingly if there
>> +                               is a mismatch.
>> +                               Leaving this disabled means that the EEPROM
>> +                               data will be interpreted in the system's
>> +                               native endianness, regardless of the magic
>> +                               bytes.
>> +                               Enable this option only when the magic bytes
>> +                               are known to indicate the correct endianness
>> +                               of the EEPROM data, because otherwise the
>> +                               EEPROM data may be swapped and thus may be
>> +                               parsed incorrectly.
>
> Defining properties in terms of "native" endianess is usually not a good
> idea, as some architectures (ARMv6+, PowerPC, ...) allow running either
> big-endian or little-endian without changing the endianess of device
> registers in the process.
>
> It's better to document the property as defaulting to a specific endianess
> unless you have an override or the autodetection flag, regardless of
> the CPU endianess.
ath9k reads the data from the EEPROM into memory. With that property
disabled ath9k simply assumes that the endianness of the values in the
EEPROM are having the correct endianness for the host system (in other
words: no swap is being applied).
I am not sure I understand you correctly, but isn't what you are
explaining an issue in the ath9k code, rather than in this
documentation?
