From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: ath10k: calibration data through Device Tree?
Date: Thu, 02 Oct 2014 12:05:27 -0700
Message-ID: <542DA1F7.9090904@amacapital.net>
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>	<20141002132914.GN5788@leverpostej> <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ppeamvr9.fsf-HodKDYzPHsUD5k0oWYwrnHL1okKdlPRT@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/02/2014 06:44 AM, Kalle Valo wrote:
> Hi Mark,
> 
> Mark Rutland <mark.rutland-5wv7dgnIgG8-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org> writes:
> 
>>> ath10k is a wireless driver for Qualcomm Atheros 802.11ac hardware and
>>> located in drivers/net/wireless/ath/ath10k/. Currently it only supports
>>> PCI devices.
>>>
>>> Some of the devices store the calibration data to the host flash and the
>>> bootloader reads the data from the flash. And now we need a method to
>>> deliver the calibration data from bootloader to ath10k. 
>>
>> What does this calibration data consist of?
> 
> From ath10k point of view it's just a binary blob which we push to the
> firmware before we start it. ath10k does not parse it in any way.
> 
>> What happens if you don't have the calibration data? Is it a critical
>> requirement for the use of the device, or does its absence simply result
>> in degraded performance?
> 
> From my point of view the device should not be used if it doesn't
> contain the correct calibration data. I guess it could work somehow but
> there's no guarantee about the perfomance.
> 
>> What do you do on non-DT systems? Where does the information come from
>> in that case?
> 
> Currently ath10k only supports having the calibration data in the OTP
> area inside the QCA98XX chip. But some manufacturers want to store it on
> the host file, I assume because of the flexibility it provides. And
> that's why we have the need for Device Tree support.

To give an actual concrete example that might be what Kalle is talking
about:

I have a TP-Link Archer C7, which has a mips cpu and an ath10k minipcie
device.  For whatever reason (I honestly have no clue whatsoever why the
hardware works this way), the calibration data is on a host flash
partition, not on the minipcie device's ROM or flash or whatever it is.

Needless to say, the mainline ath10k driver won't load on it.  (An old
version used to load without calibration data.  It didn't work very well.)

Presuambly the idea is that, if things like this used DT (which mine
doesn't, I presume), then ath10k could get the calibration data via DT.
 And maybe some vendors of ARM-based wifi devices are planning on
playing similar games, and they do use DT.

--Andy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
