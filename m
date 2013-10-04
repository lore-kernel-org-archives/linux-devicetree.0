From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/2] Add support for Qualcomm's PRNG
Date: Fri, 04 Oct 2013 19:23:50 +0300
Message-ID: <524EEB96.6040707@mm-sol.com>
References: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com> <20131003165130.GA11974@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131003165130.GA11974-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-F6s6mLieUQo7FNHlEwC/lvQIK84fMopw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Ted,

On 10/03/2013 07:51 PM, Theodore Ts'o wrote:
> On Thu, Oct 03, 2013 at 05:52:33PM +0300, Stanimir Varbanov wrote:
>> This patch set adds hardware RNG driver wich is used to control the
>> Qualcomm's PRNG hardware block.
>> The first patch document the DT bindings needed to sucessfuly probe
>> the driver and the second patch adds the driver.
> 
> Is this really a PRNG (pseudo-random number generator)?  What are the
> guarantees which Qualcomm is providing for the PRNG?  If it's really a
> PRNG such as AES(i++, NSA_KEY), then kudo to Qualcomm for being
> honest.
> 
> If it is supposed to be (or at least claimed to be) a secure random
> number generator ala RDRAND suitable for use in cryptographic
> applications, calling it a PRNG is going to be a bit misleading.

I guess that it should follow NIST 800-90 recommendation, but I'm not
aware what DRBG mechanism is used.

To be honest I really don't know the hardware implementation details. I
put PRNG abbreviation in the cover letter just because I saw that
defines for register offsets are prefixed with PRNG_*. I could rename
all occurrences of PRNG to RNG. Is that will be enough to avoid confusions?

regadrs,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
