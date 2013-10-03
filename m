From: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
Subject: Re: [PATCH 0/2] Add support for Qualcomm's PRNG
Date: Thu, 3 Oct 2013 12:51:30 -0400
Message-ID: <20131003165130.GA11974@thunk.org>
References: <1380811955-18085-1-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380811955-18085-1-git-send-email-svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-F6s6mLieUQo7FNHlEwC/lvQIK84fMopw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 03, 2013 at 05:52:33PM +0300, Stanimir Varbanov wrote:
> This patch set adds hardware RNG driver wich is used to control the
> Qualcomm's PRNG hardware block.
> The first patch document the DT bindings needed to sucessfuly probe
> the driver and the second patch adds the driver.

Is this really a PRNG (pseudo-random number generator)?  What are the
guarantees which Qualcomm is providing for the PRNG?  If it's really a
PRNG such as AES(i++, NSA_KEY), then kudo to Qualcomm for being
honest.

If it is supposed to be (or at least claimed to be) a secure random
number generator ala RDRAND suitable for use in cryptographic
applications, calling it a PRNG is going to be a bit misleading.

Cheers,

						- Ted
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
