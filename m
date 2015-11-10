From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: Add bindings for Secure-only devices
Date: Tue, 10 Nov 2015 14:54:13 +0000
Message-ID: <CAFEAcA8tLTmb3kOmnddxcMhEP1KZ-iS-N53CVBxHqfVioDKFvQ@mail.gmail.com>
References: <1446127303-5082-1-git-send-email-peter.maydell@linaro.org>
 <CAL_JsqJz+w2SYEBLVGdZNS6J1tmt5VWV0q1G_Z2rgFfch6J=2A@mail.gmail.com>
 <CAFEAcA8qgFFhrmXePtO_xQx=YEHK8dSA-1SacR5NsQWSNTwj-w@mail.gmail.com> <20151110145146.GA1551@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151110145146.GA1551@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10 November 2015 at 14:51, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, Oct 30, 2015 at 08:07:34PM +0000, Peter Maydell wrote:
>> +    status = "okay"; secure-status = "okay"; // ditto
>> +    secure-status = "okay";                  // ditto
>> +    // neither explicitly defined: ditto
>>
>> (Do you want the full set of 9 options you get from multiplying
>> out "okay" vs "disabled" vs not-set for each property?)
>
> Better to err on completeness. The inheritance is easily missed.
>
> Also, one nit. Use C style comments so when people copy-n-paste this it
> is the correct style.

OK; I'll send out a v2 with these fixes.

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
