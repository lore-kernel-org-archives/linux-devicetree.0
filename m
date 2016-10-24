From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH/RFT v2 09/17] regulator: fixed: Add over current event
Date: Mon, 24 Oct 2016 20:11:40 +0200
Message-ID: <CAKXjFTNZhWTZSXtLZo8EieBtAPn_J-MM+-g8yCRJiV6UBspB9Q@mail.gmail.com>
References: <20161024164634.4330-1-ahaslam@baylibre.com> <20161024164634.4330-10-ahaslam@baylibre.com>
 <20161024175320.GO17252@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161024175320.GO17252-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 7:53 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Oct 24, 2016 at 06:46:26PM +0200, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
>
>> +             if (ret) {
>> +                     pr_err("Failed to request irq: %d\n", ret);
>
> dev_err()
>
>> +++ b/include/linux/regulator/consumer.h
>> @@ -74,6 +74,10 @@
>>   *             the most noisy and may not be able to handle fast load
>>   *             switching.
>>   *
>> + * OVERCURRENT Regulator has detected an overcurrent condition, and
>> + *             may be limiting the supply output.
>> + *
>> + *
>>   * NOTE: Most regulators will only support a subset of these modes. Some
>>   * will only just support NORMAL.
>>   *
>> @@ -84,6 +88,7 @@
>>  #define REGULATOR_MODE_NORMAL                        0x2
>>  #define REGULATOR_MODE_IDLE                  0x4
>>  #define REGULATOR_MODE_STANDBY                       0x8
>> +#define REGULATOR_MODE_OVERCURRENT           0x10
>
> This is adding a new core feature with a new mode and should have been
> split out of the driver specific change with a spearate changelog.  Why

Ok, will do.

> does it make sense to report this as a mode, we don't report other error
> conditions as modes but instead use REGULATOR_STATUS_ with the
> get_status() operation?

I used mode, because when the regulator toggles the overcurrent
line, it means that it has entered a current limited mode, at least the
regulator im looking at. ill change to STATUS

Regards
Axel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
