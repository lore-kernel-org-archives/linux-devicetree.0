From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH alt 4/4] pinctrl: at91: rework debounce configuration
Date: Mon, 16 Sep 2013 10:41:22 -0600
Message-ID: <523734B2.6050208@wwwdotorg.org>
References: <1379058213-3245-1-git-send-email-b.brezillon@overkiz.com> <1379058813-3489-1-git-send-email-b.brezillon@overkiz.com> <52339479.6030402@wwwdotorg.org> <52340B68.5020505@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52340B68.5020505-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/14/2013 01:08 AM, boris brezillon wrote:
> Hello Stephen,
>=20
> Le 14/09/2013 00:40, Stephen Warren a =E9crit :
>> On 09/13/2013 01:53 AM, Boris BREZILLON wrote:
>>> AT91 SoCs do not support per pin debounce time configuration.
>>> Instead you have to configure a debounce time which will be used fo=
r all
>>> pins of a given bank (PIOA, PIOB, ...).
=2E..
>>>   Required properties for pin configuration node:
=2E..
>>> -DEBOUNCE_VAL    (0x3fff << 17): debounce val.
>>
>> This change would break the DT ABI since it removes a feature that's
>> already present.
=2E..
>> I suppose it's still up to the Atmel maintainers to decide whether t=
his
>> is appropriate, or whether the impact to out-of-tree DT files would =
be
>> problematic.
>>
>> Assuming the DT ABI can be broken, I think I'd prefer to do so, rath=
er
>> than take "non-alt" patch 4/4, since a per-pin DEBOUNCE_VAL clearly
>> doesn't correctly model the HW, assuming the patch description is
>> correct. I don't think arguments re: the generic pinconf debounce
>> property hold; if the Linux-specific/internal generic property doesn=
't
>> apply, the DT binding should not be bent to adjust to it, but should
>> rather still represent the HW itself.
>=20
> What about the last point in my list: "reconfigure debounce after
> startup" ?
>=20
> Here is an example that may be problematic:
>=20
> Let's say you have one device using multiple configuration of pins
> ("default", "xxx", "yyy").
> The "default" config needs a particular debounce time on a given pin =
and
> the "xxx" and "yyy"
> configs need different debounce time on the same pin.
>=20
> How would you solve this with this patch approach ?

Each state has a different pin configuration node, and hence can specif=
y
a different debounce value. This patch has no impact on that (it just
changes whether the state-specific node specifies the debounce value in
a single standalone property, or encodes it into each entry in the pins
property, all within the same node).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
