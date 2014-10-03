From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Fri, 3 Oct 2014 09:24:08 -0700
Message-ID: <CALCETrVMrRA8AQ_nVui-MMy9R9FkRjz7tNYKp14OpPK-CQarHQ@mail.gmail.com>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com> <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net> <2386503.dNPayhXJTQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2386503.dNPayhXJTQ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 3, 2014 at 8:29 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 02 October 2014 12:05:27 Andy Lutomirski wrote:
>> On 10/02/2014 06:44 AM, Kalle Valo wrote:
>> > Hi Mark,
>> >
>> > Mark Rutland <mark.rutland-5wv7dgnIgG8-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org> writes:
>> >
>> >>> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
>> >>> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
>> >>> PCI devices.
>> >>>
>> >>> Some of the devices store the calibration data to the host flash and the
>> >>> bootloader reads the data from the flash. And now we need a method to
>> >>> deliver the calibration data from bootloader to ath10k.
>> >>
>> >> What does this calibration data consist of?
>> >
>> > From ath10k point of view it's just a binary blob which we push to the
>> > firmware before we start it. ath10k does not parse it in any way.
>> >
>> >> What happens if you don't have the calibration data? Is it a critical
>> >> requirement for the use of the device, or does its absence simply result
>> >> in degraded performance?
>> >
>> > From my point of view the device should not be used if it doesn't
>> > contain the correct calibration data. I guess it could work somehow but
>> > there's no guarantee about the perfomance.
>> >
>> >> What do you do on non-DT systems? Where does the information come from
>> >> in that case?
>> >
>> > Currently ath10k only supports having the calibration data in the OTP
>> > area inside the QCA98XX chip. But some manufacturers want to store it on
>> > the host file, I assume because of the flexibility it provides. And
>> > that's why we have the need for Device Tree support.
>>
>> To give an actual concrete example that might be what Kalle is talking
>> about:
>>
>> I have a TP-Link Archer C7, which has a mips cpu and an ath10k minipcie
>> device.  For whatever reason (I honestly have no clue whatsoever why the
>> hardware works this way), the calibration data is on a host flash
>> partition, not on the minipcie device's ROM or flash or whatever it is.
>
> Just to clarify: is this data specific to the design of the device and
> identical for all parts in a manufacture run, or does each individual
> board have to be calibrated separately?

Each board has separate data.  (Even the MAC address is in this blob
on my device.)

--Andy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
